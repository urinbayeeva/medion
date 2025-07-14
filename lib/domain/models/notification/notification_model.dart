import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'notification_model.g.dart';

abstract class SetFcmTokenBody implements Built<SetFcmTokenBody, SetFcmTokenBodyBuilder> {
  const SetFcmTokenBody._();

  factory SetFcmTokenBody([Function(SetFcmTokenBodyBuilder b) updates]) = _$SetFcmTokenBody;

  @BuiltValueField(wireName: 'device_id')
  String get deviceId;

  @BuiltValueField(wireName: 'token')
  String get token;

  static Serializer<SetFcmTokenBody> get serializer => _$setFcmTokenBodySerializer;
}

abstract class NotificationModel implements Built<NotificationModel, NotificationModelBuilder> {
  const NotificationModel._();

  factory NotificationModel([Function(NotificationModelBuilder b) updates]) = _$NotificationModel;

  @BuiltValueField(wireName: 'id')
  int? get id;

  @BuiltValueField(wireName: 'visit_id')
  int? get visitId;

  @BuiltValueField(wireName: 'type')
  String? get type;

  @BuiltValueField(wireName: 'title')
  String? get title;

  @BuiltValueField(wireName: 'date')
  String? get date;

  @BuiltValueField(wireName: 'body')
  String? get body;

  @BuiltValueField(wireName: 'time')
  String? get time;

  @BuiltValueField(wireName: 'discount')
  NotificationDiscount? get discount;

  @BuiltValueField(wireName: 'reminder')
  NotificationReminder? get reminder;

  @BuiltValueField(wireName: 'review')
  NotificationReview? get review;

  @BuiltValueField(wireName: 'lab_result')
  BuiltList<NotificationLabResult>? get labResult;

  @BuiltValueField(wireName: 'is_read')
  bool? get isRead;

  @BuiltValueField(wireName: 'created_at')
  String? get createdAt;

  @BuiltValueField(wireName: 'link')
  String? get link;

  static Serializer<NotificationModel> get serializer => _$notificationModelSerializer;
}

abstract class NotificationLabResult implements Built<NotificationLabResult, NotificationLabResultBuilder> {
  @BuiltValueField(wireName: 'document_name')
  String? get documentName;

  @BuiltValueField(wireName: 'date')
  BuiltList<String>? get date;

  @BuiltValueField(wireName: 'document_url')
  String? get documentUrl;

  const NotificationLabResult._();

  factory NotificationLabResult([Function(NotificationLabResultBuilder b) updates]) = _$NotificationLabResult;

  static Serializer<NotificationLabResult> get serializer => _$notificationLabResultSerializer;
}

abstract class NotificationReview implements Built<NotificationReview, NotificationReviewBuilder> {
  @BuiltValueField(wireName: 'name')
  String? get name;

  @BuiltValueField(wireName: 'ratings')
  BuiltList<String>? get ratings;

  @BuiltValueField(wireName: 'review')
  String? get review;

  @BuiltValueField(wireName: 'status')
  String? get status;

  @BuiltValueField(wireName: 'location')
  String? get location;

  @BuiltValueField(wireName: 'create_date')
  String? get createDate;

  const NotificationReview._();

  factory NotificationReview([Function(NotificationReviewBuilder b) updates]) = _$NotificationReview;

  static Serializer<NotificationReview> get serializer => _$notificationReviewSerializer;
}

abstract class NotificationReminder implements Built<NotificationReminder, NotificationReminderBuilder> {
  @BuiltValueField(wireName: 'id')
  int? get id;

  @BuiltValueField(wireName: 'doctor_name')
  String? get doctorName;

  @BuiltValueField(wireName: 'image')
  String? get image;

  @BuiltValueField(wireName: 'start_date')
  String? get startDate;

  @BuiltValueField(wireName: 'location')
  String? get location;

  const NotificationReminder._();

  factory NotificationReminder([Function(NotificationReminderBuilder b) updates]) = _$NotificationReminder;

  static Serializer<NotificationReminder> get serializer => _$notificationReminderSerializer;
}

abstract class NotificationDiscount implements Built<NotificationDiscount, NotificationDiscountBuilder> {
  @BuiltValueField(wireName: 'id')
  int? get id;

  @BuiltValueField(wireName: 'title')
  String? get title;

  @BuiltValueField(wireName: 'image')
  String? get image;

  @BuiltValueField(wireName: 'end_date')
  String? get endDate;

  const NotificationDiscount._();

  factory NotificationDiscount([Function(NotificationDiscountBuilder b) updates]) = _$NotificationDiscount;

  static Serializer<NotificationDiscount> get serializer => _$notificationDiscountSerializer;
}

abstract class NotificationSendReview implements Built<NotificationSendReview, NotificationSendReviewBuilder> {
  @BuiltValueField(wireName: 'name')
  String? get name;

  @BuiltValueField(wireName: 'ratings')
  String? get ratings;

  @BuiltValueField(wireName: 'review')
  String? get review;

  @BuiltValueField(wireName: 'status')
  String? get status;

  @BuiltValueField(wireName: 'location')
  String? get location;

  @BuiltValueField(wireName: 'create_date')
  String? get createDate;

  const NotificationSendReview._();

  factory NotificationSendReview([Function(NotificationSendReviewBuilder b) updates]) = _$NotificationSendReview;

  static Serializer<NotificationSendReview> get serializer => _$notificationSendReviewSerializer;
}
