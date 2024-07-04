import 'dart:ui';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import '../../../../../core/bloc/app_state_bloc.dart';
import '../../../data/models/filter_model.dart';
import '../../../data/models/location_search_model.dart';
import '../../../data/models/search_model.dart';
import '../../../data/models/teachers_after_filter_model.dart';
import '../../../domain/use_cases/filter_use_case.dart';
import '../../../domain/use_cases/location_search_usecase.dart';
import '../../../domain/use_cases/search_usecase.dart';

part 'search_and_filter_event.dart';

part 'search_and_filter_state.dart';

@injectable
class SearchAndFilterBloc
    extends Bloc<SearchAndFilterEvent, SearchAndFilterState> {
  final FilterTeacherUseCase filterTeacherUseCase;
  final GetFilterUseCase getFilterUseCase;
  final SearchUseCase searchUseCase;
  final LocationSearchUseCase locationSearchUseCase;

  SearchAndFilterBloc(this.filterTeacherUseCase, this.searchUseCase,
      this.getFilterUseCase, this.locationSearchUseCase)
      : super(SearchAndFilterState()) {
    on<FilterEvent>((event, emit) async {
      emit(state.copWith(filterState: const BlocStateData.loading()));
      FilterParams filterParams = FilterParams(
          subjectIds: event.subjectIds,
          locationIds: event.locationIds,
          academicLevelIds: event.academicLevels,
          genderName: event.genderName,
          maxPrice: event.maxPrice ?? 0,
          active: event.active ?? true);
      final filter = await filterTeacherUseCase(filterParams);
      filter.fold(
          (l) => emit(state.copWith(filterState: const BlocStateData.failed())),
          (r) => emit(state.copWith(filterState: BlocStateData.success(r))));
      event.onSuccess();
    });
    on<GetFilterEvent>((event, emit) async {
      emit(state.copWith(getFilterState: const BlocStateData.loading()));

      final getFilter = await getFilterUseCase();
      getFilter.fold(
          (l) =>
              emit(state.copWith(getFilterState: const BlocStateData.failed())),
          (r) => emit(state.copWith(getFilterState: BlocStateData.success(r))));
    });
    on<SearchEvent>((event, emit) async {
      emit(state.copWith(searchState: const BlocStateData.loading()));
      SearchParams searchParams =
          SearchParams(userName: event.userName, role: event.role);
      final search = await searchUseCase(searchParams);
      search.fold(
          (l) => emit(state.copWith(searchState: const BlocStateData.failed())),
          (r) => emit(state.copWith(searchState: BlocStateData.success(r))));
    });

    on<LocationSearchEvent>((event, emit) async {
      emit(state.copWith(locationSearchState: const BlocStateData.loading()));
      SearchParam searchParam = SearchParam(search: event.word);
      final wordSearch = await locationSearchUseCase(searchParam);
      wordSearch.fold(
          (l) => emit(
              state.copWith(locationSearchState: const BlocStateData.failed())),
          (r) => emit(
              state.copWith(locationSearchState: BlocStateData.success(r))));
    });
  }
}
