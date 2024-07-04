import 'package:bloc/bloc.dart';
import 'package:find_your_teacher/core/bloc/app_state_bloc.dart';
import 'package:find_your_teacher/features/student_auth/data/data_sources/local_data_source.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../data/models/activate_teacher_model.dart';
import '../../../domain/use_cases/teacher_activate_usecase.dart';

part 'teacher_activate_event.dart';

part 'teacher_activate_state.dart';

@injectable
class TeacherActivateBloc
    extends Bloc<TeacherActivateEvent, TeacherActivateState> {
  TeacherActivateUseCase teacherActivateUseCase;

  TeacherActivateBloc({required this.teacherActivateUseCase})
      : super(const TeacherActivateState()) {
    on<TeacherActivateEvent>((event, emit) async {
      emit(state.copyWith(activateState: const BlocStateData.loading()));
      IdParam idParam =
          IdParam(id: event.id ?? " ${await AuthImpLocalDataSource().getId()}");
      final teacherActivate = await teacherActivateUseCase(idParam);
      teacherActivate.fold(
          (l) =>
              emit(state.copyWith(activateState: const BlocStateData.failed())),
          (r) => emit(state.copyWith(activateState: BlocStateData.success(r))));
    });
  }
}
