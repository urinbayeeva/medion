// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ServiceResResult> _$serviceResResultSerializer =
    new _$ServiceResResultSerializer();

class _$ServiceResResultSerializer
    implements StructuredSerializer<ServiceResResult> {
  @override
  final Iterable<Type> types = const [ServiceResResult, _$ServiceResResult];
  @override
  final String wireName = 'ServiceResResult';

  @override
  Iterable<Object?> serialize(Serializers serializers, ServiceResResult object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.icon;
    if (value != null) {
      result
        ..add('icon')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  ServiceResResult deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ServiceResResultBuilder();

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
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'icon':
          result.icon = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$ServiceResResult extends ServiceResResult {
  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? icon;

  factory _$ServiceResResult(
          [void Function(ServiceResResultBuilder)? updates]) =>
      (new ServiceResResultBuilder()..update(updates))._build();

  _$ServiceResResult._({this.id, this.name, this.icon}) : super._();

  @override
  ServiceResResult rebuild(void Function(ServiceResResultBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ServiceResResultBuilder toBuilder() =>
      new ServiceResResultBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ServiceResResult &&
        id == other.id &&
        name == other.name &&
        icon == other.icon;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, icon.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ServiceResResult')
          ..add('id', id)
          ..add('name', name)
          ..add('icon', icon))
        .toString();
  }
}

class ServiceResResultBuilder
    implements Builder<ServiceResResult, ServiceResResultBuilder> {
  _$ServiceResResult? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _icon;
  String? get icon => _$this._icon;
  set icon(String? icon) => _$this._icon = icon;

  ServiceResResultBuilder();

  ServiceResResultBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _icon = $v.icon;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ServiceResResult other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ServiceResResult;
  }

  @override
  void update(void Function(ServiceResResultBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ServiceResResult build() => _build();

  _$ServiceResResult _build() {
    final _$result =
        _$v ?? new _$ServiceResResult._(id: id, name: name, icon: icon);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
