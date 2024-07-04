part of 'complete_teacher_profile1_bloc.dart';

@immutable
class CompleteTeacherProfile1State {
  final BlocStateData<TeacherEntities>completeTeacherProfile1;
  CompleteTeacherProfile1State(
      {this.completeTeacherProfile1 = const BlocStateData.init(),
      });
  copWith({
    BlocStateData<TeacherEntities>? completeTeacher1State,
  }) =>
      CompleteTeacherProfile1State(
        completeTeacherProfile1: completeTeacher1State??this.completeTeacherProfile1,

      );
}



