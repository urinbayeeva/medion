import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:medion/domain/abstract_repo/notification/notification_repository.dart';
import 'package:medion/domain/common/failure.dart';
import 'package:medion/domain/models/branch/branch_model.dart';
import 'package:medion/domain/models/notification/notification_model.dart';
import 'package:medion/infrastructure/apis/apis.dart';

class NotificationRepoImpl extends NotificationRepository {
  const NotificationRepoImpl({required this.service});

  final NotificationService service;

  @override
  Future<Either<ResponseFailure, List<NotificationModel>>> getNotifications() async {
    try {
      final res = await service.getNotifications();
      if (res.isSuccessful && res.body != null) {
        return right(res.body?.toList() ?? []);
      } else {
        return left(InvalidCredentials(message: 'invalid_credential'.tr()));
      }
    } catch (e) {
      return left(handleError(e));
    }
  }

  @override
  Future<Either<ResponseFailure, void>> readNotifications({required int id}) async {
    try {
      final res = await service.readNotification(id);
      if (res.isSuccessful && res.body != null) {
        return right(null);
      } else {
        return left(InvalidCredentials(message: 'invalid_credential'.tr()));
      }
    } catch (e) {
      return left(handleError(e));
    }
  }

  @override
  Future<Either<ResponseFailure, void>> setFcmToken({required String id, required String token}) async {
    try {
      final body = SetFcmTokenBody(
        (b) => b
          ..deviceId = id
          ..token = token,
      );

      final res = await service.setFcmToken(fcm: body);
      if (res.isSuccessful && res.bodyString != null) {
        return right(null);
      } else {
        return left(InvalidCredentials(message: 'invalid_credential'.tr()));
      }
    } catch (e) {
      log("res error: $e");
      return left(handleError(e));
    }
  }

  @override
  Future<Either<ResponseFailure, List<NotificationModel>>> filterNotification({required String type}) async {
    try {
      final res = await service.getNotifications(type: type);
      if (res.isSuccessful && res.body != null) {
        return right(res.body?.toList() ?? []);
      } else {
        return left(InvalidCredentials(message: 'invalid_credential'.tr()));
      }
    } catch (e) {
      return left(handleError(e));
    }
  }

  @override
  Future<Either<ResponseFailure, NotificationSendReview>> postNotificationReview(
      {required PostVisitReviewModel review}) async {
    try {
      final res = await service.postNotificationReview(visitReview: review);
      if (res.isSuccessful && res.body != null) {
        return right(res.body!);
      } else {
        return left(InvalidCredentials(message: 'invalid_credential'.tr()));
      }
    } catch (e) {
      return left(handleError(e));
    }
  }
}
