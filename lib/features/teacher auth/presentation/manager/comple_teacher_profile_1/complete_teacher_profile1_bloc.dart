import 'dart:io';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:find_your_teacher/features/teacher%20auth/domain/use_cases/complete_teacher_profile_1.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/bloc/app_state_bloc.dart';
import '../../../domain/entities/teacher_entities.dart';

part 'complete_teacher_profile1_event.dart';

part 'complete_teacher_profile1_state.dart';

@injectable
class CompleteTeacherProfile1Bloc
    extends Bloc<CompleteTeacherProfile1Event, CompleteTeacherProfile1State> {
  final CompleteTeacherProfileUseCase1 completeTeacherProfileUseCase1;

  CompleteTeacherProfile1Bloc(this.completeTeacherProfileUseCase1)
      : super(CompleteTeacherProfile1State()) {
    on<CompleteTeacherProfile1Event>((event, emit) async {
      emit(state.copWith(completeTeacher1State: const BlocStateData.loading()));
      CompleteTeacherParams params = CompleteTeacherParams(
        teacherImage: event.teacherImage,
        teacherFullName: event.teacherName,
        teacherBirth: event.teacherDateBirth,
        teacherGender: event.teacherGender,
      );
      final completeTeacher = await completeTeacherProfileUseCase1(params);
      completeTeacher.fold(
          (l) => emit(state.copWith(
              completeTeacher1State: const BlocStateData.failed())),
          (r) => emit(state.copWith(
              completeTeacher1State:
                  BlocStateData.success(state.completeTeacherProfile1.data))));
      event.onSuccess();
    });
  }
}
