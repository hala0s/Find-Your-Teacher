import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:find_your_teacher/features/teacher_home/domain/use_cases/phone_nmber_reset.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/bloc/app_state_bloc.dart';

part 'reset_phone_number_event.dart';

part 'reset_phone_number_state.dart';
@injectable
class ResetPhoneNumberBloc
    extends Bloc<ResetPhoneNumberEvent, ResetPhoneNumberState> {
  final PhoneNumberResetUseCase phoneNumberResetUseCase;

  ResetPhoneNumberBloc(this.phoneNumberResetUseCase)
      : super(ResetPhoneNumberState()) {
    on<ResetPhoneNumberEvent>((event, emit) async {
      emit(state.copWith(resetPhoneNumber: BlocStateData.loading()));
      PhoneNumberResetParams params =
          PhoneNumberResetParams(phoneNumber: event.phoneNumber);
      final resetPassword = await phoneNumberResetUseCase(params);
      resetPassword.fold(
          (l) => emit(state.copWith(resetPhoneNumber: BlocStateData.failed())),
          (r) => emit(state.copWith(
              resetPhoneNumber:
                  BlocStateData.success(state.resetPhoneNumber.data))));
      event.onSuccess();
    });
  }
}
