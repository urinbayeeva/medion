part of 'notification_bloc.dart';

@freezed
class NotificationState with _$NotificationState {
  const factory NotificationState({
    @Default(false) bool isActive,
  }) = _NotificationState;

  const NotificationState._();
}
