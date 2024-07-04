part of 'sign_up_student__bloc.dart';

@immutable
class SignUpStudentState {
  final BlocStateData<AuthModel> signInState;
  const SignUpStudentState(
      {this.signInState = const BlocStateData.init(),
      });
  copWith({
    BlocStateData<AuthModel>? signInState,
  }) =>
      SignUpStudentState(
        signInState: signInState ?? this.signInState,

      );
}

