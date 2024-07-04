part of 'log_in_teacher_bloc.dart';

@immutable
class LogInTeacherState {
  final BlocStateData<TeacherEntities>logInUpTeacherState;
  LogInTeacherState(
      {this.logInUpTeacherState = const BlocStateData.init(),
      });
  copWith({
    BlocStateData<TeacherEntities>? logInState,
  }) =>
      LogInTeacherState(
        logInUpTeacherState: logInState??this.logInUpTeacherState,

      );
}


