import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:find_your_teacher/features/teacher%20auth/domain/entities/teacher_entities.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/get_teacher_profile.dart';
import '../../../domain/use_cases/get_teacher_profile_before_complete.dart';

part 'get_teacher_profile_before_complete_event.dart';

part 'get_teacher_profile_before_complete_state.dart';

@injectable
class GetTeacherProfileBeforeCompleteBloc extends Bloc<
    GetTeacherProfileBeforeCompleteEvent,
    GetTeacherProfileBeforeCompleteState> {
  final GetTeacherProfileBeforeCompleteUseCase
      getTeacherProfileBeforeCompleteUseCase;

  GetTeacherProfileBeforeCompleteBloc(
      this.getTeacherProfileBeforeCompleteUseCase)
      : super(GetTeacherProfileBeforeCompleteInitialState()) {
    on<GetTeacherProfileBeforeCompleteEvent>((event, emit) async {
      emit(GetTeacherProfileBeforeCompleteLoadingState());
      final getTeacherProfileBeforeComplete =
          await getTeacherProfileBeforeCompleteUseCase();
      getTeacherProfileBeforeComplete.fold(
        (l) => emit(GetTeacherProfileBeforeCompleteFailState()),
        (getTeacherProfileBeforeCompleteUseCase) => emit(
            GetTeacherProfileBeforeCompleteSuccessState(
                getTeacherProfileEntities: getTeacherProfileBeforeCompleteUseCase)),
      );
    });
  }
}
