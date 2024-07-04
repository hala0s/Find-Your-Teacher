part of 'reset_phone_number_bloc.dart';

@immutable
class ResetPhoneNumberEvent {
  final String phoneNumber;
  final VoidCallback onSuccess;

  ResetPhoneNumberEvent( {required this.phoneNumber, required this.onSuccess});
}
