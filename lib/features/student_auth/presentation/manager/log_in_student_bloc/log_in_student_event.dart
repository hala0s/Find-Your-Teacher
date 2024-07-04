part of 'log_in_student_bloc.dart';

@immutable
class LogInStudentEvent {
  final String studentPhoneNumber;
  final String studentPassword;
  final VoidCallback onSuccess;
  final String ?fcmToken;

  const LogInStudentEvent(
      {required this.studentPhoneNumber,
      required this.studentPassword,
        required this.fcmToken,

      required this.onSuccess});
}
