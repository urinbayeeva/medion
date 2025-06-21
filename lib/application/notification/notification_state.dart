part of 'notification_bloc.dart';

@freezed
class NotificationState with _$NotificationState {
  const factory NotificationState({
    @Default(false) bool notificationsFetchMore,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus notificationStatus,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus markAllNotificationStatus,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus readOnlyStatus,
    @Default('') String markAsReadErrorMsg,
    @Default('') String notificationsErrorMessage,
    @Default('') String notificationNext,
    @Default([]) List<NotificationModel> notifications,
  }) = _NotificationState;

  const NotificationState._();
}
