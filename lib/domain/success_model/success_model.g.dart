// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'success_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SuccessModel> _$successModelSerializer = _$SuccessModelSerializer();

class _$SuccessModelSerializer implements StructuredSerializer<SuccessModel> {
  @override
  final Iterable<Type> types = const [SuccessModel, _$SuccessModel];
  @override
  final String wireName = 'SuccessModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, SuccessModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.message;
    if (value != null) {
      result
        ..add('message')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  SuccessModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = SuccessModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$SuccessModel extends SuccessModel {
  @override
  final String? status;
  @override
  final String? message;

  factory _$SuccessModel([void Function(SuccessModelBuilder)? updates]) =>
      (SuccessModelBuilder()..update(updates))._build();

  _$SuccessModel._({this.status, this.message}) : super._();
  @override
  SuccessModel rebuild(void Function(SuccessModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SuccessModelBuilder toBuilder() => SuccessModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SuccessModel &&
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
    return (newBuiltValueToStringHelper(r'SuccessModel')
          ..add('status', status)
          ..add('message', message))
        .toString();
  }
}

class SuccessModelBuilder
    implements Builder<SuccessModel, SuccessModelBuilder> {
  _$SuccessModel? _$v;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  SuccessModelBuilder();

  SuccessModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _status = $v.status;
      _message = $v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SuccessModel other) {
    _$v = other as _$SuccessModel;
  }

  @override
  void update(void Function(SuccessModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SuccessModel build() => _build();

  _$SuccessModel _build() {
    final _$result = _$v ??
        _$SuccessModel._(
          status: status,
          message: message,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
