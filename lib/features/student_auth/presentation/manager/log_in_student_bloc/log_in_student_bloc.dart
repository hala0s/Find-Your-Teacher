import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:find_your_teacher/features/student_auth/data/models/studentModels.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/bloc/app_state_bloc.dart';
import '../../../domain/entities/auth_entities.dart';
import '../../../domain/use_cases/log_in_student.dart';

part 'log_in_student_event.dart';

part 'log_in_student_state.dart';
@injectable
class LogInStudentBloc extends Bloc<LogInStudentEvent, LogInStudentState> {
  final LogInStudentUseCase logInStudentUseCase;

  LogInStudentBloc(this.logInStudentUseCase) : super(LogInStudentState()) {
    on<LogInStudentEvent>((event, emit) async {
      emit(state.copWith(logInState: const BlocStateData.loading()));
      LogInStudentParams params = LogInStudentParams(
          studentPhoneNumber: event.studentPhoneNumber,
          studentPassword: event.studentPassword, fcmToken: event.fcmToken,
      );
      try {
        final logInStudent = await logInStudentUseCase(params);
        logInStudent.fold(
                (l) => emit(state.copWith(logInState: const BlocStateData.failed())),
                (r) =>
                emit(state.copWith(
                    logInState: BlocStateData.success(state.logInState.data))));
        event.onSuccess();
      }
      catch (e) {
        emit(state.copWith(logInState: BlocStateData.failed()));
      }
    });
  }
}
