part of 'teacher_activate_bloc.dart';

@immutable
class TeacherActivateState {
  final BlocStateData<TeacherActivateModel> activateState;

  const TeacherActivateState({this.activateState = const BlocStateData.init()});

  copyWith({
    BlocStateData<TeacherActivateModel>? activateState,
  }) =>
      TeacherActivateState(
        activateState: activateState ?? this.activateState,
      );
}
