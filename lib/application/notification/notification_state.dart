part of 'notification_bloc.dart';

@freezed
class NotificationState with _$NotificationState {
  const factory NotificationState({
    @Default(false) bool notificationsFetchMore,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus notificationStatus,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus markAllNotificationStatus,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus readOnlyStatus,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus singleStatus,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus setFcmTokenStatus,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus filterNotificationStatus,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus postNotificationReviewStatus,
    @Default('All') String filterType,
    @Default('') String markAsReadErrorMsg,
    @Default('') String notificationsErrorMessage,
    @Default('') String notificationNext,
    @Default(0) int unReadNotifications,
    @Default([]) List<NotificationModel> notifications,
    NotificationModel? singleNotification,
    NotificationSendReview? review,
  }) = _NotificationState;

  const NotificationState._();
}
