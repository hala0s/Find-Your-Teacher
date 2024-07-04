import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:find_your_teacher/core/bloc/app_state_bloc.dart';
import 'package:find_your_teacher/features/search%20and%20filter/data/models/filter_model.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../data/models/complete_registrer_model.dart';
import '../../../domain/use_cases/complete_profile2.dart';
import '../../../domain/use_cases/get_complete_profile.dart';

part 'second_complete_profile_event.dart';
part 'second_complete_profile_state.dart';
@injectable
class SecondCompleteProfileBloc
    extends Bloc<SecondCompleteProfileEvent, SecondCompleteProfileState> {
  final SecondRegisterUseCase secondRegisterUseCase;
  final GetCompleteProfileUseCase getCompleteProfileUseCase;
  SecondCompleteProfileBloc(
      this.secondRegisterUseCase, this.getCompleteProfileUseCase)
      : super(SecondCompleteProfileState()) {
    on<SecondCompleteRegisterEvent>((event, emit) async {
      emit(state.copyWith(secondCompleteProfileState: const BlocStateData.loading()));
      SecondRegisterParams secondRegisterParams = SecondRegisterParams(
          aboutMe: event.aboutMe,
          subjects: event.subjects,
          academicLevel: event.academicLevel,
          locations: event.locations, price: event.price);
      final secondComplete = await secondRegisterUseCase(secondRegisterParams);
      secondComplete.fold(
          (l) => emit(state.copyWith(
              secondCompleteProfileState: const BlocStateData.failed())),
          (r) => emit(state.copyWith(
              secondCompleteProfileState: BlocStateData.success(state.secondCompleteProfileState.data))));
      event.onSuccess();
    });

    on<GetSecondProfileEvent>((event, emit) async {
      emit(state.copyWith(getSecondCompleteProfileState: const BlocStateData.loading()));

      final getCompleteProfile = await getCompleteProfileUseCase();
      getCompleteProfile.fold(
              (l) => emit(state.copyWith(
              getSecondCompleteProfileState: const BlocStateData.failed())),
              (r) => emit(state.copyWith(
              getSecondCompleteProfileState: BlocStateData.success(r))));
    });
    on<SaveSubEvent>((event, emit) {
      emit(state.copyWith(saveSubjectIds: event.saveSubId));
    });
    on<SaveLocEvent>((event, emit) {
      emit(state.copyWith(saveLocationIds: event.saveLocId));
    });
    on<SaveEduEvent>((event, emit) {
      emit(state.copyWith(saveEduIds: event.saveEduId));
    });
  }

}
