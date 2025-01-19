// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PatientInfo> _$patientInfoSerializer = new _$PatientInfoSerializer();

class _$PatientInfoSerializer implements StructuredSerializer<PatientInfo> {
  @override
  final Iterable<Type> types = const [PatientInfo, _$PatientInfo];
  @override
  final String wireName = 'PatientInfo';

  @override
  Iterable<Object?> serialize(Serializers serializers, PatientInfo object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'lastname',
      serializers.serialize(object.lastName,
          specifiedType: const FullType(String)),
      'firstname',
      serializers.serialize(object.firstName,
          specifiedType: const FullType(String)),
      'patient_id',
      serializers.serialize(object.patientId,
          specifiedType: const FullType(int)),
      'passport',
      serializers.serialize(object.passport,
          specifiedType: const FullType(String)),
      'phone',
      serializers.serialize(object.phone,
          specifiedType: const FullType(String)),
      'date_of_birth',
      serializers.serialize(object.dateOfBirth,
          specifiedType: const FullType(String)),
      'phone_number',
      serializers.serialize(object.phoneNumber,
          specifiedType: const FullType(String)),
      'patient_balance',
      serializers.serialize(object.patientBalance,
          specifiedType: const FullType(double)),
    ];
    Object? value;
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  PatientInfo deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PatientInfoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'lastname':
          result.lastName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'firstname':
          result.firstName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'patient_id':
          result.patientId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'passport':
          result.passport = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'phone':
          result.phone = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'date_of_birth':
          result.dateOfBirth = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'phone_number':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'patient_balance':
          result.patientBalance = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
      }
    }

    return result.build();
  }
}

class _$PatientInfo extends PatientInfo {
  @override
  final String? image;
  @override
  final String lastName;
  @override
  final String firstName;
  @override
  final int patientId;
  @override
  final String passport;
  @override
  final String phone;
  @override
  final String dateOfBirth;
  @override
  final String phoneNumber;
  @override
  final double patientBalance;

  factory _$PatientInfo([void Function(PatientInfoBuilder)? updates]) =>
      (new PatientInfoBuilder()..update(updates))._build();

  _$PatientInfo._(
      {this.image,
      required this.lastName,
      required this.firstName,
      required this.patientId,
      required this.passport,
      required this.phone,
      required this.dateOfBirth,
      required this.phoneNumber,
      required this.patientBalance})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(lastName, r'PatientInfo', 'lastName');
    BuiltValueNullFieldError.checkNotNull(
        firstName, r'PatientInfo', 'firstName');
    BuiltValueNullFieldError.checkNotNull(
        patientId, r'PatientInfo', 'patientId');
    BuiltValueNullFieldError.checkNotNull(passport, r'PatientInfo', 'passport');
    BuiltValueNullFieldError.checkNotNull(phone, r'PatientInfo', 'phone');
    BuiltValueNullFieldError.checkNotNull(
        dateOfBirth, r'PatientInfo', 'dateOfBirth');
    BuiltValueNullFieldError.checkNotNull(
        phoneNumber, r'PatientInfo', 'phoneNumber');
    BuiltValueNullFieldError.checkNotNull(
        patientBalance, r'PatientInfo', 'patientBalance');
  }

  @override
  PatientInfo rebuild(void Function(PatientInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PatientInfoBuilder toBuilder() => new PatientInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PatientInfo &&
        image == other.image &&
        lastName == other.lastName &&
        firstName == other.firstName &&
        patientId == other.patientId &&
        passport == other.passport &&
        phone == other.phone &&
        dateOfBirth == other.dateOfBirth &&
        phoneNumber == other.phoneNumber &&
        patientBalance == other.patientBalance;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jc(_$hash, lastName.hashCode);
    _$hash = $jc(_$hash, firstName.hashCode);
    _$hash = $jc(_$hash, patientId.hashCode);
    _$hash = $jc(_$hash, passport.hashCode);
    _$hash = $jc(_$hash, phone.hashCode);
    _$hash = $jc(_$hash, dateOfBirth.hashCode);
    _$hash = $jc(_$hash, phoneNumber.hashCode);
    _$hash = $jc(_$hash, patientBalance.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PatientInfo')
          ..add('image', image)
          ..add('lastName', lastName)
          ..add('firstName', firstName)
          ..add('patientId', patientId)
          ..add('passport', passport)
          ..add('phone', phone)
          ..add('dateOfBirth', dateOfBirth)
          ..add('phoneNumber', phoneNumber)
          ..add('patientBalance', patientBalance))
        .toString();
  }
}

class PatientInfoBuilder implements Builder<PatientInfo, PatientInfoBuilder> {
  _$PatientInfo? _$v;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  String? _lastName;
  String? get lastName => _$this._lastName;
  set lastName(String? lastName) => _$this._lastName = lastName;

  String? _firstName;
  String? get firstName => _$this._firstName;
  set firstName(String? firstName) => _$this._firstName = firstName;

  int? _patientId;
  int? get patientId => _$this._patientId;
  set patientId(int? patientId) => _$this._patientId = patientId;

  String? _passport;
  String? get passport => _$this._passport;
  set passport(String? passport) => _$this._passport = passport;

  String? _phone;
  String? get phone => _$this._phone;
  set phone(String? phone) => _$this._phone = phone;

  String? _dateOfBirth;
  String? get dateOfBirth => _$this._dateOfBirth;
  set dateOfBirth(String? dateOfBirth) => _$this._dateOfBirth = dateOfBirth;

  String? _phoneNumber;
  String? get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String? phoneNumber) => _$this._phoneNumber = phoneNumber;

  double? _patientBalance;
  double? get patientBalance => _$this._patientBalance;
  set patientBalance(double? patientBalance) =>
      _$this._patientBalance = patientBalance;

  PatientInfoBuilder();

  PatientInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _image = $v.image;
      _lastName = $v.lastName;
      _firstName = $v.firstName;
      _patientId = $v.patientId;
      _passport = $v.passport;
      _phone = $v.phone;
      _dateOfBirth = $v.dateOfBirth;
      _phoneNumber = $v.phoneNumber;
      _patientBalance = $v.patientBalance;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PatientInfo other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PatientInfo;
  }

  @override
  void update(void Function(PatientInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PatientInfo build() => _build();

  _$PatientInfo _build() {
    final _$result = _$v ??
        new _$PatientInfo._(
            image: image,
            lastName: BuiltValueNullFieldError.checkNotNull(
                lastName, r'PatientInfo', 'lastName'),
            firstName: BuiltValueNullFieldError.checkNotNull(
                firstName, r'PatientInfo', 'firstName'),
            patientId: BuiltValueNullFieldError.checkNotNull(
                patientId, r'PatientInfo', 'patientId'),
            passport: BuiltValueNullFieldError.checkNotNull(
                passport, r'PatientInfo', 'passport'),
            phone: BuiltValueNullFieldError.checkNotNull(
                phone, r'PatientInfo', 'phone'),
            dateOfBirth: BuiltValueNullFieldError.checkNotNull(
                dateOfBirth, r'PatientInfo', 'dateOfBirth'),
            phoneNumber: BuiltValueNullFieldError.checkNotNull(
                phoneNumber, r'PatientInfo', 'phoneNumber'),
            patientBalance: BuiltValueNullFieldError.checkNotNull(
                patientBalance, r'PatientInfo', 'patientBalance'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
