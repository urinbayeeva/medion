import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medion/domain/abstract_repo/notification/notification_repository.dart';
import 'package:medion/domain/models/notification/notification_model.dart';
import 'package:medion/infrastructure/services/local_database/db_service.dart';

part 'notification_event.dart';

part 'notification_state.dart';

part 'notification_bloc.freezed.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final NotificationRepository repository;
  final DBService service;

  NotificationBloc(this.repository, this.service) : super(const NotificationState()) {
    on<_Started>(_onStarted);
    on<_GetNotification>(_onGetNotifications);
    on<_GetMoreNotification>(_onGetMoreNotifications);
    on<_MarkAllNotificationAsRead>(_onMarkAllNotification);
    on<_ReadNotification>(_onReadNotification);
    on<_SetFCMToken>(_onSetFCMToken);
  }

  FutureOr<void> _onSetFCMToken(_SetFCMToken event, Emitter<NotificationState> emit) async {
    final oldFcm = service.getFcmToken;
    final fcm = await FirebaseMessaging.instance.getToken();
    final id = service.getUid;

    log("set fcm token $fcm || id: $id \n\n");

    if (oldFcm != fcm) {
      if (id != null && fcm != null) {
        service.setFcmToken(fcm);
        final res = await repository.setFcmToken(id: id, token: fcm);
        res.fold(
          (failure) {
            log("registered  failed");
          },
          (success) {
            log("registered successfully");
          },
        );
      } else {
        log("registered  failed \n token or id null");
      }
    }
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
