// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PhoneNumberSendReq> _$phoneNumberSendReqSerializer =
    new _$PhoneNumberSendReqSerializer();
Serializer<RegisterReq> _$registerReqSerializer = new _$RegisterReqSerializer();
Serializer<RegistrationResponse> _$registrationResponseSerializer =
    new _$RegistrationResponseSerializer();
Serializer<CreateInfoReq> _$createInfoReqSerializer =
    new _$CreateInfoReqSerializer();

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
    final result = <Object?>[
      'phone_number',
      serializers.serialize(object.phoneNumber,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  PhoneNumberSendReq deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PhoneNumberSendReqBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'phone_number':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
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
    final result = new RegisterReqBuilder();

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
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.refreshToken;
    if (value != null) {
      result
        ..add('refresh_token')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
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
  RegistrationResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RegistrationResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'is_new_patient':
          result.isNewPatient = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'access_token':
          result.accessToken.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'refresh_token':
          result.refreshToken.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
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
  CreateInfoReq deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CreateInfoReqBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
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
  final String phoneNumber;

  factory _$PhoneNumberSendReq(
          [void Function(PhoneNumberSendReqBuilder)? updates]) =>
      (new PhoneNumberSendReqBuilder()..update(updates))._build();

  _$PhoneNumberSendReq._({required this.phoneNumber}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        phoneNumber, r'PhoneNumberSendReq', 'phoneNumber');
  }

  @override
  PhoneNumberSendReq rebuild(
          void Function(PhoneNumberSendReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PhoneNumberSendReqBuilder toBuilder() =>
      new PhoneNumberSendReqBuilder()..replace(this);

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
    ArgumentError.checkNotNull(other, 'other');
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
        new _$PhoneNumberSendReq._(
            phoneNumber: BuiltValueNullFieldError.checkNotNull(
                phoneNumber, r'PhoneNumberSendReq', 'phoneNumber'));
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
      (new RegisterReqBuilder()..update(updates))._build();

  _$RegisterReq._({this.phoneNumber, this.code}) : super._();

  @override
  RegisterReq rebuild(void Function(RegisterReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RegisterReqBuilder toBuilder() => new RegisterReqBuilder()..replace(this);

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
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RegisterReq;
  }

  @override
  void update(void Function(RegisterReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RegisterReq build() => _build();

  _$RegisterReq _build() {
    final _$result =
        _$v ?? new _$RegisterReq._(phoneNumber: phoneNumber, code: code);
    replace(_$result);
    return _$result;
  }
}

class _$RegistrationResponse extends RegistrationResponse {
  @override
  final bool isNewPatient;
  @override
  final BuiltList<String>? accessToken;
  @override
  final BuiltList<String>? refreshToken;
  @override
  final String? tokenType;

  factory _$RegistrationResponse(
          [void Function(RegistrationResponseBuilder)? updates]) =>
      (new RegistrationResponseBuilder()..update(updates))._build();

  _$RegistrationResponse._(
      {required this.isNewPatient,
      this.accessToken,
      this.refreshToken,
      this.tokenType})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        isNewPatient, r'RegistrationResponse', 'isNewPatient');
  }

  @override
  RegistrationResponse rebuild(
          void Function(RegistrationResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RegistrationResponseBuilder toBuilder() =>
      new RegistrationResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RegistrationResponse &&
        isNewPatient == other.isNewPatient &&
        accessToken == other.accessToken &&
        refreshToken == other.refreshToken &&
        tokenType == other.tokenType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, isNewPatient.hashCode);
    _$hash = $jc(_$hash, accessToken.hashCode);
    _$hash = $jc(_$hash, refreshToken.hashCode);
    _$hash = $jc(_$hash, tokenType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RegistrationResponse')
          ..add('isNewPatient', isNewPatient)
          ..add('accessToken', accessToken)
          ..add('refreshToken', refreshToken)
          ..add('tokenType', tokenType))
        .toString();
  }
}

class RegistrationResponseBuilder
    implements Builder<RegistrationResponse, RegistrationResponseBuilder> {
  _$RegistrationResponse? _$v;

  bool? _isNewPatient;
  bool? get isNewPatient => _$this._isNewPatient;
  set isNewPatient(bool? isNewPatient) => _$this._isNewPatient = isNewPatient;

  ListBuilder<String>? _accessToken;
  ListBuilder<String> get accessToken =>
      _$this._accessToken ??= new ListBuilder<String>();
  set accessToken(ListBuilder<String>? accessToken) =>
      _$this._accessToken = accessToken;

  ListBuilder<String>? _refreshToken;
  ListBuilder<String> get refreshToken =>
      _$this._refreshToken ??= new ListBuilder<String>();
  set refreshToken(ListBuilder<String>? refreshToken) =>
      _$this._refreshToken = refreshToken;

  String? _tokenType;
  String? get tokenType => _$this._tokenType;
  set tokenType(String? tokenType) => _$this._tokenType = tokenType;

  RegistrationResponseBuilder();

  RegistrationResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isNewPatient = $v.isNewPatient;
      _accessToken = $v.accessToken?.toBuilder();
      _refreshToken = $v.refreshToken?.toBuilder();
      _tokenType = $v.tokenType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RegistrationResponse other) {
    ArgumentError.checkNotNull(other, 'other');
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
          new _$RegistrationResponse._(
              isNewPatient: BuiltValueNullFieldError.checkNotNull(
                  isNewPatient, r'RegistrationResponse', 'isNewPatient'),
              accessToken: _accessToken?.build(),
              refreshToken: _refreshToken?.build(),
              tokenType: tokenType);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'accessToken';
        _accessToken?.build();
        _$failedField = 'refreshToken';
        _refreshToken?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
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
  final String? accessToken;
  @override
  final String? refreshToken;
  @override
  final String? tokenType;

  factory _$CreateInfoReq([void Function(CreateInfoReqBuilder)? updates]) =>
      (new CreateInfoReqBuilder()..update(updates))._build();

  _$CreateInfoReq._(
      {this.firstName,
      this.lastName,
      this.middleName,
      this.phoneNumber,
      this.dateOfBirth,
      this.gender,
      this.passportSerial,
      this.accessToken,
      this.refreshToken,
      this.tokenType})
      : super._();

  @override
  CreateInfoReq rebuild(void Function(CreateInfoReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateInfoReqBuilder toBuilder() => new CreateInfoReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateInfoReq &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        middleName == other.middleName &&
        phoneNumber == other.phoneNumber &&
        dateOfBirth == other.dateOfBirth &&
        gender == other.gender &&
        passportSerial == other.passportSerial &&
        accessToken == other.accessToken &&
        refreshToken == other.refreshToken &&
        tokenType == other.tokenType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, firstName.hashCode);
    _$hash = $jc(_$hash, lastName.hashCode);
    _$hash = $jc(_$hash, middleName.hashCode);
    _$hash = $jc(_$hash, phoneNumber.hashCode);
    _$hash = $jc(_$hash, dateOfBirth.hashCode);
    _$hash = $jc(_$hash, gender.hashCode);
    _$hash = $jc(_$hash, passportSerial.hashCode);
    _$hash = $jc(_$hash, accessToken.hashCode);
    _$hash = $jc(_$hash, refreshToken.hashCode);
    _$hash = $jc(_$hash, tokenType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateInfoReq')
          ..add('firstName', firstName)
          ..add('lastName', lastName)
          ..add('middleName', middleName)
          ..add('phoneNumber', phoneNumber)
          ..add('dateOfBirth', dateOfBirth)
          ..add('gender', gender)
          ..add('passportSerial', passportSerial)
          ..add('accessToken', accessToken)
          ..add('refreshToken', refreshToken)
          ..add('tokenType', tokenType))
        .toString();
  }
}

class CreateInfoReqBuilder
    implements Builder<CreateInfoReq, CreateInfoReqBuilder> {
  _$CreateInfoReq? _$v;

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

  String? _accessToken;
  String? get accessToken => _$this._accessToken;
  set accessToken(String? accessToken) => _$this._accessToken = accessToken;

  String? _refreshToken;
  String? get refreshToken => _$this._refreshToken;
  set refreshToken(String? refreshToken) => _$this._refreshToken = refreshToken;

  String? _tokenType;
  String? get tokenType => _$this._tokenType;
  set tokenType(String? tokenType) => _$this._tokenType = tokenType;

  CreateInfoReqBuilder();

  CreateInfoReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _firstName = $v.firstName;
      _lastName = $v.lastName;
      _middleName = $v.middleName;
      _phoneNumber = $v.phoneNumber;
      _dateOfBirth = $v.dateOfBirth;
      _gender = $v.gender;
      _passportSerial = $v.passportSerial;
      _accessToken = $v.accessToken;
      _refreshToken = $v.refreshToken;
      _tokenType = $v.tokenType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateInfoReq other) {
    ArgumentError.checkNotNull(other, 'other');
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
        new _$CreateInfoReq._(
            firstName: firstName,
            lastName: lastName,
            middleName: middleName,
            phoneNumber: phoneNumber,
            dateOfBirth: dateOfBirth,
            gender: gender,
            passportSerial: passportSerial,
            accessToken: accessToken,
            refreshToken: refreshToken,
            tokenType: tokenType);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
