part of 'sign_up_teacher_bloc.dart';

@immutable
class SignUpTeacherState {
  final BlocStateData<TeacherEntities>signUpTeacherState;

   SignUpTeacherState(
      {this.signUpTeacherState = const BlocStateData.init(),
      });
  copWith({
    BlocStateData<TeacherEntities>? signUpState,
  }) =>
      SignUpTeacherState(
        signUpTeacherState: signUpState ?? this.signUpTeacherState,

      );
}
