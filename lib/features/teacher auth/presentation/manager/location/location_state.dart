part of 'location_bloc.dart';

@immutable
class LocationState {
  final BlocStateData<LocationModel> locations;

  LocationState({
    this.locations = const BlocStateData.init(),
  });

  copWith({
    BlocStateData<LocationModel>? locationsState,
  }) =>
      LocationState(
        locations: locationsState ?? this.locations,
      );
}
