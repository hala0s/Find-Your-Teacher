import 'package:bloc/bloc.dart';
import 'package:find_your_teacher/features/notfications/domain/entities/notiication_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../core/bloc/app_state_bloc.dart';
import '../../data/models/notifications_model.dart';
import '../../domain/use_cases/notification_use_case.dart';

part 'notifications_event.dart';

part 'notifications_state.dart';

@injectable
class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  final NotificationsUseCase notificationsUseCase;

  NotificationsBloc(this.notificationsUseCase) : super(NotificationsState()) {
    on<NotificationsEvent>((event, emit) async {
      emit(state.copWith(notificationState: BlocStateData.loading()));
      RoleParam roleParam = RoleParam(roleParam: event.roleParam);
      final notifications = await notificationsUseCase(roleParam);
      notifications.fold(
          (l) => emit(state.copWith(notificationState: BlocStateData.failed())),
          (r) => emit(state.copWith(
              notificationState:
                  BlocStateData.success(r))));
    });
  }
}
