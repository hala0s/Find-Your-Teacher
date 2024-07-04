import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:find_your_teacher/core/bloc/app_state_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import '../../../data/models/teacher_by_user_id_model.dart';
import '../../../data/models/top_teachers_model.dart';
import '../../../domain/use_cases/top_teachers_usecase.dart';

part 'top_teachers_event.dart';
part 'top_teachers_state.dart';
@injectable
class TopTeachersBloc extends Bloc<TopTeachersEvent, TopTeachersState> {
  final TopTeachersUseCase topTeachersUseCase;
  final TopTeachersByIdUseCase teachersByIdUseCase;
  TopTeachersBloc(this.topTeachersUseCase, this.teachersByIdUseCase) : super(TopTeachersState()) {
    on<GetTopTeachersEvent>((event, emit) async {
      emit(state.copyWith(topTeachersState: const BlocStateData.loading()));
      ActiveParam activeParam =ActiveParam(active: event.active??true);
      final topTeachers = await topTeachersUseCase( activeParam);
      topTeachers.fold(
              (l) => emit(state.copyWith(
              topTeachersState: const BlocStateData.failed())),
              (r) => emit(
              state.copyWith(topTeachersState: BlocStateData.success(r))));
    });
    on<TopTeachersByIdEvent>((event, emit) async {
      emit(state.copyWith(topTeachersByIdState: const BlocStateData.loading()));
      UserIdParam userIdParam =
      UserIdParam(userId: event.userId);
      final teacherById = await teachersByIdUseCase(userIdParam);
      teacherById.fold(
              (l) => emit(state.copyWith(
              topTeachersByIdState: const BlocStateData.failed())),
              (r) => emit(
              state.copyWith(topTeachersByIdState: BlocStateData.success(r))));
      event.onSuccess();
    });
  }
}
