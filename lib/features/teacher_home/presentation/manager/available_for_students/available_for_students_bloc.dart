import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:find_your_teacher/features/teacher_home/data/models/profile_model.dart';
import 'package:find_your_teacher/features/teacher_home/domain/use_cases/avaible_forStudents.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/bloc/app_state_bloc.dart';
import '../../../data/models/available_model.dart';

part 'available_for_students_event.dart';

part 'available_for_students_state.dart';
@injectable
class AvailableForStudentsBloc
    extends Bloc<AvailableForStudentsEvent, AvailableForStudentsState> {
  final AvailableForStudentUseCase availableForStudentUseCase;

  AvailableForStudentsBloc(this.availableForStudentUseCase)
      : super(AvailableForStudentsState()) {
    on<AvailableForStudentsEvent>((event, emit) async {
      emit(state.copWith(availableForStudentsState: BlocStateData.loading()));
      AvailableForStudentsParams params =
          AvailableForStudentsParams(available: event.available);
      final availableForStudents = await availableForStudentUseCase(params);
      availableForStudents.fold(
          (l) => emit(
              state.copWith(availableForStudentsState: BlocStateData.failed())),
          (r) => emit(state.copWith(
              availableForStudentsState:
                  BlocStateData.success(state.availableForStudents.data))));
      event.onSuccess();

    });
  }
}
