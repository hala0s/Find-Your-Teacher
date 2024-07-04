part of 'reset_phone_number_bloc.dart';

@immutable
 class ResetPhoneNumberState {
  final BlocStateData<Unit> resetPhoneNumber;

  ResetPhoneNumberState({
    this.resetPhoneNumber = const BlocStateData.init(),
  });

  copWith({
    BlocStateData<Unit>? resetPhoneNumber,
  }) =>
      ResetPhoneNumberState(
        resetPhoneNumber: resetPhoneNumber ?? this.resetPhoneNumber,
      );
}


