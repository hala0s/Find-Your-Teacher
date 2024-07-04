part of 'second_complete_profile_bloc.dart';

@immutable
abstract class SecondCompleteProfileEvent {}

class SecondCompleteRegisterEvent extends SecondCompleteProfileEvent {
  final String aboutMe;
  final List<String> subjects;
  final List<String> academicLevel;
  final List<String> locations;
  final int price;
  final VoidCallback onSuccess;
  SecondCompleteRegisterEvent(
      {required this.price,
        required this.aboutMe,
        required this.onSuccess,
      required this.subjects,
      required this.academicLevel,
      required this.locations});
}

class GetSecondProfileEvent extends SecondCompleteProfileEvent {}
class SaveSubEvent extends SecondCompleteProfileEvent {
  final List<String> saveSubId;

  SaveSubEvent({required this.saveSubId});
}


class SaveLocEvent extends SecondCompleteProfileEvent {
  final List<String> saveLocId;

  SaveLocEvent({required this.saveLocId});
}


class SaveEduEvent extends SecondCompleteProfileEvent {
  final List<String> saveEduId;

  SaveEduEvent({required this.saveEduId});
}

