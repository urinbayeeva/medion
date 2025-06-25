// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SetFcmTokenBody> _$setFcmTokenBodySerializer =
    new _$SetFcmTokenBodySerializer();
Serializer<NotificationModel> _$notificationModelSerializer =
    new _$NotificationModelSerializer();

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
    value = object.bodyLink;
    if (value != null) {
      result
        ..add('body_link')
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
    value = object.objType;
    if (value != null) {
      result
        ..add('obj_type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.objId;
    if (value != null) {
      result
        ..add('obj_id')
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
    value = object.buttonLabel;
    if (value != null) {
      result
        ..add('button_label')
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
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'body_link':
          result.bodyLink = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'body':
          result.body = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'obj_type':
          result.objType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'obj_id':
          result.objId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'is_read':
          result.isRead = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'button_label':
          result.buttonLabel = serializers.deserialize(value,
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
  final String? type;
  @override
  final String? title;
  @override
  final String? bodyLink;
  @override
  final String? body;
  @override
  final String? objType;
  @override
  final String? objId;
  @override
  final String? image;
  @override
  final bool? isRead;
  @override
  final String? createdAt;
  @override
  final String? buttonLabel;

  factory _$NotificationModel(
          [void Function(NotificationModelBuilder)? updates]) =>
      (new NotificationModelBuilder()..update(updates))._build();

  _$NotificationModel._(
      {this.id,
      this.type,
      this.title,
      this.bodyLink,
      this.body,
      this.objType,
      this.objId,
      this.image,
      this.isRead,
      this.createdAt,
      this.buttonLabel})
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
        type == other.type &&
        title == other.title &&
        bodyLink == other.bodyLink &&
        body == other.body &&
        objType == other.objType &&
        objId == other.objId &&
        image == other.image &&
        isRead == other.isRead &&
        createdAt == other.createdAt &&
        buttonLabel == other.buttonLabel;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, bodyLink.hashCode);
    _$hash = $jc(_$hash, body.hashCode);
    _$hash = $jc(_$hash, objType.hashCode);
    _$hash = $jc(_$hash, objId.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jc(_$hash, isRead.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, buttonLabel.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NotificationModel')
          ..add('id', id)
          ..add('type', type)
          ..add('title', title)
          ..add('bodyLink', bodyLink)
          ..add('body', body)
          ..add('objType', objType)
          ..add('objId', objId)
          ..add('image', image)
          ..add('isRead', isRead)
          ..add('createdAt', createdAt)
          ..add('buttonLabel', buttonLabel))
        .toString();
  }
}

class NotificationModelBuilder
    implements Builder<NotificationModel, NotificationModelBuilder> {
  _$NotificationModel? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _bodyLink;
  String? get bodyLink => _$this._bodyLink;
  set bodyLink(String? bodyLink) => _$this._bodyLink = bodyLink;

  String? _body;
  String? get body => _$this._body;
  set body(String? body) => _$this._body = body;

  String? _objType;
  String? get objType => _$this._objType;
  set objType(String? objType) => _$this._objType = objType;

  String? _objId;
  String? get objId => _$this._objId;
  set objId(String? objId) => _$this._objId = objId;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  bool? _isRead;
  bool? get isRead => _$this._isRead;
  set isRead(bool? isRead) => _$this._isRead = isRead;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  String? _buttonLabel;
  String? get buttonLabel => _$this._buttonLabel;
  set buttonLabel(String? buttonLabel) => _$this._buttonLabel = buttonLabel;

  NotificationModelBuilder();

  NotificationModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _type = $v.type;
      _title = $v.title;
      _bodyLink = $v.bodyLink;
      _body = $v.body;
      _objType = $v.objType;
      _objId = $v.objId;
      _image = $v.image;
      _isRead = $v.isRead;
      _createdAt = $v.createdAt;
      _buttonLabel = $v.buttonLabel;
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
    final _$result = _$v ??
        new _$NotificationModel._(
          id: id,
          type: type,
          title: title,
          bodyLink: bodyLink,
          body: body,
          objType: objType,
          objId: objId,
          image: image,
          isRead: isRead,
          createdAt: createdAt,
          buttonLabel: buttonLabel,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
