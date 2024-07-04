import 'package:equatable/equatable.dart';

class LocationEntities extends Equatable {
  LocationEntities({required this.locations});

  @override
  List<Object?> get props => [];
  final List<String>locations;
}
