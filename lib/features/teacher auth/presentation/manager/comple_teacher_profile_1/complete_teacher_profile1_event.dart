part of 'complete_teacher_profile1_bloc.dart';

@immutable
class CompleteTeacherProfile1Event {
  final String teacherName;
  final String? teacherGender;
  final String teacherDateBirth;
  final File ?teacherImage;
  final VoidCallback onSuccess;

  CompleteTeacherProfile1Event(
      {required this.teacherName,
        required this.onSuccess,
        required this.teacherImage,
      required this.teacherGender,
      required this.teacherDateBirth,
      });
}
