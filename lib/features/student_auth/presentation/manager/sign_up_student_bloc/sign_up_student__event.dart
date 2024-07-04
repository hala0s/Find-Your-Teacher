part of 'sign_up_student__bloc.dart';

@immutable
 class SignUpStudentEvent {
  final String studentName;
final String studentGender;
  final String studentStudentPhoneNumber;
  final String studentPassword;
  final String role;
  final VoidCallback onSuccess;
  final String fcmToken;


 const  SignUpStudentEvent(
      {required this.studentName,
required this.studentGender,
required this.fcmToken,
        required this.role,
      required this.studentStudentPhoneNumber,
        required this.onSuccess,
      required this.studentPassword}
     );
}
