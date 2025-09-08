// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LocationModel> _$locationModelSerializer =
    _$LocationModelSerializer();
Serializer<Position> _$positionSerializer = _$PositionSerializer();

class _$LocationModelSerializer implements StructuredSerializer<LocationModel> {
  @override
  final Iterable<Type> types = const [LocationModel, _$LocationModel];
  @override
  final String wireName = 'LocationModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, LocationModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'position',
      serializers.serialize(object.position,
          specifiedType: const FullType(Position)),
      'icon',
      serializers.serialize(object.icon, specifiedType: const FullType(String)),
      'address',
      serializers.serialize(object.address,
          specifiedType: const FullType(String)),
      'status',
      serializers.serialize(object.status,
          specifiedType: const FullType(String)),
      'closingTime',
      serializers.serialize(object.closingTime,
          specifiedType: const FullType(String)),
      'images',
      serializers.serialize(object.images,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'workHours',
      serializers.serialize(object.workHours,
          specifiedType: const FullType(String)),
      'wordDay',
      serializers.serialize(object.wordDay,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.fullName;
    if (value != null) {
      result
        ..add('full_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(JsonObject)));
    }
    return result;
  }

  @override
  LocationModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = LocationModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'position':
          result.position.replace(serializers.deserialize(value,
              specifiedType: const FullType(Position))! as Position);
          break;
        case 'icon':
          result.icon = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'full_name':
          result.fullName = serializers.deserialize(value,
              specifiedType: const FullType(JsonObject)) as JsonObject?;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'closingTime':
          result.closingTime = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'images':
          result.images.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'workHours':
          result.workHours = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'wordDay':
          result.wordDay = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$PositionSerializer implements StructuredSerializer<Position> {
  @override
  final Iterable<Type> types = const [Position, _$Position];
  @override
  final String wireName = 'Position';

  @override
  Iterable<Object?> serialize(Serializers serializers, Position object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'latitude',
      serializers.serialize(object.latitude,
          specifiedType: const FullType(double)),
      'longitude',
      serializers.serialize(object.longitude,
          specifiedType: const FullType(double)),
    ];

    return result;
  }

  @override
  Position deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = PositionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'latitude':
          result.latitude = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'longitude':
          result.longitude = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
      }
    }

    return result.build();
  }
}

class _$LocationModel extends LocationModel {
  @override
  final Position position;
  @override
  final String icon;
  @override
  final JsonObject? fullName;
  @override
  final String address;
  @override
  final String status;
  @override
  final String closingTime;
  @override
  final BuiltList<String> images;
  @override
  final String workHours;
  @override
  final String wordDay;

  factory _$LocationModel([void Function(LocationModelBuilder)? updates]) =>
      (LocationModelBuilder()..update(updates))._build();

  _$LocationModel._(
      {required this.position,
      required this.icon,
      this.fullName,
      required this.address,
      required this.status,
      required this.closingTime,
      required this.images,
      required this.workHours,
      required this.wordDay})
      : super._();
  @override
  LocationModel rebuild(void Function(LocationModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LocationModelBuilder toBuilder() => LocationModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LocationModel &&
        position == other.position &&
        icon == other.icon &&
        fullName == other.fullName &&
        address == other.address &&
        status == other.status &&
        closingTime == other.closingTime &&
        images == other.images &&
        workHours == other.workHours &&
        wordDay == other.wordDay;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, position.hashCode);
    _$hash = $jc(_$hash, icon.hashCode);
    _$hash = $jc(_$hash, fullName.hashCode);
    _$hash = $jc(_$hash, address.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, closingTime.hashCode);
    _$hash = $jc(_$hash, images.hashCode);
    _$hash = $jc(_$hash, workHours.hashCode);
    _$hash = $jc(_$hash, wordDay.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LocationModel')
          ..add('position', position)
          ..add('icon', icon)
          ..add('fullName', fullName)
          ..add('address', address)
          ..add('status', status)
          ..add('closingTime', closingTime)
          ..add('images', images)
          ..add('workHours', workHours)
          ..add('wordDay', wordDay))
        .toString();
  }
}

