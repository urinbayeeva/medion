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
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.info;
    if (value != null) {
      result
        ..add('info')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.forChildren;
    if (value != null) {
      result
        ..add('forChildren')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.link;
    if (value != null) {
      result
        ..add('link')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.color;
    if (value != null) {
      result
        ..add('color')
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
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'info':
          result.info = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'forChildren':
          result.forChildren = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'link':
          result.link = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'color':
          result.color = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$ServiceResResult extends ServiceResResult {
  @override
  final String? title;
  @override
  final String? info;
  @override
  final bool? forChildren;
  @override
  final bool? link;
  @override
  final String? color;

  factory _$ServiceResResult(
          [void Function(ServiceResResultBuilder)? updates]) =>
      (new ServiceResResultBuilder()..update(updates))._build();

  _$ServiceResResult._(
      {this.title, this.info, this.forChildren, this.link, this.color})
      : super._();

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
        title == other.title &&
        info == other.info &&
        forChildren == other.forChildren &&
        link == other.link &&
        color == other.color;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, info.hashCode);
    _$hash = $jc(_$hash, forChildren.hashCode);
    _$hash = $jc(_$hash, link.hashCode);
    _$hash = $jc(_$hash, color.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ServiceResResult')
          ..add('title', title)
          ..add('info', info)
          ..add('forChildren', forChildren)
          ..add('link', link)
          ..add('color', color))
        .toString();
  }
}

class ServiceResResultBuilder
    implements Builder<ServiceResResult, ServiceResResultBuilder> {
  _$ServiceResResult? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _info;
  String? get info => _$this._info;
  set info(String? info) => _$this._info = info;

  bool? _forChildren;
  bool? get forChildren => _$this._forChildren;
  set forChildren(bool? forChildren) => _$this._forChildren = forChildren;

  bool? _link;
  bool? get link => _$this._link;
  set link(bool? link) => _$this._link = link;

  String? _color;
  String? get color => _$this._color;
  set color(String? color) => _$this._color = color;

  ServiceResResultBuilder();

  ServiceResResultBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _info = $v.info;
      _forChildren = $v.forChildren;
      _link = $v.link;
      _color = $v.color;
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
    final _$result = _$v ??
        new _$ServiceResResult._(
            title: title,
            info: info,
            forChildren: forChildren,
            link: link,
            color: color);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
