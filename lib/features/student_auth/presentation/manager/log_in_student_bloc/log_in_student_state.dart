part of 'log_in_student_bloc.dart';

@immutable
 class LogInStudentState {
  final BlocStateData<AuthModel>logInState;
  const LogInStudentState(
      {this.logInState = const BlocStateData.init(),
      });
  copWith({
    BlocStateData<AuthModel>? logInState,
  }) =>
      LogInStudentState(
        logInState: logInState ?? this.logInState,

      );
}


