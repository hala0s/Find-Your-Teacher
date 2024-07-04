part of 'available_for_students_bloc.dart';

@immutable
class AvailableForStudentsState {
  final BlocStateData<AvailableModel> availableForStudents;

  AvailableForStudentsState({
    this.availableForStudents = const BlocStateData.init(),
  });

  copWith({
    BlocStateData<AvailableModel>? availableForStudentsState,
  }) =>
      AvailableForStudentsState(
        availableForStudents:
            availableForStudentsState ?? this.availableForStudents,
      );
}
