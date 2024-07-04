import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:find_your_teacher/core/bloc/app_state_bloc.dart';
import 'package:find_your_teacher/features/student_auth/data/data_sources/local_data_source.dart';
import 'package:find_your_teacher/features/student_home/data/models/student_profile_model.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../data/models/student_subjetcs_model.dart';
import '../../../data/models/teacher_by_sub_id_model.dart';
import '../../../domain/use_cases/profile_usecase.dart';
import '../../../domain/use_cases/student_profile_usecase.dart';

part 'student_profile_event.dart';

part 'student_profile_state.dart';

@injectable
class StudentProfileBloc
    extends Bloc<StudentProfileEvent, StudentProfileState> {
  StudentProfileUseCase studentProfileUseCase;
  StudentSubjectsUseCase studentSubjectsUseCase;
  GetStudentProfileUseCase getStudentProfileUseCase;

  StudentProfileBloc(this.studentProfileUseCase, this.studentSubjectsUseCase,
      this.getStudentProfileUseCase)
      : super(StudentProfileState()) {
    on<GetTeacherBySubEvent>((event, emit) async {
      emit(state.copyWith(studentProfileState: const BlocStateData.loading()));
      SubjectIdParam subjectIdParam = SubjectIdParam(
          subjectId: event.subjectId, active: event.active ?? true);
      final getSubjectsById = await studentProfileUseCase(subjectIdParam);
      getSubjectsById.fold(
              (l) =>
              emit(state.copyWith(
                  studentProfileState: const BlocStateData.failed())),
              (r) =>
              emit(
                  state.copyWith(
                      studentProfileState: BlocStateData.success(r))));
      event.onSuccess();
    });
    on<GetStudentSubjectsEvent>((event, emit) async {
      emit(state.copyWith(subjectsState: const BlocStateData.loading()));

      final getSubjects = await studentSubjectsUseCase();
      getSubjects.fold(
              (l) =>
              emit(state.copyWith(subjectsState: const BlocStateData.failed())),
              (r) =>
              emit(state.copyWith(subjectsState: BlocStateData.success(r))));
    });
    on<GetStudentProfileEvent>((event, emit) async {
      emit(state.copyWith(profileState: const BlocStateData.loading()));
      StudentIdParam studentIdParam = StudentIdParam(
          studentId: event.id ?? "${await AuthImpLocalDataSource().getId()}");
      final getProfile = await getStudentProfileUseCase(studentIdParam);
      getProfile.fold(
              (l) =>
              emit(state.copyWith(profileState: const BlocStateData.failed())),
              (r) =>
              emit(state.copyWith(profileState: BlocStateData.success(r))));
    });
  }
}
