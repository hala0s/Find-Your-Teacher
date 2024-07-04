part of 'log_in_teacher_bloc.dart';

@immutable
class LogInTeacherEvent {
  final String teacherPassWord;
  final String teacherPhone;
  final VoidCallback onSuccess;
  final String ?fcmToken;


  LogInTeacherEvent(
      {required this.teacherPassWord,
      required this.teacherPhone,
        required this.fcmToken,

      required this.onSuccess,
      });
}
