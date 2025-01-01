// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PhoneNumberSendReq> _$phoneNumberSendReqSerializer =
    new _$PhoneNumberSendReqSerializer();
Serializer<VerificationSendReq> _$verificationSendReqSerializer =
    new _$VerificationSendReqSerializer();

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
    final result = new PhoneNumberSendReqBuilder();

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

class _$PhoneNumberSendReq extends PhoneNumberSendReq {
  @override
  final String? phoneNumber;

  factory _$PhoneNumberSendReq(
          [void Function(PhoneNumberSendReqBuilder)? updates]) =>
      (new PhoneNumberSendReqBuilder()..update(updates))._build();

  _$PhoneNumberSendReq._({this.phoneNumber}) : super._();

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
    final _$result =
        _$v ?? new _$PhoneNumberSendReq._(phoneNumber: phoneNumber);
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

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
