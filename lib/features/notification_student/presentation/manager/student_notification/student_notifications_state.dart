part of 'student_notifications_bloc.dart';

@immutable
 class StudentNotificationsState {
  final BlocStateData<NotificationStudentModels>notificationsState;
  const StudentNotificationsState(
      {this.notificationsState = const BlocStateData.init(),
      });
  copWith({
    BlocStateData<NotificationStudentModels>? notificationState,
  }) =>
      StudentNotificationsState(
        notificationsState: notificationState??this.notificationsState,

      );
}


