part of 'second_complete_profile_bloc.dart';

@immutable
class SecondCompleteProfileState {
  final BlocStateData<Unit> secondCompleteProfileState;
  final BlocStateData<FilterModel> getSecondCompleteProfileState;

  const SecondCompleteProfileState({
    this.secondCompleteProfileState = const BlocStateData.init(),
    this.getSecondCompleteProfileState = const BlocStateData.init(),
  });
  copyWith({
    BlocStateData<Unit>? secondCompleteProfileState,
    BlocStateData<FilterModel>? getSecondCompleteProfileState,
    List<String>? saveSubjectIds,
    List<String>? saveLocationIds,
    List<String>? saveEduIds,
  }) =>
      SecondCompleteProfileState(
        secondCompleteProfileState:
            secondCompleteProfileState ?? this.secondCompleteProfileState,
        getSecondCompleteProfileState:
            getSecondCompleteProfileState ?? this.getSecondCompleteProfileState,
      );
}