class LocationModelBuilder
    implements Builder<LocationModel, LocationModelBuilder> {
  _$LocationModel? _$v;

  PositionBuilder? _position;
  PositionBuilder get position => _$this._position ??= PositionBuilder();
  set position(PositionBuilder? position) => _$this._position = position;

  String? _icon;
  String? get icon => _$this._icon;
  set icon(String? icon) => _$this._icon = icon;

  JsonObject? _fullName;
  JsonObject? get fullName => _$this._fullName;
  set fullName(JsonObject? fullName) => _$this._fullName = fullName;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  String? _closingTime;
  String? get closingTime => _$this._closingTime;
  set closingTime(String? closingTime) => _$this._closingTime = closingTime;

  ListBuilder<String>? _images;
  ListBuilder<String> get images => _$this._images ??= ListBuilder<String>();
  set images(ListBuilder<String>? images) => _$this._images = images;

  String? _workHours;
  String? get workHours => _$this._workHours;
  set workHours(String? workHours) => _$this._workHours = workHours;

  String? _wordDay;
  String? get wordDay => _$this._wordDay;
  set wordDay(String? wordDay) => _$this._wordDay = wordDay;

  LocationModelBuilder();

  LocationModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _position = $v.position.toBuilder();
      _icon = $v.icon;
      _fullName = $v.fullName;
      _address = $v.address;
      _status = $v.status;
      _closingTime = $v.closingTime;
      _images = $v.images.toBuilder();
      _workHours = $v.workHours;
      _wordDay = $v.wordDay;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LocationModel other) {
    _$v = other as _$LocationModel;
  }

  @override
  void update(void Function(LocationModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LocationModel build() => _build();

  _$LocationModel _build() {
    _$LocationModel _$result;
    try {
      _$result = _$v ??
          _$LocationModel._(
            position: position.build(),
            icon: BuiltValueNullFieldError.checkNotNull(
                icon, r'LocationModel', 'icon'),
            fullName: fullName,
            address: BuiltValueNullFieldError.checkNotNull(
                address, r'LocationModel', 'address'),
            status: BuiltValueNullFieldError.checkNotNull(
                status, r'LocationModel', 'status'),
            closingTime: BuiltValueNullFieldError.checkNotNull(
                closingTime, r'LocationModel', 'closingTime'),
            images: images.build(),
            workHours: BuiltValueNullFieldError.checkNotNull(
                workHours, r'LocationModel', 'workHours'),
            wordDay: BuiltValueNullFieldError.checkNotNull(
                wordDay, r'LocationModel', 'wordDay'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'position';
        position.build();

        _$failedField = 'images';
        images.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'LocationModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Position extends Position {
  @override
  final double latitude;
  @override
  final double longitude;

  factory _$Position([void Function(PositionBuilder)? updates]) =>
      (PositionBuilder()..update(updates))._build();

  _$Position._({required this.latitude, required this.longitude}) : super._();
  @override
  Position rebuild(void Function(PositionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PositionBuilder toBuilder() => PositionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Position &&
        latitude == other.latitude &&
        longitude == other.longitude;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, latitude.hashCode);
    _$hash = $jc(_$hash, longitude.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Position')
          ..add('latitude', latitude)
          ..add('longitude', longitude))
        .toString();
  }
}

class PositionBuilder implements Builder<Position, PositionBuilder> {
  _$Position? _$v;

  double? _latitude;
  double? get latitude => _$this._latitude;
  set latitude(double? latitude) => _$this._latitude = latitude;

  double? _longitude;
  double? get longitude => _$this._longitude;
  set longitude(double? longitude) => _$this._longitude = longitude;

  PositionBuilder();

  PositionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _latitude = $v.latitude;
      _longitude = $v.longitude;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Position other) {
    _$v = other as _$Position;
  }

  @override
  void update(void Function(PositionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Position build() => _build();

  _$Position _build() {
    final _$result = _$v ??
        _$Position._(
          latitude: BuiltValueNullFieldError.checkNotNull(
              latitude, r'Position', 'latitude'),
          longitude: BuiltValueNullFieldError.checkNotNull(
              longitude, r'Position', 'longitude'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
