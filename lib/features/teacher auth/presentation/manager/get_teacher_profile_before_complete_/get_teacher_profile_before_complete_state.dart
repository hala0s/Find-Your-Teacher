part of 'get_teacher_profile_before_complete_bloc.dart';

@immutable
abstract class GetTeacherProfileBeforeCompleteState {}
class  GetTeacherProfileBeforeCompleteInitialState extends  GetTeacherProfileBeforeCompleteState{}
class  GetTeacherProfileBeforeCompleteLoadingState extends  GetTeacherProfileBeforeCompleteState{}
class  GetTeacherProfileBeforeCompleteSuccessState extends  GetTeacherProfileBeforeCompleteState{
  final GetTeacherProfileEntities getTeacherProfileEntities;
  GetTeacherProfileBeforeCompleteSuccessState({required this.getTeacherProfileEntities});
  @override
  List<Object?> get props => [getTeacherProfileEntities];
}
class  GetTeacherProfileBeforeCompleteFailState extends  GetTeacherProfileBeforeCompleteState{}

