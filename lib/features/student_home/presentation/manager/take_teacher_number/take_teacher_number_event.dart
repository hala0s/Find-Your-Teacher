part of 'take_teacher_number_bloc.dart';

@immutable
 class TakeTeacherNumberEvent {
  final String userId;
  final VoidCallback onSuccess;

  const TakeTeacherNumberEvent({required this.userId,required this.onSuccess});
}
