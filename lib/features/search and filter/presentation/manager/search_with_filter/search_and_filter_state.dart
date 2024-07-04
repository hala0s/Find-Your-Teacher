part of 'search_and_filter_bloc.dart';

@immutable
class SearchAndFilterState {
  final BlocStateData<TeacherAfterFilterModel> filterState ;
  final BlocStateData<FilterModel> getFilterState ;
  final BlocStateData<SearchModel> searchState;
  final BlocStateData<LocationSearchModel> locationSearchState;
  const SearchAndFilterState({ this.filterState=const BlocStateData.init(),
    this.getFilterState=const BlocStateData.init(),this.searchState=const BlocStateData.init(),
    this.locationSearchState =const BlocStateData.init()
  });
  copWith({
    BlocStateData<TeacherAfterFilterModel>? filterState,
    BlocStateData<FilterModel>? getFilterState,
    BlocStateData<SearchModel>? searchState,
    BlocStateData<LocationSearchModel>?    locationSearchState,

  }) =>
      SearchAndFilterState(
          filterState: filterState ?? this.filterState,
          getFilterState: getFilterState ?? this.getFilterState,
          searchState: searchState?? this.searchState,
          locationSearchState: locationSearchState?? this.locationSearchState

      );
}


