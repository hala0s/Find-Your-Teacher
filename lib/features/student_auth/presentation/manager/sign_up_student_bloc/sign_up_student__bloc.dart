import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:find_your_teacher/core/bloc/app_state_bloc.dart';
import 'package:find_your_teacher/features/student_auth/data/models/studentModels.dart';
import 'package:find_your_teacher/features/student_auth/domain/use_cases/sign_up_student.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/auth_entities.dart';

part 'sign_up_student__event.dart';

part 'sign_up_student_state.dart';

@injectable
class SignUpStudentBloc extends Bloc<SignUpStudentEvent, SignUpStudentState> {
  final SignUpStudentUseCase signUpStudentUseCase;

  SignUpStudentBloc(this.signUpStudentUseCase) : super(SignUpStudentState()) {
    on<SignUpStudentEvent>((event, emit) async {
      emit(state.copWith(signInState: BlocStateData.loading()));
      SignUpStudentParams params = SignUpStudentParams(
          studentName: event.studentName,
          studentPhoneNumber: event.studentStudentPhoneNumber,
          studentPassword: event.studentPassword,
          role: event.role, gender: event.studentGender, fcmToken:event.fcmToken);
      try {
        final signUpStudent = await signUpStudentUseCase(params);
        signUpStudent.fold(
                (l) => emit(state.copWith(signInState: BlocStateData.failed())),
                (r) =>
                emit(state.copWith(
                    signInState: BlocStateData.success(
                        state.signInState.data))));

        event.onSuccess();
      }catch(e){
        emit(state.copWith(signInState: BlocStateData.failed()));
      }
    });
  }
}
