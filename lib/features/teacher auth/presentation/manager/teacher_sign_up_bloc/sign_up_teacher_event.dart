part of 'sign_up_teacher_bloc.dart';

@immutable
class SignUpTeacherEvent {
  final String teacherPhoneNumber;
  final String teacherPassword;
  final String teacherName;
  final String teacherGender;
  final String role;
  final VoidCallback onSuccess;
  final String fcmToken;

  SignUpTeacherEvent(
      {required this.teacherPhoneNumber,
        required this.fcmToken,
        required this.teacherName,
        required this.teacherGender,
      required this.teacherPassword,
      required this.role,
      required this.onSuccess});
}
