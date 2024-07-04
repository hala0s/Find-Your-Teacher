part of 'take_teacher_number_bloc.dart';

@immutable
 class TakeTeacherNumberState {
  final BlocStateData<TakeNumberModel> takeNumberState;

  TakeTeacherNumberState({ this.takeNumberState=const BlocStateData.init()});
  copyWith({
    BlocStateData<TakeNumberModel>? takeNumberState,


  }) =>
      TakeTeacherNumberState(
        takeNumberState: takeNumberState??this.takeNumberState,

      );


}

