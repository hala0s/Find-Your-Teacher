import 'package:bloc/bloc.dart';
import 'package:find_your_teacher/features/notification_student/data/models/notification_noti_model.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/bloc/app_state_bloc.dart';
import '../../../domain/use_cases/notification_student_usecase.dart';

part 'student_notifications_event.dart';
part 'student_notifications_state.dart';
@injectable
class StudentNotificationsBloc extends Bloc<StudentNotificationsEvent, StudentNotificationsState> {
  final NotificationsStudentUseCase notificationsStudentUseCase;
  StudentNotificationsBloc(this.notificationsStudentUseCase) : super(StudentNotificationsState()) {
    on<StudentNotificationsEvent>((event, emit) async {

        emit(state.copWith(notificationState: BlocStateData.loading()));
        StudentRoleParam roleParam = StudentRoleParam(roleParam: event.roleParam);
        final notifications = await notificationsStudentUseCase(roleParam);
        notifications.fold(
                (l) => emit(state.copWith(notificationState: BlocStateData.failed())),
                (r) => emit(state.copWith(
                notificationState:
                BlocStateData.success(r))));
      });
    }
        }
