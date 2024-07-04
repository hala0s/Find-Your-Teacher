import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../core/bloc/app_state_bloc.dart';
import '../../../teacher auth/data/models/teacher_models.dart';
import '../../data/models/profile_model.dart';
import '../../domain/use_cases/profile_usecase.dart';

part 'get_teacher_profile_event.dart';

part 'get_teacher_profile_state.dart';
@injectable
class GetTeacherProfileBloc
    extends Bloc<GetTeacherProfileEvent, GetTeacherProfileState> {
  final TeacherProfileUseCase teacherProfileUseCase;

  GetTeacherProfileBloc(this.teacherProfileUseCase)
      : super(GetTeacherProfileState()) {
    on<GetTeacherProfileEvent>((event, emit) async {
      if(event is GetTeacherProfileE || event is RefreshEvent )
        emit(state.copWith(teacherProfile: BlocStateData.loading()));
      final getTeacherProfile = await teacherProfileUseCase();
      getTeacherProfile.fold(
              (l) =>
              emit(state.copWith(teacherProfile: BlocStateData.failed())),
              (r) => emit(state.copWith(
              teacherProfile:
              BlocStateData.success(r))));
    });
  }
}
