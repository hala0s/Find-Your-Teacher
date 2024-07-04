part of 'top_teachers_bloc.dart';

@immutable
 abstract class TopTeachersEvent {}
class GetTopTeachersEvent extends TopTeachersEvent{
  final bool? active;

  GetTopTeachersEvent({this.active});
}
class TopTeachersByIdEvent extends TopTeachersEvent{
  final String userId ;
  final VoidCallback onSuccess;

  TopTeachersByIdEvent({required this.userId, required this.onSuccess});
}