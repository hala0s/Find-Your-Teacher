import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/bloc/app_state_bloc.dart';
import '../../../domain/entities/teacher_entities.dart';
import '../../../domain/use_cases/login_teacher.dart';

part 'log_in_teacher_event.dart';

part 'log_in_teacher_state.dart';

@injectable
class LogInTeacherBloc extends Bloc<LogInTeacherEvent, LogInTeacherState> {
  final LogInTeacherUseCase logInTeacherUseCase;

  LogInTeacherBloc(this.logInTeacherUseCase) : super(LogInTeacherState()) {
    on<LogInTeacherEvent>((event, emit) async {
      emit(state.copWith(logInState: BlocStateData.loading()));
      TeacherLogInParams params = TeacherLogInParams(
          password: event.teacherPassWord,
          teacherPhone: event.teacherPhone,
          fcmToken: event.fcmToken);
      try {
        final logInTeacher = await logInTeacherUseCase(params);
        logInTeacher.fold(
            (l) => emit(state.copWith(logInState: BlocStateData.failed())),
            (r) => BlocStateData.success(state.logInUpTeacherState.data));
        event.onSuccess();
      } catch (e) {
        emit(state.copWith(logInState: BlocStateData.failed()));
      }
    });
  }
}
