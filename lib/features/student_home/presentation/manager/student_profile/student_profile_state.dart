part of 'student_profile_bloc.dart';

class StudentProfileState {
  BlocStateData<TeacherByIdModel> studentProfileState;
  BlocStateData<GetStudentSubjectsModel> subjectsState;
  BlocStateData<StudentProfileModel> profileState;

  StudentProfileState({
    this.studentProfileState = const BlocStateData.init(),
    this.subjectsState = const BlocStateData.init(),
    this.profileState = const BlocStateData.init(),
  });

  copyWith({
    BlocStateData<TeacherByIdModel>? studentProfileState,
    BlocStateData<GetStudentSubjectsModel>? subjectsState,
    BlocStateData<StudentProfileModel>? profileState,
  }) =>
      StudentProfileState(
        studentProfileState: studentProfileState ?? this.studentProfileState,
        subjectsState: subjectsState ?? this.subjectsState,
        profileState: profileState ?? this.profileState,
      );
}
