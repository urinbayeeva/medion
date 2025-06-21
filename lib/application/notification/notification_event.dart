part of 'notification_bloc.dart';

@freezed
class NotificationEvent with _$NotificationEvent {
  const factory NotificationEvent.started() = _Started;

  const factory NotificationEvent.getNotifications() = _GetNotification;

  const factory NotificationEvent.getMoreNotifications() = _GetMoreNotification;

  const factory NotificationEvent.markAllNotificationAsRead() = _MarkAllNotificationAsRead;

  const factory NotificationEvent.readNotification({required int index}) = _ReadNotification;
}
