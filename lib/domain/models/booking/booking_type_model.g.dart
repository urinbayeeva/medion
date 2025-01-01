// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_type_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BookingTypeModel> _$bookingTypeModelSerializer =
    new _$BookingTypeModelSerializer();

class _$BookingTypeModelSerializer
    implements StructuredSerializer<BookingTypeModel> {
  @override
  final Iterable<Type> types = const [BookingTypeModel, _$BookingTypeModel];
  @override
  final String wireName = 'BookingTypeModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, BookingTypeModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];
    Object? value;
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
  BookingTypeModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BookingTypeModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
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

class _$BookingTypeModel extends BookingTypeModel {
  @override
  final int id;
  @override
  final String name;
  @override
  final String? icon;

  factory _$BookingTypeModel(
          [void Function(BookingTypeModelBuilder)? updates]) =>
      (new BookingTypeModelBuilder()..update(updates))._build();

  _$BookingTypeModel._({required this.id, required this.name, this.icon})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'BookingTypeModel', 'id');
    BuiltValueNullFieldError.checkNotNull(name, r'BookingTypeModel', 'name');
  }

  @override
  BookingTypeModel rebuild(void Function(BookingTypeModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BookingTypeModelBuilder toBuilder() =>
      new BookingTypeModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BookingTypeModel &&
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
    return (newBuiltValueToStringHelper(r'BookingTypeModel')
          ..add('id', id)
          ..add('name', name)
          ..add('icon', icon))
        .toString();
  }
}

class BookingTypeModelBuilder
    implements Builder<BookingTypeModel, BookingTypeModelBuilder> {
  _$BookingTypeModel? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _icon;
  String? get icon => _$this._icon;
  set icon(String? icon) => _$this._icon = icon;

  BookingTypeModelBuilder();

  BookingTypeModelBuilder get _$this {
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
  void replace(BookingTypeModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BookingTypeModel;
  }

  @override
  void update(void Function(BookingTypeModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BookingTypeModel build() => _build();

  _$BookingTypeModel _build() {
    final _$result = _$v ??
        new _$BookingTypeModel._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'BookingTypeModel', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'BookingTypeModel', 'name'),
            icon: icon);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
