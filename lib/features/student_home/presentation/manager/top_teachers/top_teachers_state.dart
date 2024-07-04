part of 'top_teachers_bloc.dart';

@immutable
class TopTeachersState {
  final BlocStateData<TopTeachersModel> topTeachersState;
  final BlocStateData<TeacherByUserIdModel> topTeachersByIdState;

  const TopTeachersState(
      {this.topTeachersState = const BlocStateData.init(),
      this.topTeachersByIdState = const BlocStateData.init()});
  copyWith({
    BlocStateData<TopTeachersModel>? topTeachersState,
    BlocStateData<TeacherByUserIdModel>? topTeachersByIdState,
  }) =>
      TopTeachersState(
        topTeachersState: topTeachersState ?? this.topTeachersState,
        topTeachersByIdState: topTeachersByIdState ?? this.topTeachersByIdState,
      );
}
