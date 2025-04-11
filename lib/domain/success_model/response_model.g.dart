// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ResponseModel> _$responseModelSerializer =
    new _$ResponseModelSerializer();

class _$ResponseModelSerializer implements StructuredSerializer<ResponseModel> {
  @override
  final Iterable<Type> types = const [ResponseModel, _$ResponseModel];
  @override
  final String wireName = 'ResponseModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, ResponseModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'status',
      serializers.serialize(object.status,
          specifiedType: const FullType(String)),
      'message',
      serializers.serialize(object.message,
          specifiedType: const FullType(String)),
      'is_new_patient',
      serializers.serialize(object.isNewPatient,
          specifiedType: const FullType(bool)),
    ];
    Object? value;
    value = object.accessToken;
    if (value != null) {
      result
        ..add('access_token')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.refreshToken;
    if (value != null) {
      result
        ..add('refresh_token')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.tokenType;
    if (value != null) {
      result
        ..add('token_type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  ResponseModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ResponseModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'is_new_patient':
          result.isNewPatient = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'access_token':
          result.accessToken = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'refresh_token':
          result.refreshToken = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'token_type':
          result.tokenType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$ResponseModel extends ResponseModel {
  @override
  final String status;
  @override
  final String message;
  @override
  final bool isNewPatient;
  @override
  final String? accessToken;
  @override
  final String? refreshToken;
  @override
  final String? tokenType;

  factory _$ResponseModel([void Function(ResponseModelBuilder)? updates]) =>
      (new ResponseModelBuilder()..update(updates))._build();

  _$ResponseModel._(
      {required this.status,
      required this.message,
      required this.isNewPatient,
      this.accessToken,
      this.refreshToken,
      this.tokenType})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(status, r'ResponseModel', 'status');
    BuiltValueNullFieldError.checkNotNull(message, r'ResponseModel', 'message');
    BuiltValueNullFieldError.checkNotNull(
        isNewPatient, r'ResponseModel', 'isNewPatient');
  }

  @override
  ResponseModel rebuild(void Function(ResponseModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ResponseModelBuilder toBuilder() => new ResponseModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ResponseModel &&
        status == other.status &&
        message == other.message &&
        isNewPatient == other.isNewPatient &&
        accessToken == other.accessToken &&
        refreshToken == other.refreshToken &&
        tokenType == other.tokenType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, isNewPatient.hashCode);
    _$hash = $jc(_$hash, accessToken.hashCode);
    _$hash = $jc(_$hash, refreshToken.hashCode);
    _$hash = $jc(_$hash, tokenType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ResponseModel')
          ..add('status', status)
          ..add('message', message)
          ..add('isNewPatient', isNewPatient)
          ..add('accessToken', accessToken)
          ..add('refreshToken', refreshToken)
          ..add('tokenType', tokenType))
        .toString();
  }
}

class ResponseModelBuilder
    implements Builder<ResponseModel, ResponseModelBuilder> {
  _$ResponseModel? _$v;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  bool? _isNewPatient;
  bool? get isNewPatient => _$this._isNewPatient;
  set isNewPatient(bool? isNewPatient) => _$this._isNewPatient = isNewPatient;

  String? _accessToken;
  String? get accessToken => _$this._accessToken;
  set accessToken(String? accessToken) => _$this._accessToken = accessToken;

  String? _refreshToken;
  String? get refreshToken => _$this._refreshToken;
  set refreshToken(String? refreshToken) => _$this._refreshToken = refreshToken;

  String? _tokenType;
  String? get tokenType => _$this._tokenType;
  set tokenType(String? tokenType) => _$this._tokenType = tokenType;

  ResponseModelBuilder();

  ResponseModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _status = $v.status;
      _message = $v.message;
      _isNewPatient = $v.isNewPatient;
      _accessToken = $v.accessToken;
      _refreshToken = $v.refreshToken;
      _tokenType = $v.tokenType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ResponseModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ResponseModel;
  }

  @override
  void update(void Function(ResponseModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ResponseModel build() => _build();

  _$ResponseModel _build() {
    final _$result = _$v ??
        new _$ResponseModel._(
          status: BuiltValueNullFieldError.checkNotNull(
              status, r'ResponseModel', 'status'),
          message: BuiltValueNullFieldError.checkNotNull(
              message, r'ResponseModel', 'message'),
          isNewPatient: BuiltValueNullFieldError.checkNotNull(
              isNewPatient, r'ResponseModel', 'isNewPatient'),
          accessToken: accessToken,
          refreshToken: refreshToken,
          tokenType: tokenType,
        );
    replace(_$result);
    return _$result;
  }
}

class _$ServiceResponse extends ServiceResponse {
  @override
  final String status;
  @override
  final String message;

  factory _$ServiceResponse([void Function(ServiceResponseBuilder)? updates]) =>
      (new ServiceResponseBuilder()..update(updates))._build();

  _$ServiceResponse._({required this.status, required this.message})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(status, r'ServiceResponse', 'status');
    BuiltValueNullFieldError.checkNotNull(
        message, r'ServiceResponse', 'message');
  }

  @override
  ServiceResponse rebuild(void Function(ServiceResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ServiceResponseBuilder toBuilder() =>
      new ServiceResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ServiceResponse &&
        status == other.status &&
        message == other.message;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ServiceResponse')
          ..add('status', status)
          ..add('message', message))
        .toString();
  }
}

class ServiceResponseBuilder
    implements Builder<ServiceResponse, ServiceResponseBuilder> {
  _$ServiceResponse? _$v;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  ServiceResponseBuilder();

  ServiceResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _status = $v.status;
      _message = $v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ServiceResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ServiceResponse;
  }

  @override
  void update(void Function(ServiceResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ServiceResponse build() => _build();

  _$ServiceResponse _build() {
    final _$result = _$v ??
        new _$ServiceResponse._(
          status: BuiltValueNullFieldError.checkNotNull(
              status, r'ServiceResponse', 'status'),
          message: BuiltValueNullFieldError.checkNotNull(
              message, r'ServiceResponse', 'message'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
