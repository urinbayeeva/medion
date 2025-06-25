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

  @BuiltValueField(wireName: 'type')
  String? get type;

  @BuiltValueField(wireName: 'title')
  String? get title;

  @BuiltValueField(wireName: 'body_link')
  String? get bodyLink;

  @BuiltValueField(wireName: 'body')
  String? get body;

  @BuiltValueField(wireName: 'obj_type')
  String? get objType;

  @BuiltValueField(wireName: 'obj_id')
  String? get objId;

  @BuiltValueField(wireName: 'image')
  String? get image;

  @BuiltValueField(wireName: 'is_read')
  bool? get isRead;

  @BuiltValueField(wireName: 'created_at')
  String? get createdAt;

  @BuiltValueField(wireName: 'button_label')
  String? get buttonLabel;

  static Serializer<NotificationModel> get serializer => _$notificationModelSerializer;
}
