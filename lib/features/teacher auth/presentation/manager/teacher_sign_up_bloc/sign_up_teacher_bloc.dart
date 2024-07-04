import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/bloc/app_state_bloc.dart';
import '../../../domain/entities/teacher_entities.dart';
import '../../../domain/use_cases/sign_up_teacher.dart';

part 'sign_up_teacher_event.dart';

part 'sign_up_teacher_state.dart';

@injectable
class SignUpTeacherBloc extends Bloc<SignUpTeacherEvent, SignUpTeacherState> {
  final SignUpTeacherUseCase signUpTeacherUseCase;

  SignUpTeacherBloc(this.signUpTeacherUseCase) : super(SignUpTeacherState()) {
    on<SignUpTeacherEvent>((event, emit) async {
      emit(state.copWith(signUpState: BlocStateData.loading()));
      TeacherSignUpParams params = TeacherSignUpParams(
        fcmToken: event.fcmToken,
          teacherName: event.teacherName,
          teacherPhone: event.teacherPhoneNumber,
          teacherPassword: event.teacherPassword,
          role: event.role, teacherGender: event.teacherGender);
    try{  final signUpTeacher = await signUpTeacherUseCase(params);
      signUpTeacher.fold(
          (l) => emit(state.copWith(signUpState: BlocStateData.failed())),
          (r) => emit(state.copWith(
              signUpState:
                  BlocStateData.success(state.signUpTeacherState.data))));
      event.onSuccess(); }
        catch(e){
          emit(state.copWith(signUpState: BlocStateData.failed()));
        }
    });
  }
}
