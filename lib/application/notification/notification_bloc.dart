import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medion/domain/abstract_repo/notification/notification_repository.dart';
import 'package:medion/domain/models/notification/notification_model.dart';

part 'notification_event.dart';

part 'notification_state.dart';

part 'notification_bloc.freezed.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final NotificationRepository repository;

  NotificationBloc(this.repository) : super(const NotificationState()) {
    on<_Started>(_onStarted);
    on<_GetNotification>(_onGetNotifications);
    on<_GetMoreNotification>(_onGetMoreNotifications);
    on<_MarkAllNotificationAsRead>(_onMarkAllNotification);
    on<_ReadNotification>(_onReadNotification);
  }

  FutureOr<void> _onGetNotifications(_GetNotification event, Emitter<NotificationState> emit) async {
    emit(state.copyWith(notificationStatus: FormzSubmissionStatus.inProgress));
    final res = await repository.getNotifications();
    res.fold(
      (failure) {
        emit(state.copyWith(notificationStatus: FormzSubmissionStatus.failure));
      },
      (success) {
        emit(state.copyWith(
          notifications: success,
          notificationStatus: FormzSubmissionStatus.success,
        ));
      },
    );
  }

  FutureOr<void> _onGetMoreNotifications(_GetMoreNotification event, Emitter<NotificationState> emit) async {}

  FutureOr<void> _onMarkAllNotification(_MarkAllNotificationAsRead event, Emitter<NotificationState> emit) async {}

  FutureOr<void> _onReadNotification(_ReadNotification event, Emitter<NotificationState> emit) async {
    emit(state.copyWith(readOnlyStatus: FormzSubmissionStatus.inProgress));
    final res = await repository.readNotifications(id: event.index);
    res.fold(
      (failure) {
        emit(state.copyWith(readOnlyStatus: FormzSubmissionStatus.failure));
      },
      (success) {
        emit(state.copyWith(readOnlyStatus: FormzSubmissionStatus.success));
      },
    );
  }

  FutureOr<void> _onStarted(_Started event, Emitter<NotificationState> emit) async {}
}
