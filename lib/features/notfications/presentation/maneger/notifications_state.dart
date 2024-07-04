part of 'notifications_bloc.dart';

@immutable
class NotificationsState {
  final BlocStateData<NotificationModels>notifications;
  NotificationsState(
      {this.notifications = const BlocStateData.init(),
      });
  copWith({
    BlocStateData<NotificationModels>? notificationState,
  }) =>
      NotificationsState(
        notifications: notificationState??this.notifications,

      );
}


