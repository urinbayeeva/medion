// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PhoneNumberSendReq> _$phoneNumberSendReqSerializer =
    new _$PhoneNumberSendReqSerializer();
Serializer<VerificationSendReq> _$verificationSendReqSerializer =
    new _$VerificationSendReqSerializer();
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

class _$VerificationSendReqSerializer
    implements StructuredSerializer<VerificationSendReq> {
  @override
  final Iterable<Type> types = const [
    VerificationSendReq,
    _$VerificationSendReq
  ];
  @override
  final String wireName = 'VerificationSendReq';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, VerificationSendReq object,
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
  VerificationSendReq deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new VerificationSendReqBuilder();

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

class _$VerificationSendReq extends VerificationSendReq {
  @override
  final String? phoneNumber;
  @override
  final String? code;

  factory _$VerificationSendReq(
          [void Function(VerificationSendReqBuilder)? updates]) =>
      (new VerificationSendReqBuilder()..update(updates))._build();

  _$VerificationSendReq._({this.phoneNumber, this.code}) : super._();

  @override
  VerificationSendReq rebuild(
          void Function(VerificationSendReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VerificationSendReqBuilder toBuilder() =>
      new VerificationSendReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VerificationSendReq &&
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
    return (newBuiltValueToStringHelper(r'VerificationSendReq')
          ..add('phoneNumber', phoneNumber)
          ..add('code', code))
        .toString();
  }
}

class VerificationSendReqBuilder
    implements Builder<VerificationSendReq, VerificationSendReqBuilder> {
  _$VerificationSendReq? _$v;

  String? _phoneNumber;
  String? get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String? phoneNumber) => _$this._phoneNumber = phoneNumber;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  VerificationSendReqBuilder();

  VerificationSendReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _phoneNumber = $v.phoneNumber;
      _code = $v.code;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VerificationSendReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$VerificationSendReq;
  }

  @override
  void update(void Function(VerificationSendReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  VerificationSendReq build() => _build();

  _$VerificationSendReq _build() {
    final _$result = _$v ??
        new _$VerificationSendReq._(phoneNumber: phoneNumber, code: code);
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

  factory _$CreateInfoReq([void Function(CreateInfoReqBuilder)? updates]) =>
      (new CreateInfoReqBuilder()..update(updates))._build();

  _$CreateInfoReq._(
      {this.firstName,
      this.lastName,
      this.middleName,
      this.phoneNumber,
      this.dateOfBirth,
      this.gender,
      this.passportSerial})
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
        passportSerial == other.passportSerial;
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
          ..add('passportSerial', passportSerial))
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
            passportSerial: passportSerial);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
