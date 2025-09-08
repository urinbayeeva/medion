// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PhoneNumberSendReq> _$phoneNumberSendReqSerializer =
    _$PhoneNumberSendReqSerializer();
Serializer<RegisterReq> _$registerReqSerializer = _$RegisterReqSerializer();
Serializer<User> _$userSerializer = _$UserSerializer();
Serializer<RegistrationResponse> _$registrationResponseSerializer =
    _$RegistrationResponseSerializer();
Serializer<CreateInfoReq> _$createInfoReqSerializer =
    _$CreateInfoReqSerializer();
Serializer<CreatePatientInfoResponse> _$createPatientInfoResponseSerializer =
    _$CreatePatientInfoResponseSerializer();
Serializer<RefreshTokenModel> _$refreshTokenModelSerializer =
    _$RefreshTokenModelSerializer();
Serializer<RefreshTokenResponseModel> _$refreshTokenResponseModelSerializer =
    _$RefreshTokenResponseModelSerializer();

class _$PhoneNumberSendReqSerializer
    implements StructuredSerializer<PhoneNumberSendReq> {
  @override
  final Iterable<Type> types = const [PhoneNumberSendReq, _$PhoneNumberSendReq];
  @override
  final String wireName = 'PhoneNumberSendReq';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, PhoneNumberSendReq object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.phoneNumber;
    if (value != null) {
      result
        ..add('phone_number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  PhoneNumberSendReq deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = PhoneNumberSendReqBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'phone_number':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$RegisterReqSerializer implements StructuredSerializer<RegisterReq> {
  @override
  final Iterable<Type> types = const [RegisterReq, _$RegisterReq];
  @override
  final String wireName = 'RegisterReq';

  @override
  Iterable<Object?> serialize(Serializers serializers, RegisterReq object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.phoneNumber;
    if (value != null) {
      result
        ..add('phone_number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.code;
    if (value != null) {
      result
        ..add('code')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  RegisterReq deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = RegisterReqBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'phone_number':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'code':
          result.code = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$UserSerializer implements StructuredSerializer<User> {
  @override
  final Iterable<Type> types = const [User, _$User];
  @override
  final String wireName = 'User';

  @override
  Iterable<Object?> serialize(Serializers serializers, User object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'access_token',
      serializers.serialize(object.accessToken,
          specifiedType: const FullType(String)),
      'refresh_token',
      serializers.serialize(object.refreshToken,
          specifiedType: const FullType(String)),
      'token_type',
      serializers.serialize(object.tokenType,
          specifiedType: const FullType(String)),
      'offerta',
      serializers.serialize(object.offerta,
          specifiedType: const FullType(bool)),
    ];
    Object? value;
    value = object.image;
    if (value != null) {
      result
        ..add('image')
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
    return result;
  }

  @override
  User deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = UserBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'access_token':
          result.accessToken = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'refresh_token':
          result.refreshToken = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'token_type':
          result.tokenType = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'offerta':
          result.offerta = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$RegistrationResponseSerializer
    implements StructuredSerializer<RegistrationResponse> {
  @override
  final Iterable<Type> types = const [
    RegistrationResponse,
    _$RegistrationResponse
  ];
  @override
  final String wireName = 'RegistrationResponse';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, RegistrationResponse object,
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
      'multi_user',
      serializers.serialize(object.multiUser,
          specifiedType: const FullType(bool)),
      'users',
      serializers.serialize(object.users,
          specifiedType:
              const FullType(BuiltList, const [const FullType(User)])),
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
    value = object.offerta;
    if (value != null) {
      result
        ..add('offerta')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  RegistrationResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = RegistrationResponseBuilder();

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
        case 'multi_user':
          result.multiUser = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'users':
          result.users.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(User)]))!
              as BuiltList<Object?>);
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
        case 'offerta':
          result.offerta = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
      }
    }

    return result.build();
  }
}

class _$CreateInfoReqSerializer implements StructuredSerializer<CreateInfoReq> {
  @override
  final Iterable<Type> types = const [CreateInfoReq, _$CreateInfoReq];
  @override
  final String wireName = 'CreateInfoReq';

  @override
  Iterable<Object?> serialize(Serializers serializers, CreateInfoReq object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.deviceId;
    if (value != null) {
      result
        ..add('device_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.deviceName;
    if (value != null) {
      result
        ..add('device_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.os;
    if (value != null) {
      result
        ..add('os')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.appVersion;
    if (value != null) {
      result
        ..add('app_version')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.firstName;
    if (value != null) {
      result
        ..add('first_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lastName;
    if (value != null) {
      result
        ..add('last_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.middleName;
    if (value != null) {
      result
        ..add('middle_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.phoneNumber;
    if (value != null) {
      result
        ..add('phone_number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.dateOfBirth;
    if (value != null) {
      result
        ..add('date_of_birth')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.gender;
    if (value != null) {
      result
        ..add('gender')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.passportSerial;
    if (value != null) {
      result
        ..add('passport_serial')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.offerta;
    if (value != null) {
      result
        ..add('offerta')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  CreateInfoReq deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = CreateInfoReqBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'device_id':
          result.deviceId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'device_name':
          result.deviceName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'os':
          result.os = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'app_version':
          result.appVersion = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'first_name':
          result.firstName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'last_name':
          result.lastName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'middle_name':
          result.middleName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'phone_number':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'date_of_birth':
          result.dateOfBirth = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'gender':
          result.gender = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'passport_serial':
          result.passportSerial = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'offerta':
          result.offerta = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
      }
    }

    return result.build();
  }
}

class _$CreatePatientInfoResponseSerializer
    implements StructuredSerializer<CreatePatientInfoResponse> {
  @override
  final Iterable<Type> types = const [
    CreatePatientInfoResponse,
    _$CreatePatientInfoResponse
  ];
  @override
  final String wireName = 'CreatePatientInfoResponse';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, CreatePatientInfoResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.accesstoken;
    if (value != null) {
      result
        ..add('access_token')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.refreshtoken;
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
  CreatePatientInfoResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = CreatePatientInfoResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'access_token':
          result.accesstoken = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'refresh_token':
          result.refreshtoken = serializers.deserialize(value,
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

class _$RefreshTokenModelSerializer
    implements StructuredSerializer<RefreshTokenModel> {
  @override
  final Iterable<Type> types = const [RefreshTokenModel, _$RefreshTokenModel];
  @override
  final String wireName = 'RefreshTokenModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, RefreshTokenModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.token;
    if (value != null) {
      result
        ..add('token')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  RefreshTokenModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = RefreshTokenModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'token':
          result.token = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$RefreshTokenResponseModelSerializer
    implements StructuredSerializer<RefreshTokenResponseModel> {
  @override
  final Iterable<Type> types = const [
    RefreshTokenResponseModel,
    _$RefreshTokenResponseModel
  ];
  @override
  final String wireName = 'RefreshTokenResponseModel';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, RefreshTokenResponseModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
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
  RefreshTokenResponseModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = RefreshTokenResponseModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
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

class _$PhoneNumberSendReq extends PhoneNumberSendReq {
  @override
  final String? phoneNumber;

  factory _$PhoneNumberSendReq(
          [void Function(PhoneNumberSendReqBuilder)? updates]) =>
      (PhoneNumberSendReqBuilder()..update(updates))._build();

  _$PhoneNumberSendReq._({this.phoneNumber}) : super._();
  @override
  PhoneNumberSendReq rebuild(
          void Function(PhoneNumberSendReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PhoneNumberSendReqBuilder toBuilder() =>
      PhoneNumberSendReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PhoneNumberSendReq && phoneNumber == other.phoneNumber;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, phoneNumber.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PhoneNumberSendReq')
          ..add('phoneNumber', phoneNumber))
        .toString();
  }
}

class PhoneNumberSendReqBuilder
    implements Builder<PhoneNumberSendReq, PhoneNumberSendReqBuilder> {
  _$PhoneNumberSendReq? _$v;

  String? _phoneNumber;
  String? get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String? phoneNumber) => _$this._phoneNumber = phoneNumber;

  PhoneNumberSendReqBuilder();

  PhoneNumberSendReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _phoneNumber = $v.phoneNumber;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PhoneNumberSendReq other) {
    _$v = other as _$PhoneNumberSendReq;
  }

  @override
  void update(void Function(PhoneNumberSendReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PhoneNumberSendReq build() => _build();

  _$PhoneNumberSendReq _build() {
    final _$result = _$v ??
        _$PhoneNumberSendReq._(
          phoneNumber: phoneNumber,
        );
    replace(_$result);
    return _$result;
  }
}

class _$RegisterReq extends RegisterReq {
  @override
  final String? phoneNumber;
  @override
  final String? code;

  factory _$RegisterReq([void Function(RegisterReqBuilder)? updates]) =>
      (RegisterReqBuilder()..update(updates))._build();

  _$RegisterReq._({this.phoneNumber, this.code}) : super._();
  @override
  RegisterReq rebuild(void Function(RegisterReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RegisterReqBuilder toBuilder() => RegisterReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RegisterReq &&
        phoneNumber == other.phoneNumber &&
        code == other.code;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, phoneNumber.hashCode);
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RegisterReq')
          ..add('phoneNumber', phoneNumber)
          ..add('code', code))
        .toString();
  }
}

class RegisterReqBuilder implements Builder<RegisterReq, RegisterReqBuilder> {
  _$RegisterReq? _$v;

  String? _phoneNumber;
  String? get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String? phoneNumber) => _$this._phoneNumber = phoneNumber;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  RegisterReqBuilder();

  RegisterReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _phoneNumber = $v.phoneNumber;
      _code = $v.code;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RegisterReq other) {
    _$v = other as _$RegisterReq;
  }

  @override
  void update(void Function(RegisterReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RegisterReq build() => _build();

  _$RegisterReq _build() {
    final _$result = _$v ??
        _$RegisterReq._(
          phoneNumber: phoneNumber,
          code: code,
        );
    replace(_$result);
    return _$result;
  }
}

class _$User extends User {
  @override
  final String name;
  @override
  final String accessToken;
  @override
  final String? image;
  @override
  final String? date;
  @override
  final String refreshToken;
  @override
  final String tokenType;
  @override
  final bool offerta;

  factory _$User([void Function(UserBuilder)? updates]) =>
      (UserBuilder()..update(updates))._build();

  _$User._(
      {required this.name,
      required this.accessToken,
      this.image,
      this.date,
      required this.refreshToken,
      required this.tokenType,
      required this.offerta})
      : super._();
  @override
  User rebuild(void Function(UserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserBuilder toBuilder() => UserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is User &&
        name == other.name &&
        accessToken == other.accessToken &&
        image == other.image &&
        date == other.date &&
        refreshToken == other.refreshToken &&
        tokenType == other.tokenType &&
        offerta == other.offerta;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, accessToken.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jc(_$hash, date.hashCode);
    _$hash = $jc(_$hash, refreshToken.hashCode);
    _$hash = $jc(_$hash, tokenType.hashCode);
    _$hash = $jc(_$hash, offerta.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'User')
          ..add('name', name)
          ..add('accessToken', accessToken)
          ..add('image', image)
          ..add('date', date)
          ..add('refreshToken', refreshToken)
          ..add('tokenType', tokenType)
          ..add('offerta', offerta))
        .toString();
  }
}

class UserBuilder implements Builder<User, UserBuilder> {
  _$User? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _accessToken;
  String? get accessToken => _$this._accessToken;
  set accessToken(String? accessToken) => _$this._accessToken = accessToken;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  String? _date;
  String? get date => _$this._date;
  set date(String? date) => _$this._date = date;

  String? _refreshToken;
  String? get refreshToken => _$this._refreshToken;
  set refreshToken(String? refreshToken) => _$this._refreshToken = refreshToken;

  String? _tokenType;
  String? get tokenType => _$this._tokenType;
  set tokenType(String? tokenType) => _$this._tokenType = tokenType;

  bool? _offerta;
  bool? get offerta => _$this._offerta;
  set offerta(bool? offerta) => _$this._offerta = offerta;

  UserBuilder();

  UserBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _accessToken = $v.accessToken;
      _image = $v.image;
      _date = $v.date;
      _refreshToken = $v.refreshToken;
      _tokenType = $v.tokenType;
      _offerta = $v.offerta;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(User other) {
    _$v = other as _$User;
  }

  @override
  void update(void Function(UserBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  User build() => _build();

  _$User _build() {
    final _$result = _$v ??
        _$User._(
          name: BuiltValueNullFieldError.checkNotNull(name, r'User', 'name'),
          accessToken: BuiltValueNullFieldError.checkNotNull(
              accessToken, r'User', 'accessToken'),
          image: image,
          date: date,
          refreshToken: BuiltValueNullFieldError.checkNotNull(
              refreshToken, r'User', 'refreshToken'),
          tokenType: BuiltValueNullFieldError.checkNotNull(
              tokenType, r'User', 'tokenType'),
          offerta: BuiltValueNullFieldError.checkNotNull(
              offerta, r'User', 'offerta'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$RegistrationResponse extends RegistrationResponse {
  @override
  final String status;
  @override
  final String message;
  @override
  final bool isNewPatient;
  @override
  final bool multiUser;
  @override
  final BuiltList<User> users;
  @override
  final String? accessToken;
  @override
  final String? refreshToken;
  @override
  final String? tokenType;
  @override
  final bool? offerta;

  factory _$RegistrationResponse(
          [void Function(RegistrationResponseBuilder)? updates]) =>
      (RegistrationResponseBuilder()..update(updates))._build();

  _$RegistrationResponse._(
      {required this.status,
      required this.message,
      required this.isNewPatient,
      required this.multiUser,
      required this.users,
      this.accessToken,
      this.refreshToken,
      this.tokenType,
      this.offerta})
      : super._();
  @override
  RegistrationResponse rebuild(
          void Function(RegistrationResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RegistrationResponseBuilder toBuilder() =>
      RegistrationResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RegistrationResponse &&
        status == other.status &&
        message == other.message &&
        isNewPatient == other.isNewPatient &&
        multiUser == other.multiUser &&
        users == other.users &&
        accessToken == other.accessToken &&
        refreshToken == other.refreshToken &&
        tokenType == other.tokenType &&
        offerta == other.offerta;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, isNewPatient.hashCode);
    _$hash = $jc(_$hash, multiUser.hashCode);
    _$hash = $jc(_$hash, users.hashCode);
    _$hash = $jc(_$hash, accessToken.hashCode);
    _$hash = $jc(_$hash, refreshToken.hashCode);
    _$hash = $jc(_$hash, tokenType.hashCode);
    _$hash = $jc(_$hash, offerta.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RegistrationResponse')
          ..add('status', status)
          ..add('message', message)
          ..add('isNewPatient', isNewPatient)
          ..add('multiUser', multiUser)
          ..add('users', users)
          ..add('accessToken', accessToken)
          ..add('refreshToken', refreshToken)
          ..add('tokenType', tokenType)
          ..add('offerta', offerta))
        .toString();
  }
}

class RegistrationResponseBuilder
    implements Builder<RegistrationResponse, RegistrationResponseBuilder> {
  _$RegistrationResponse? _$v;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  bool? _isNewPatient;
  bool? get isNewPatient => _$this._isNewPatient;
  set isNewPatient(bool? isNewPatient) => _$this._isNewPatient = isNewPatient;

  bool? _multiUser;
  bool? get multiUser => _$this._multiUser;
  set multiUser(bool? multiUser) => _$this._multiUser = multiUser;

  ListBuilder<User>? _users;
  ListBuilder<User> get users => _$this._users ??= ListBuilder<User>();
  set users(ListBuilder<User>? users) => _$this._users = users;

  String? _accessToken;
  String? get accessToken => _$this._accessToken;
  set accessToken(String? accessToken) => _$this._accessToken = accessToken;

  String? _refreshToken;
  String? get refreshToken => _$this._refreshToken;
  set refreshToken(String? refreshToken) => _$this._refreshToken = refreshToken;

  String? _tokenType;
  String? get tokenType => _$this._tokenType;
  set tokenType(String? tokenType) => _$this._tokenType = tokenType;

  bool? _offerta;
  bool? get offerta => _$this._offerta;
  set offerta(bool? offerta) => _$this._offerta = offerta;

  RegistrationResponseBuilder();

  RegistrationResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _status = $v.status;
      _message = $v.message;
      _isNewPatient = $v.isNewPatient;
      _multiUser = $v.multiUser;
      _users = $v.users.toBuilder();
      _accessToken = $v.accessToken;
      _refreshToken = $v.refreshToken;
      _tokenType = $v.tokenType;
      _offerta = $v.offerta;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RegistrationResponse other) {
    _$v = other as _$RegistrationResponse;
  }

  @override
  void update(void Function(RegistrationResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RegistrationResponse build() => _build();

  _$RegistrationResponse _build() {
    _$RegistrationResponse _$result;
    try {
      _$result = _$v ??
          _$RegistrationResponse._(
            status: BuiltValueNullFieldError.checkNotNull(
                status, r'RegistrationResponse', 'status'),
            message: BuiltValueNullFieldError.checkNotNull(
                message, r'RegistrationResponse', 'message'),
            isNewPatient: BuiltValueNullFieldError.checkNotNull(
                isNewPatient, r'RegistrationResponse', 'isNewPatient'),
            multiUser: BuiltValueNullFieldError.checkNotNull(
                multiUser, r'RegistrationResponse', 'multiUser'),
            users: users.build(),
            accessToken: accessToken,
            refreshToken: refreshToken,
            tokenType: tokenType,
            offerta: offerta,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'users';
        users.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'RegistrationResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$CreateInfoReq extends CreateInfoReq {
  @override
  final String? deviceId;
  @override
  final String? deviceName;
  @override
  final String? os;
  @override
  final String? appVersion;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? middleName;
  @override
  final String? phoneNumber;
  @override
  final String? dateOfBirth;
  @override
  final String? gender;
  @override
  final String? passportSerial;
  @override
  final bool? offerta;

  factory _$CreateInfoReq([void Function(CreateInfoReqBuilder)? updates]) =>
      (CreateInfoReqBuilder()..update(updates))._build();

  _$CreateInfoReq._(
      {this.deviceId,
      this.deviceName,
      this.os,
      this.appVersion,
      this.firstName,
      this.lastName,
      this.middleName,
      this.phoneNumber,
      this.dateOfBirth,
      this.gender,
      this.passportSerial,
      this.offerta})
      : super._();
  @override
  CreateInfoReq rebuild(void Function(CreateInfoReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateInfoReqBuilder toBuilder() => CreateInfoReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateInfoReq &&
        deviceId == other.deviceId &&
        deviceName == other.deviceName &&
        os == other.os &&
        appVersion == other.appVersion &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        middleName == other.middleName &&
        phoneNumber == other.phoneNumber &&
        dateOfBirth == other.dateOfBirth &&
        gender == other.gender &&
        passportSerial == other.passportSerial &&
        offerta == other.offerta;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, deviceId.hashCode);
    _$hash = $jc(_$hash, deviceName.hashCode);
    _$hash = $jc(_$hash, os.hashCode);
    _$hash = $jc(_$hash, appVersion.hashCode);
    _$hash = $jc(_$hash, firstName.hashCode);
    _$hash = $jc(_$hash, lastName.hashCode);
    _$hash = $jc(_$hash, middleName.hashCode);
    _$hash = $jc(_$hash, phoneNumber.hashCode);
    _$hash = $jc(_$hash, dateOfBirth.hashCode);
    _$hash = $jc(_$hash, gender.hashCode);
    _$hash = $jc(_$hash, passportSerial.hashCode);
    _$hash = $jc(_$hash, offerta.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateInfoReq')
          ..add('deviceId', deviceId)
          ..add('deviceName', deviceName)
          ..add('os', os)
          ..add('appVersion', appVersion)
          ..add('firstName', firstName)
          ..add('lastName', lastName)
          ..add('middleName', middleName)
          ..add('phoneNumber', phoneNumber)
          ..add('dateOfBirth', dateOfBirth)
          ..add('gender', gender)
          ..add('passportSerial', passportSerial)
          ..add('offerta', offerta))
        .toString();
  }
}

class CreateInfoReqBuilder
    implements Builder<CreateInfoReq, CreateInfoReqBuilder> {
  _$CreateInfoReq? _$v;

  String? _deviceId;
  String? get deviceId => _$this._deviceId;
  set deviceId(String? deviceId) => _$this._deviceId = deviceId;

  String? _deviceName;
  String? get deviceName => _$this._deviceName;
  set deviceName(String? deviceName) => _$this._deviceName = deviceName;

  String? _os;
  String? get os => _$this._os;
  set os(String? os) => _$this._os = os;

  String? _appVersion;
  String? get appVersion => _$this._appVersion;
  set appVersion(String? appVersion) => _$this._appVersion = appVersion;

  String? _firstName;
  String? get firstName => _$this._firstName;
  set firstName(String? firstName) => _$this._firstName = firstName;

  String? _lastName;
  String? get lastName => _$this._lastName;
  set lastName(String? lastName) => _$this._lastName = lastName;

  String? _middleName;
  String? get middleName => _$this._middleName;
  set middleName(String? middleName) => _$this._middleName = middleName;

  String? _phoneNumber;
  String? get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String? phoneNumber) => _$this._phoneNumber = phoneNumber;

  String? _dateOfBirth;
  String? get dateOfBirth => _$this._dateOfBirth;
  set dateOfBirth(String? dateOfBirth) => _$this._dateOfBirth = dateOfBirth;

  String? _gender;
  String? get gender => _$this._gender;
  set gender(String? gender) => _$this._gender = gender;

  String? _passportSerial;
  String? get passportSerial => _$this._passportSerial;
  set passportSerial(String? passportSerial) =>
      _$this._passportSerial = passportSerial;

  bool? _offerta;
  bool? get offerta => _$this._offerta;
  set offerta(bool? offerta) => _$this._offerta = offerta;

  CreateInfoReqBuilder();

  CreateInfoReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _deviceId = $v.deviceId;
      _deviceName = $v.deviceName;
      _os = $v.os;
      _appVersion = $v.appVersion;
      _firstName = $v.firstName;
      _lastName = $v.lastName;
      _middleName = $v.middleName;
      _phoneNumber = $v.phoneNumber;
      _dateOfBirth = $v.dateOfBirth;
      _gender = $v.gender;
      _passportSerial = $v.passportSerial;
      _offerta = $v.offerta;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateInfoReq other) {
    _$v = other as _$CreateInfoReq;
  }

  @override
  void update(void Function(CreateInfoReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateInfoReq build() => _build();

  _$CreateInfoReq _build() {
    final _$result = _$v ??
        _$CreateInfoReq._(
          deviceId: deviceId,
          deviceName: deviceName,
          os: os,
          appVersion: appVersion,
          firstName: firstName,
          lastName: lastName,
          middleName: middleName,
          phoneNumber: phoneNumber,
          dateOfBirth: dateOfBirth,
          gender: gender,
          passportSerial: passportSerial,
          offerta: offerta,
        );
    replace(_$result);
    return _$result;
  }
}

class _$CreatePatientInfoResponse extends CreatePatientInfoResponse {
  @override
  final String? accesstoken;
  @override
  final String? refreshtoken;
  @override
  final String? tokenType;

  factory _$CreatePatientInfoResponse(
          [void Function(CreatePatientInfoResponseBuilder)? updates]) =>
      (CreatePatientInfoResponseBuilder()..update(updates))._build();

  _$CreatePatientInfoResponse._(
      {this.accesstoken, this.refreshtoken, this.tokenType})
      : super._();
  @override
  CreatePatientInfoResponse rebuild(
          void Function(CreatePatientInfoResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreatePatientInfoResponseBuilder toBuilder() =>
      CreatePatientInfoResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreatePatientInfoResponse &&
        accesstoken == other.accesstoken &&
        refreshtoken == other.refreshtoken &&
        tokenType == other.tokenType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, accesstoken.hashCode);
    _$hash = $jc(_$hash, refreshtoken.hashCode);
    _$hash = $jc(_$hash, tokenType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreatePatientInfoResponse')
          ..add('accesstoken', accesstoken)
          ..add('refreshtoken', refreshtoken)
          ..add('tokenType', tokenType))
        .toString();
  }
}

class CreatePatientInfoResponseBuilder
    implements
        Builder<CreatePatientInfoResponse, CreatePatientInfoResponseBuilder> {
  _$CreatePatientInfoResponse? _$v;

  String? _accesstoken;
  String? get accesstoken => _$this._accesstoken;
  set accesstoken(String? accesstoken) => _$this._accesstoken = accesstoken;

  String? _refreshtoken;
  String? get refreshtoken => _$this._refreshtoken;
  set refreshtoken(String? refreshtoken) => _$this._refreshtoken = refreshtoken;

  String? _tokenType;
  String? get tokenType => _$this._tokenType;
  set tokenType(String? tokenType) => _$this._tokenType = tokenType;

  CreatePatientInfoResponseBuilder();

  CreatePatientInfoResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _accesstoken = $v.accesstoken;
      _refreshtoken = $v.refreshtoken;
      _tokenType = $v.tokenType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreatePatientInfoResponse other) {
    _$v = other as _$CreatePatientInfoResponse;
  }

  @override
  void update(void Function(CreatePatientInfoResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreatePatientInfoResponse build() => _build();

  _$CreatePatientInfoResponse _build() {
    final _$result = _$v ??
        _$CreatePatientInfoResponse._(
          accesstoken: accesstoken,
          refreshtoken: refreshtoken,
          tokenType: tokenType,
        );
    replace(_$result);
    return _$result;
  }
}

class _$RefreshTokenModel extends RefreshTokenModel {
  @override
  final String? token;

  factory _$RefreshTokenModel(
          [void Function(RefreshTokenModelBuilder)? updates]) =>
      (RefreshTokenModelBuilder()..update(updates))._build();

  _$RefreshTokenModel._({this.token}) : super._();
  @override
  RefreshTokenModel rebuild(void Function(RefreshTokenModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RefreshTokenModelBuilder toBuilder() =>
      RefreshTokenModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RefreshTokenModel && token == other.token;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, token.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RefreshTokenModel')
          ..add('token', token))
        .toString();
  }
}

class RefreshTokenModelBuilder
    implements Builder<RefreshTokenModel, RefreshTokenModelBuilder> {
  _$RefreshTokenModel? _$v;

  String? _token;
  String? get token => _$this._token;
  set token(String? token) => _$this._token = token;

  RefreshTokenModelBuilder();

  RefreshTokenModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _token = $v.token;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RefreshTokenModel other) {
    _$v = other as _$RefreshTokenModel;
  }

  @override
  void update(void Function(RefreshTokenModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RefreshTokenModel build() => _build();

  _$RefreshTokenModel _build() {
    final _$result = _$v ??
        _$RefreshTokenModel._(
          token: token,
        );
    replace(_$result);
    return _$result;
  }
}

class _$RefreshTokenResponseModel extends RefreshTokenResponseModel {
  @override
  final String? accessToken;
  @override
  final String? refreshToken;
  @override
  final String? tokenType;

  factory _$RefreshTokenResponseModel(
          [void Function(RefreshTokenResponseModelBuilder)? updates]) =>
      (RefreshTokenResponseModelBuilder()..update(updates))._build();

  _$RefreshTokenResponseModel._(
      {this.accessToken, this.refreshToken, this.tokenType})
      : super._();
  @override
  RefreshTokenResponseModel rebuild(
          void Function(RefreshTokenResponseModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RefreshTokenResponseModelBuilder toBuilder() =>
      RefreshTokenResponseModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RefreshTokenResponseModel &&
        accessToken == other.accessToken &&
        refreshToken == other.refreshToken &&
        tokenType == other.tokenType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, accessToken.hashCode);
    _$hash = $jc(_$hash, refreshToken.hashCode);
    _$hash = $jc(_$hash, tokenType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RefreshTokenResponseModel')
          ..add('accessToken', accessToken)
          ..add('refreshToken', refreshToken)
          ..add('tokenType', tokenType))
        .toString();
  }
}

class RefreshTokenResponseModelBuilder
    implements
        Builder<RefreshTokenResponseModel, RefreshTokenResponseModelBuilder> {
  _$RefreshTokenResponseModel? _$v;

  String? _accessToken;
  String? get accessToken => _$this._accessToken;
  set accessToken(String? accessToken) => _$this._accessToken = accessToken;

  String? _refreshToken;
  String? get refreshToken => _$this._refreshToken;
  set refreshToken(String? refreshToken) => _$this._refreshToken = refreshToken;

  String? _tokenType;
  String? get tokenType => _$this._tokenType;
  set tokenType(String? tokenType) => _$this._tokenType = tokenType;

  RefreshTokenResponseModelBuilder();

  RefreshTokenResponseModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _accessToken = $v.accessToken;
      _refreshToken = $v.refreshToken;
      _tokenType = $v.tokenType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RefreshTokenResponseModel other) {
    _$v = other as _$RefreshTokenResponseModel;
  }

  @override
  void update(void Function(RefreshTokenResponseModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RefreshTokenResponseModel build() => _build();

  _$RefreshTokenResponseModel _build() {
    final _$result = _$v ??
        _$RefreshTokenResponseModel._(
          accessToken: accessToken,
          refreshToken: refreshToken,
          tokenType: tokenType,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
