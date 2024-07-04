part of 'get_teacher_profile_bloc.dart';

@immutable
class GetTeacherProfileState {
  final BlocStateData<TeacherProfileModel> teacherProfile;

  GetTeacherProfileState({
    this.teacherProfile = const BlocStateData.init(),
  });

  copWith({
    BlocStateData<TeacherProfileModel>? teacherProfile,
  }) =>
      GetTeacherProfileState (
        teacherProfile: teacherProfile ?? this.teacherProfile,
      );
}

