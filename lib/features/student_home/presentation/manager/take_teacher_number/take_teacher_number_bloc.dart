import 'dart:ui';
import 'package:bloc/bloc.dart';
import 'package:find_your_teacher/core/bloc/app_state_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../data/models/take_number_model.dart';
import '../../../domain/use_cases/take_number_usecase.dart';

part 'take_teacher_number_event.dart';
part 'take_teacher_number_state.dart';
@injectable
class TakeTeacherNumberBloc
    extends Bloc<TakeTeacherNumberEvent, TakeTeacherNumberState> {
  final TakeTeacherNumberUseCase takeTeacherNumberUseCase;
  TakeTeacherNumberBloc(this.takeTeacherNumberUseCase)
      : super(TakeTeacherNumberState()) {
    on<TakeTeacherNumberEvent>((event, emit) async {
      emit(state.copyWith(takeNumberState: const BlocStateData.loading()));
      UserIdParam userIdParam = UserIdParam(userId: event.userId);
      final takeNumber = await takeTeacherNumberUseCase(userIdParam);
      takeNumber.fold(
          (l) => emit(state.copyWith(takeNumberState: BlocStateData.failed())),
          (r) =>
              emit(state.copyWith(takeNumberState: BlocStateData.success(r))));
      event.onSuccess();
    });
  }
}
