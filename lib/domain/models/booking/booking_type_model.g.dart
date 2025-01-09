// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_type_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BookingTypeModel> _$bookingTypeModelSerializer =
    new _$BookingTypeModelSerializer();
Serializer<Service> _$serviceSerializer = new _$ServiceSerializer();
Serializer<Category> _$categorySerializer = new _$CategorySerializer();

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

class _$ServiceSerializer implements StructuredSerializer<Service> {
  @override
  final Iterable<Type> types = const [Service, _$Service];
  @override
  final String wireName = 'Service';

  @override
  Iterable<Object?> serialize(Serializers serializers, Service object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'doctor_price_start_uzs',
      serializers.serialize(object.priceUzs,
          specifiedType: const FullType(double)),
      'doctor_price_start_usd',
      serializers.serialize(object.priceUsd,
          specifiedType: const FullType(double)),
      'age',
      serializers.serialize(object.age, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Service deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ServiceBuilder();

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
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'doctor_price_start_uzs':
          result.priceUzs = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'doctor_price_start_usd':
          result.priceUsd = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'age':
          result.age = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$CategorySerializer implements StructuredSerializer<Category> {
  @override
  final Iterable<Type> types = const [Category, _$Category];
  @override
  final String wireName = 'Category';

  @override
  Iterable<Object?> serialize(Serializers serializers, Category object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'category_name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'services',
      serializers.serialize(object.services,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Service)])),
    ];

    return result;
  }

  @override
  Category deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CategoryBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'category_name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'services':
          result.services.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Service)]))!
              as BuiltList<Object?>);
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

class _$Service extends Service {
  @override
  final int id;
  @override
  final String name;
  @override
  final String? description;
  @override
  final double priceUzs;
  @override
  final double priceUsd;
  @override
  final String age;

  factory _$Service([void Function(ServiceBuilder)? updates]) =>
      (new ServiceBuilder()..update(updates))._build();

  _$Service._(
      {required this.id,
      required this.name,
      this.description,
      required this.priceUzs,
      required this.priceUsd,
      required this.age})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'Service', 'id');
    BuiltValueNullFieldError.checkNotNull(name, r'Service', 'name');
    BuiltValueNullFieldError.checkNotNull(priceUzs, r'Service', 'priceUzs');
    BuiltValueNullFieldError.checkNotNull(priceUsd, r'Service', 'priceUsd');
    BuiltValueNullFieldError.checkNotNull(age, r'Service', 'age');
  }

  @override
  Service rebuild(void Function(ServiceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ServiceBuilder toBuilder() => new ServiceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Service &&
        id == other.id &&
        name == other.name &&
        description == other.description &&
        priceUzs == other.priceUzs &&
        priceUsd == other.priceUsd &&
        age == other.age;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, priceUzs.hashCode);
    _$hash = $jc(_$hash, priceUsd.hashCode);
    _$hash = $jc(_$hash, age.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Service')
          ..add('id', id)
          ..add('name', name)
          ..add('description', description)
          ..add('priceUzs', priceUzs)
          ..add('priceUsd', priceUsd)
          ..add('age', age))
        .toString();
  }
}

class ServiceBuilder implements Builder<Service, ServiceBuilder> {
  _$Service? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  double? _priceUzs;
  double? get priceUzs => _$this._priceUzs;
  set priceUzs(double? priceUzs) => _$this._priceUzs = priceUzs;

  double? _priceUsd;
  double? get priceUsd => _$this._priceUsd;
  set priceUsd(double? priceUsd) => _$this._priceUsd = priceUsd;

  String? _age;
  String? get age => _$this._age;
  set age(String? age) => _$this._age = age;

  ServiceBuilder();

  ServiceBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _description = $v.description;
      _priceUzs = $v.priceUzs;
      _priceUsd = $v.priceUsd;
      _age = $v.age;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Service other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Service;
  }

  @override
  void update(void Function(ServiceBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Service build() => _build();

  _$Service _build() {
    final _$result = _$v ??
        new _$Service._(
            id: BuiltValueNullFieldError.checkNotNull(id, r'Service', 'id'),
            name:
                BuiltValueNullFieldError.checkNotNull(name, r'Service', 'name'),
            description: description,
            priceUzs: BuiltValueNullFieldError.checkNotNull(
                priceUzs, r'Service', 'priceUzs'),
            priceUsd: BuiltValueNullFieldError.checkNotNull(
                priceUsd, r'Service', 'priceUsd'),
            age: BuiltValueNullFieldError.checkNotNull(age, r'Service', 'age'));
    replace(_$result);
    return _$result;
  }
}

class _$Category extends Category {
  @override
  final String name;
  @override
  final BuiltList<Service> services;

  factory _$Category([void Function(CategoryBuilder)? updates]) =>
      (new CategoryBuilder()..update(updates))._build();

  _$Category._({required this.name, required this.services}) : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'Category', 'name');
    BuiltValueNullFieldError.checkNotNull(services, r'Category', 'services');
  }

  @override
  Category rebuild(void Function(CategoryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CategoryBuilder toBuilder() => new CategoryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Category &&
        name == other.name &&
        services == other.services;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, services.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Category')
          ..add('name', name)
          ..add('services', services))
        .toString();
  }
}

class CategoryBuilder implements Builder<Category, CategoryBuilder> {
  _$Category? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  ListBuilder<Service>? _services;
  ListBuilder<Service> get services =>
      _$this._services ??= new ListBuilder<Service>();
  set services(ListBuilder<Service>? services) => _$this._services = services;

  CategoryBuilder();

  CategoryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _services = $v.services.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Category other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Category;
  }

  @override
  void update(void Function(CategoryBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Category build() => _build();

  _$Category _build() {
    _$Category _$result;
    try {
      _$result = _$v ??
          new _$Category._(
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'Category', 'name'),
              services: services.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'services';
        services.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Category', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
