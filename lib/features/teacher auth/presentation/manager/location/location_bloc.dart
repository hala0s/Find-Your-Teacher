import 'package:bloc/bloc.dart';
import 'package:find_your_teacher/features/teacher%20auth/domain/entities/location_entities.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/bloc/app_state_bloc.dart';
import '../../../data/models/location_model.dart';
import '../../../domain/use_cases/location.dart';

part 'location_event.dart';

part 'location_state.dart';

@injectable
class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final LocationUseCase locationUseCase;

  LocationBloc(this.locationUseCase) : super(LocationState()) {
    on<LocationEvent>((event, emit) async {
      emit(state.copWith(locationsState: BlocStateData.loading()));
      final location = await locationUseCase();
      location.fold(
          (l) => emit(state.copWith(locationsState: BlocStateData.failed())),
          (r) => emit(state.copWith(
              locationsState: BlocStateData.success(state.locations.data))));
    });
  }
}
