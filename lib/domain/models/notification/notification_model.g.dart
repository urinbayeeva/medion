// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SetFcmTokenBody> _$setFcmTokenBodySerializer =
    new _$SetFcmTokenBodySerializer();
Serializer<NotificationModel> _$notificationModelSerializer =
    new _$NotificationModelSerializer();
Serializer<NotificationLabResult> _$notificationLabResultSerializer =
    new _$NotificationLabResultSerializer();
Serializer<NotificationReview> _$notificationReviewSerializer =
    new _$NotificationReviewSerializer();
Serializer<NotificationReminder> _$notificationReminderSerializer =
    new _$NotificationReminderSerializer();
Serializer<NotificationDiscount> _$notificationDiscountSerializer =
    new _$NotificationDiscountSerializer();
Serializer<NotificationSendReview> _$notificationSendReviewSerializer =
    new _$NotificationSendReviewSerializer();

class _$SetFcmTokenBodySerializer
    implements StructuredSerializer<SetFcmTokenBody> {
  @override
  final Iterable<Type> types = const [SetFcmTokenBody, _$SetFcmTokenBody];
  @override
  final String wireName = 'SetFcmTokenBody';

  @override
  Iterable<Object?> serialize(Serializers serializers, SetFcmTokenBody object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'device_id',
      serializers.serialize(object.deviceId,
          specifiedType: const FullType(String)),
      'token',
      serializers.serialize(object.token,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  SetFcmTokenBody deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SetFcmTokenBodyBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'device_id':
          result.deviceId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'token':
          result.token = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$NotificationModelSerializer
    implements StructuredSerializer<NotificationModel> {
  @override
  final Iterable<Type> types = const [NotificationModel, _$NotificationModel];
  @override
  final String wireName = 'NotificationModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, NotificationModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.visitId;
    if (value != null) {
      result
        ..add('visit_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.date;
    if (value != null) {
      result
        ..add('date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.body;
    if (value != null) {
      result
        ..add('body')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.time;
    if (value != null) {
      result
        ..add('time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.discount;
    if (value != null) {
      result
        ..add('discount')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(NotificationDiscount)));
    }
    value = object.reminder;
    if (value != null) {
      result
        ..add('reminder')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(NotificationReminder)));
    }
    value = object.review;
    if (value != null) {
      result
        ..add('review')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(NotificationReview)));
    }
    value = object.labResult;
    if (value != null) {
      result
        ..add('lab_result')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(NotificationLabResult)])));
    }
    value = object.isRead;
    if (value != null) {
      result
        ..add('is_read')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.link;
    if (value != null) {
      result
        ..add('link')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  NotificationModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NotificationModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'visit_id':
          result.visitId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'body':
          result.body = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'time':
          result.time = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'discount':
          result.discount.replace(serializers.deserialize(value,
                  specifiedType: const FullType(NotificationDiscount))!
              as NotificationDiscount);
          break;
        case 'reminder':
          result.reminder.replace(serializers.deserialize(value,
                  specifiedType: const FullType(NotificationReminder))!
              as NotificationReminder);
          break;
        case 'review':
          result.review.replace(serializers.deserialize(value,
                  specifiedType: const FullType(NotificationReview))!
              as NotificationReview);
          break;
        case 'lab_result':
          result.labResult.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(NotificationLabResult)
              ]))! as BuiltList<Object?>);
          break;
        case 'is_read':
          result.isRead = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'link':
          result.link = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$NotificationLabResultSerializer
    implements StructuredSerializer<NotificationLabResult> {
  @override
  final Iterable<Type> types = const [
    NotificationLabResult,
    _$NotificationLabResult
  ];
  @override
  final String wireName = 'NotificationLabResult';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, NotificationLabResult object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.documentName;
    if (value != null) {
      result
        ..add('document_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.date;
    if (value != null) {
      result
        ..add('date')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.documentUrl;
    if (value != null) {
      result
        ..add('document_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  NotificationLabResult deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NotificationLabResultBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'document_name':
          result.documentName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'date':
          result.date.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'document_url':
          result.documentUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$NotificationReviewSerializer
    implements StructuredSerializer<NotificationReview> {
  @override
  final Iterable<Type> types = const [NotificationReview, _$NotificationReview];
  @override
  final String wireName = 'NotificationReview';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, NotificationReview object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ratings;
    if (value != null) {
      result
        ..add('ratings')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.review;
    if (value != null) {
      result
        ..add('review')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.location;
    if (value != null) {
      result
        ..add('location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createDate;
    if (value != null) {
      result
        ..add('create_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  NotificationReview deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NotificationReviewBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'ratings':
          result.ratings.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'review':
          result.review = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'create_date':
          result.createDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$NotificationReminderSerializer
    implements StructuredSerializer<NotificationReminder> {
  @override
  final Iterable<Type> types = const [
    NotificationReminder,
    _$NotificationReminder
  ];
  @override
  final String wireName = 'NotificationReminder';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, NotificationReminder object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.doctorName;
    if (value != null) {
      result
        ..add('doctor_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.startDate;
    if (value != null) {
      result
        ..add('start_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.location;
    if (value != null) {
      result
        ..add('location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  NotificationReminder deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NotificationReminderBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'doctor_name':
          result.doctorName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'start_date':
          result.startDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$NotificationDiscountSerializer
    implements StructuredSerializer<NotificationDiscount> {
  @override
  final Iterable<Type> types = const [
    NotificationDiscount,
    _$NotificationDiscount
  ];
  @override
  final String wireName = 'NotificationDiscount';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, NotificationDiscount object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.endDate;
    if (value != null) {
      result
        ..add('end_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  NotificationDiscount deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NotificationDiscountBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'end_date':
          result.endDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$NotificationSendReviewSerializer
    implements StructuredSerializer<NotificationSendReview> {
  @override
  final Iterable<Type> types = const [
    NotificationSendReview,
    _$NotificationSendReview
  ];
  @override
  final String wireName = 'NotificationSendReview';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, NotificationSendReview object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ratings;
    if (value != null) {
      result
        ..add('ratings')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.review;
    if (value != null) {
      result
        ..add('review')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.location;
    if (value != null) {
      result
        ..add('location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createDate;
    if (value != null) {
      result
        ..add('create_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  NotificationSendReview deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NotificationSendReviewBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'ratings':
          result.ratings = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'review':
          result.review = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'create_date':
          result.createDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$SetFcmTokenBody extends SetFcmTokenBody {
  @override
  final String deviceId;
  @override
  final String token;

  factory _$SetFcmTokenBody([void Function(SetFcmTokenBodyBuilder)? updates]) =>
      (new SetFcmTokenBodyBuilder()..update(updates))._build();

  _$SetFcmTokenBody._({required this.deviceId, required this.token})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        deviceId, r'SetFcmTokenBody', 'deviceId');
    BuiltValueNullFieldError.checkNotNull(token, r'SetFcmTokenBody', 'token');
  }

  @override
  SetFcmTokenBody rebuild(void Function(SetFcmTokenBodyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SetFcmTokenBodyBuilder toBuilder() =>
      new SetFcmTokenBodyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SetFcmTokenBody &&
        deviceId == other.deviceId &&
        token == other.token;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, deviceId.hashCode);
    _$hash = $jc(_$hash, token.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SetFcmTokenBody')
          ..add('deviceId', deviceId)
          ..add('token', token))
        .toString();
  }
}

class SetFcmTokenBodyBuilder
    implements Builder<SetFcmTokenBody, SetFcmTokenBodyBuilder> {
  _$SetFcmTokenBody? _$v;

  String? _deviceId;
  String? get deviceId => _$this._deviceId;
  set deviceId(String? deviceId) => _$this._deviceId = deviceId;

  String? _token;
  String? get token => _$this._token;
  set token(String? token) => _$this._token = token;

  SetFcmTokenBodyBuilder();

  SetFcmTokenBodyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _deviceId = $v.deviceId;
      _token = $v.token;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SetFcmTokenBody other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SetFcmTokenBody;
  }

  @override
  void update(void Function(SetFcmTokenBodyBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SetFcmTokenBody build() => _build();

  _$SetFcmTokenBody _build() {
    final _$result = _$v ??
        new _$SetFcmTokenBody._(
          deviceId: BuiltValueNullFieldError.checkNotNull(
              deviceId, r'SetFcmTokenBody', 'deviceId'),
          token: BuiltValueNullFieldError.checkNotNull(
              token, r'SetFcmTokenBody', 'token'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$NotificationModel extends NotificationModel {
  @override
  final int? id;
  @override
  final int? visitId;
  @override
  final String? type;
  @override
  final String? title;
  @override
  final String? date;
  @override
  final String? body;
  @override
  final String? time;
  @override
  final NotificationDiscount? discount;
  @override
  final NotificationReminder? reminder;
  @override
  final NotificationReview? review;
  @override
  final BuiltList<NotificationLabResult>? labResult;
  @override
  final bool? isRead;
  @override
  final String? createdAt;
  @override
  final String? link;

  factory _$NotificationModel(
          [void Function(NotificationModelBuilder)? updates]) =>
      (new NotificationModelBuilder()..update(updates))._build();

  _$NotificationModel._(
      {this.id,
      this.visitId,
      this.type,
      this.title,
      this.date,
      this.body,
      this.time,
      this.discount,
      this.reminder,
      this.review,
      this.labResult,
      this.isRead,
      this.createdAt,
      this.link})
      : super._();

  @override
  NotificationModel rebuild(void Function(NotificationModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NotificationModelBuilder toBuilder() =>
      new NotificationModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NotificationModel &&
        id == other.id &&
        visitId == other.visitId &&
        type == other.type &&
        title == other.title &&
        date == other.date &&
        body == other.body &&
        time == other.time &&
        discount == other.discount &&
        reminder == other.reminder &&
        review == other.review &&
        labResult == other.labResult &&
        isRead == other.isRead &&
        createdAt == other.createdAt &&
        link == other.link;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, visitId.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, date.hashCode);
    _$hash = $jc(_$hash, body.hashCode);
    _$hash = $jc(_$hash, time.hashCode);
    _$hash = $jc(_$hash, discount.hashCode);
    _$hash = $jc(_$hash, reminder.hashCode);
    _$hash = $jc(_$hash, review.hashCode);
    _$hash = $jc(_$hash, labResult.hashCode);
    _$hash = $jc(_$hash, isRead.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, link.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NotificationModel')
          ..add('id', id)
          ..add('visitId', visitId)
          ..add('type', type)
          ..add('title', title)
          ..add('date', date)
          ..add('body', body)
          ..add('time', time)
          ..add('discount', discount)
          ..add('reminder', reminder)
          ..add('review', review)
          ..add('labResult', labResult)
          ..add('isRead', isRead)
          ..add('createdAt', createdAt)
          ..add('link', link))
        .toString();
  }
}

class NotificationModelBuilder
    implements Builder<NotificationModel, NotificationModelBuilder> {
  _$NotificationModel? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _visitId;
  int? get visitId => _$this._visitId;
  set visitId(int? visitId) => _$this._visitId = visitId;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _date;
  String? get date => _$this._date;
  set date(String? date) => _$this._date = date;

  String? _body;
  String? get body => _$this._body;
  set body(String? body) => _$this._body = body;

  String? _time;
  String? get time => _$this._time;
  set time(String? time) => _$this._time = time;

  NotificationDiscountBuilder? _discount;
  NotificationDiscountBuilder get discount =>
      _$this._discount ??= new NotificationDiscountBuilder();
  set discount(NotificationDiscountBuilder? discount) =>
      _$this._discount = discount;

  NotificationReminderBuilder? _reminder;
  NotificationReminderBuilder get reminder =>
      _$this._reminder ??= new NotificationReminderBuilder();
  set reminder(NotificationReminderBuilder? reminder) =>
      _$this._reminder = reminder;

  NotificationReviewBuilder? _review;
  NotificationReviewBuilder get review =>
      _$this._review ??= new NotificationReviewBuilder();
  set review(NotificationReviewBuilder? review) => _$this._review = review;

  ListBuilder<NotificationLabResult>? _labResult;
  ListBuilder<NotificationLabResult> get labResult =>
      _$this._labResult ??= new ListBuilder<NotificationLabResult>();
  set labResult(ListBuilder<NotificationLabResult>? labResult) =>
      _$this._labResult = labResult;

  bool? _isRead;
  bool? get isRead => _$this._isRead;
  set isRead(bool? isRead) => _$this._isRead = isRead;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  String? _link;
  String? get link => _$this._link;
  set link(String? link) => _$this._link = link;

  NotificationModelBuilder();

  NotificationModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _visitId = $v.visitId;
      _type = $v.type;
      _title = $v.title;
      _date = $v.date;
      _body = $v.body;
      _time = $v.time;
      _discount = $v.discount?.toBuilder();
      _reminder = $v.reminder?.toBuilder();
      _review = $v.review?.toBuilder();
      _labResult = $v.labResult?.toBuilder();
      _isRead = $v.isRead;
      _createdAt = $v.createdAt;
      _link = $v.link;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NotificationModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NotificationModel;
  }

  @override
  void update(void Function(NotificationModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NotificationModel build() => _build();

  _$NotificationModel _build() {
    _$NotificationModel _$result;
    try {
      _$result = _$v ??
          new _$NotificationModel._(
            id: id,
            visitId: visitId,
            type: type,
            title: title,
            date: date,
            body: body,
            time: time,
            discount: _discount?.build(),
            reminder: _reminder?.build(),
            review: _review?.build(),
            labResult: _labResult?.build(),
            isRead: isRead,
            createdAt: createdAt,
            link: link,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'discount';
        _discount?.build();
        _$failedField = 'reminder';
        _reminder?.build();
        _$failedField = 'review';
        _review?.build();
        _$failedField = 'labResult';
        _labResult?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'NotificationModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NotificationLabResult extends NotificationLabResult {
  @override
  final String? documentName;
  @override
  final BuiltList<String>? date;
  @override
  final String? documentUrl;

  factory _$NotificationLabResult(
          [void Function(NotificationLabResultBuilder)? updates]) =>
      (new NotificationLabResultBuilder()..update(updates))._build();

  _$NotificationLabResult._({this.documentName, this.date, this.documentUrl})
      : super._();

  @override
  NotificationLabResult rebuild(
          void Function(NotificationLabResultBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NotificationLabResultBuilder toBuilder() =>
      new NotificationLabResultBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NotificationLabResult &&
        documentName == other.documentName &&
        date == other.date &&
        documentUrl == other.documentUrl;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, documentName.hashCode);
    _$hash = $jc(_$hash, date.hashCode);
    _$hash = $jc(_$hash, documentUrl.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NotificationLabResult')
          ..add('documentName', documentName)
          ..add('date', date)
          ..add('documentUrl', documentUrl))
        .toString();
  }
}

class NotificationLabResultBuilder
    implements Builder<NotificationLabResult, NotificationLabResultBuilder> {
  _$NotificationLabResult? _$v;

  String? _documentName;
  String? get documentName => _$this._documentName;
  set documentName(String? documentName) => _$this._documentName = documentName;

  ListBuilder<String>? _date;
  ListBuilder<String> get date => _$this._date ??= new ListBuilder<String>();
  set date(ListBuilder<String>? date) => _$this._date = date;

  String? _documentUrl;
  String? get documentUrl => _$this._documentUrl;
  set documentUrl(String? documentUrl) => _$this._documentUrl = documentUrl;

  NotificationLabResultBuilder();

  NotificationLabResultBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _documentName = $v.documentName;
      _date = $v.date?.toBuilder();
      _documentUrl = $v.documentUrl;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NotificationLabResult other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NotificationLabResult;
  }

  @override
  void update(void Function(NotificationLabResultBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NotificationLabResult build() => _build();

  _$NotificationLabResult _build() {
    _$NotificationLabResult _$result;
    try {
      _$result = _$v ??
          new _$NotificationLabResult._(
            documentName: documentName,
            date: _date?.build(),
            documentUrl: documentUrl,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'date';
        _date?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'NotificationLabResult', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NotificationReview extends NotificationReview {
  @override
  final String? name;
  @override
  final BuiltList<String>? ratings;
  @override
  final String? review;
  @override
  final String? status;
  @override
  final String? location;
  @override
  final String? createDate;

  factory _$NotificationReview(
          [void Function(NotificationReviewBuilder)? updates]) =>
      (new NotificationReviewBuilder()..update(updates))._build();

  _$NotificationReview._(
      {this.name,
      this.ratings,
      this.review,
      this.status,
      this.location,
      this.createDate})
      : super._();

  @override
  NotificationReview rebuild(
          void Function(NotificationReviewBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NotificationReviewBuilder toBuilder() =>
      new NotificationReviewBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NotificationReview &&
        name == other.name &&
        ratings == other.ratings &&
        review == other.review &&
        status == other.status &&
        location == other.location &&
        createDate == other.createDate;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, ratings.hashCode);
    _$hash = $jc(_$hash, review.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, location.hashCode);
    _$hash = $jc(_$hash, createDate.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NotificationReview')
          ..add('name', name)
          ..add('ratings', ratings)
          ..add('review', review)
          ..add('status', status)
          ..add('location', location)
          ..add('createDate', createDate))
        .toString();
  }
}

class NotificationReviewBuilder
    implements Builder<NotificationReview, NotificationReviewBuilder> {
  _$NotificationReview? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  ListBuilder<String>? _ratings;
  ListBuilder<String> get ratings =>
      _$this._ratings ??= new ListBuilder<String>();
  set ratings(ListBuilder<String>? ratings) => _$this._ratings = ratings;

  String? _review;
  String? get review => _$this._review;
  set review(String? review) => _$this._review = review;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  String? _location;
  String? get location => _$this._location;
  set location(String? location) => _$this._location = location;

  String? _createDate;
  String? get createDate => _$this._createDate;
  set createDate(String? createDate) => _$this._createDate = createDate;

  NotificationReviewBuilder();

  NotificationReviewBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _ratings = $v.ratings?.toBuilder();
      _review = $v.review;
      _status = $v.status;
      _location = $v.location;
      _createDate = $v.createDate;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NotificationReview other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NotificationReview;
  }

  @override
  void update(void Function(NotificationReviewBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NotificationReview build() => _build();

  _$NotificationReview _build() {
    _$NotificationReview _$result;
    try {
      _$result = _$v ??
          new _$NotificationReview._(
            name: name,
            ratings: _ratings?.build(),
            review: review,
            status: status,
            location: location,
            createDate: createDate,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ratings';
        _ratings?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'NotificationReview', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NotificationReminder extends NotificationReminder {
  @override
  final int? id;
  @override
  final String? doctorName;
  @override
  final String? image;
  @override
  final String? startDate;
  @override
  final String? location;

  factory _$NotificationReminder(
          [void Function(NotificationReminderBuilder)? updates]) =>
      (new NotificationReminderBuilder()..update(updates))._build();

  _$NotificationReminder._(
      {this.id, this.doctorName, this.image, this.startDate, this.location})
      : super._();

  @override
  NotificationReminder rebuild(
          void Function(NotificationReminderBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NotificationReminderBuilder toBuilder() =>
      new NotificationReminderBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NotificationReminder &&
        id == other.id &&
        doctorName == other.doctorName &&
        image == other.image &&
        startDate == other.startDate &&
        location == other.location;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, doctorName.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jc(_$hash, startDate.hashCode);
    _$hash = $jc(_$hash, location.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NotificationReminder')
          ..add('id', id)
          ..add('doctorName', doctorName)
          ..add('image', image)
          ..add('startDate', startDate)
          ..add('location', location))
        .toString();
  }
}

class NotificationReminderBuilder
    implements Builder<NotificationReminder, NotificationReminderBuilder> {
  _$NotificationReminder? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _doctorName;
  String? get doctorName => _$this._doctorName;
  set doctorName(String? doctorName) => _$this._doctorName = doctorName;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  String? _startDate;
  String? get startDate => _$this._startDate;
  set startDate(String? startDate) => _$this._startDate = startDate;

  String? _location;
  String? get location => _$this._location;
  set location(String? location) => _$this._location = location;

  NotificationReminderBuilder();

  NotificationReminderBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _doctorName = $v.doctorName;
      _image = $v.image;
      _startDate = $v.startDate;
      _location = $v.location;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NotificationReminder other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NotificationReminder;
  }

  @override
  void update(void Function(NotificationReminderBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NotificationReminder build() => _build();

  _$NotificationReminder _build() {
    final _$result = _$v ??
        new _$NotificationReminder._(
          id: id,
          doctorName: doctorName,
          image: image,
          startDate: startDate,
          location: location,
        );
    replace(_$result);
    return _$result;
  }
}

class _$NotificationDiscount extends NotificationDiscount {
  @override
  final int? id;
  @override
  final String? title;
  @override
  final String? image;
  @override
  final String? endDate;

  factory _$NotificationDiscount(
          [void Function(NotificationDiscountBuilder)? updates]) =>
      (new NotificationDiscountBuilder()..update(updates))._build();

  _$NotificationDiscount._({this.id, this.title, this.image, this.endDate})
      : super._();

  @override
  NotificationDiscount rebuild(
          void Function(NotificationDiscountBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NotificationDiscountBuilder toBuilder() =>
      new NotificationDiscountBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NotificationDiscount &&
        id == other.id &&
        title == other.title &&
        image == other.image &&
        endDate == other.endDate;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jc(_$hash, endDate.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NotificationDiscount')
          ..add('id', id)
          ..add('title', title)
          ..add('image', image)
          ..add('endDate', endDate))
        .toString();
  }
}

class NotificationDiscountBuilder
    implements Builder<NotificationDiscount, NotificationDiscountBuilder> {
  _$NotificationDiscount? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  String? _endDate;
  String? get endDate => _$this._endDate;
  set endDate(String? endDate) => _$this._endDate = endDate;

  NotificationDiscountBuilder();

  NotificationDiscountBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _title = $v.title;
      _image = $v.image;
      _endDate = $v.endDate;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NotificationDiscount other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NotificationDiscount;
  }

  @override
  void update(void Function(NotificationDiscountBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NotificationDiscount build() => _build();

  _$NotificationDiscount _build() {
    final _$result = _$v ??
        new _$NotificationDiscount._(
          id: id,
          title: title,
          image: image,
          endDate: endDate,
        );
    replace(_$result);
    return _$result;
  }
}

class _$NotificationSendReview extends NotificationSendReview {
  @override
  final String? name;
  @override
  final String? ratings;
  @override
  final String? review;
  @override
  final String? status;
  @override
  final String? location;
  @override
  final String? createDate;

  factory _$NotificationSendReview(
          [void Function(NotificationSendReviewBuilder)? updates]) =>
      (new NotificationSendReviewBuilder()..update(updates))._build();

  _$NotificationSendReview._(
      {this.name,
      this.ratings,
      this.review,
      this.status,
      this.location,
      this.createDate})
      : super._();

  @override
  NotificationSendReview rebuild(
          void Function(NotificationSendReviewBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NotificationSendReviewBuilder toBuilder() =>
      new NotificationSendReviewBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NotificationSendReview &&
        name == other.name &&
        ratings == other.ratings &&
        review == other.review &&
        status == other.status &&
        location == other.location &&
        createDate == other.createDate;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, ratings.hashCode);
    _$hash = $jc(_$hash, review.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, location.hashCode);
    _$hash = $jc(_$hash, createDate.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NotificationSendReview')
          ..add('name', name)
          ..add('ratings', ratings)
          ..add('review', review)
          ..add('status', status)
          ..add('location', location)
          ..add('createDate', createDate))
        .toString();
  }
}

class NotificationSendReviewBuilder
    implements Builder<NotificationSendReview, NotificationSendReviewBuilder> {
  _$NotificationSendReview? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _ratings;
  String? get ratings => _$this._ratings;
  set ratings(String? ratings) => _$this._ratings = ratings;

  String? _review;
  String? get review => _$this._review;
  set review(String? review) => _$this._review = review;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  String? _location;
  String? get location => _$this._location;
  set location(String? location) => _$this._location = location;

  String? _createDate;
  String? get createDate => _$this._createDate;
  set createDate(String? createDate) => _$this._createDate = createDate;

  NotificationSendReviewBuilder();

  NotificationSendReviewBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _ratings = $v.ratings;
      _review = $v.review;
      _status = $v.status;
      _location = $v.location;
      _createDate = $v.createDate;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NotificationSendReview other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NotificationSendReview;
  }

  @override
  void update(void Function(NotificationSendReviewBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NotificationSendReview build() => _build();

  _$NotificationSendReview _build() {
    final _$result = _$v ??
        new _$NotificationSendReview._(
          name: name,
          ratings: ratings,
          review: review,
          status: status,
          location: location,
          createDate: createDate,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
