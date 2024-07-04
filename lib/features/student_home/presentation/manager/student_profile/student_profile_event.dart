part of 'student_profile_bloc.dart';

@immutable
abstract class StudentProfileEvent {}

class GetTeacherBySubEvent extends StudentProfileEvent {
  final String subjectId;
  final bool? active;
  final VoidCallback onSuccess;

  GetTeacherBySubEvent(
      {required this.subjectId, required this.onSuccess, this.active});
}

class GetStudentSubjectsEvent extends StudentProfileEvent {}

class Refresh extends StudentProfileEvent {}

class GetStudentProfileEvent extends StudentProfileEvent {
  final String? id;

  GetStudentProfileEvent({ this.id});
}
class OnRefreshEvent extends StudentProfileEvent{
  final String? id;

  OnRefreshEvent({ this.id});

}