import 'package:dartz/dartz.dart';
import 'package:medion/domain/common/failure.dart';
import 'package:medion/domain/models/branch/branch_model.dart';
import 'package:medion/domain/models/notification/notification_model.dart';

abstract class NotificationRepository {
  const NotificationRepository();

  Future<Either<ResponseFailure, List<NotificationModel>>> getNotifications();

  Future<Either<ResponseFailure, List<NotificationModel>>> filterNotification({required String type});

  Future<Either<ResponseFailure, void>> readNotifications({required int id});

  Future<Either<ResponseFailure, NotificationSendReview>> postNotificationReview(
      {required PostVisitReviewModel review});

  Future<Either<ResponseFailure, void>> setFcmToken({required String id, required String token});
}
