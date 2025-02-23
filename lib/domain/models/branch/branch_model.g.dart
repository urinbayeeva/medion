// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BranchModel> _$branchModelSerializer = new _$BranchModelSerializer();

class _$BranchModelSerializer implements StructuredSerializer<BranchModel> {
  @override
  final Iterable<Type> types = const [BranchModel, _$BranchModel];
  @override
  final String wireName = 'BranchModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, BranchModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'latitude',
      serializers.serialize(object.latitude,
          specifiedType: const FullType(double)),
      'longitude',
      serializers.serialize(object.longitude,
          specifiedType: const FullType(double)),
      'work_time',
      serializers.serialize(object.workTime,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.address;
    if (value != null) {
      result
        ..add('address')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.phone;
    if (value != null) {
      result
        ..add('phone')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.workDays;
    if (value != null) {
      result
        ..add('work_days')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
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
  BranchModel deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BranchModelBuilder();

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
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'phone':
          result.phone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'latitude':
          result.latitude = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'longitude':
          result.longitude = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'work_time':
          result.workTime = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'work_days':
          result.workDays = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$BranchModel extends BranchModel {
  @override
  final int id;
  @override
  final String? image;
  @override
  final String? name;
  @override
  final String? address;
  @override
  final String? phone;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final String workTime;
  @override
  final String? workDays;
  @override
  final String? description;

  factory _$BranchModel([void Function(BranchModelBuilder)? updates]) =>
      (new BranchModelBuilder()..update(updates))._build();

  _$BranchModel._(
      {required this.id,
      this.image,
      this.name,
      this.address,
      this.phone,
      required this.latitude,
      required this.longitude,
      required this.workTime,
      this.workDays,
      this.description})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'BranchModel', 'id');
    BuiltValueNullFieldError.checkNotNull(latitude, r'BranchModel', 'latitude');
    BuiltValueNullFieldError.checkNotNull(
        longitude, r'BranchModel', 'longitude');
    BuiltValueNullFieldError.checkNotNull(workTime, r'BranchModel', 'workTime');
  }

  @override
  BranchModel rebuild(void Function(BranchModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BranchModelBuilder toBuilder() => new BranchModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BranchModel &&
        id == other.id &&
        image == other.image &&
        name == other.name &&
        address == other.address &&
        phone == other.phone &&
        latitude == other.latitude &&
        longitude == other.longitude &&
        workTime == other.workTime &&
        workDays == other.workDays &&
        description == other.description;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, address.hashCode);
    _$hash = $jc(_$hash, phone.hashCode);
    _$hash = $jc(_$hash, latitude.hashCode);
    _$hash = $jc(_$hash, longitude.hashCode);
    _$hash = $jc(_$hash, workTime.hashCode);
    _$hash = $jc(_$hash, workDays.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BranchModel')
          ..add('id', id)
          ..add('image', image)
          ..add('name', name)
          ..add('address', address)
          ..add('phone', phone)
          ..add('latitude', latitude)
          ..add('longitude', longitude)
          ..add('workTime', workTime)
          ..add('workDays', workDays)
          ..add('description', description))
        .toString();
  }
}

class BranchModelBuilder implements Builder<BranchModel, BranchModelBuilder> {
  _$BranchModel? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  String? _phone;
  String? get phone => _$this._phone;
  set phone(String? phone) => _$this._phone = phone;

  double? _latitude;
  double? get latitude => _$this._latitude;
  set latitude(double? latitude) => _$this._latitude = latitude;

  double? _longitude;
  double? get longitude => _$this._longitude;
  set longitude(double? longitude) => _$this._longitude = longitude;

  String? _workTime;
  String? get workTime => _$this._workTime;
  set workTime(String? workTime) => _$this._workTime = workTime;

  String? _workDays;
  String? get workDays => _$this._workDays;
  set workDays(String? workDays) => _$this._workDays = workDays;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  BranchModelBuilder();

  BranchModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _image = $v.image;
      _name = $v.name;
      _address = $v.address;
      _phone = $v.phone;
      _latitude = $v.latitude;
      _longitude = $v.longitude;
      _workTime = $v.workTime;
      _workDays = $v.workDays;
      _description = $v.description;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BranchModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BranchModel;
  }

  @override
  void update(void Function(BranchModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BranchModel build() => _build();

  _$BranchModel _build() {
    final _$result = _$v ??
        new _$BranchModel._(
          id: BuiltValueNullFieldError.checkNotNull(id, r'BranchModel', 'id'),
          image: image,
          name: name,
          address: address,
          phone: phone,
          latitude: BuiltValueNullFieldError.checkNotNull(
              latitude, r'BranchModel', 'latitude'),
          longitude: BuiltValueNullFieldError.checkNotNull(
              longitude, r'BranchModel', 'longitude'),
          workTime: BuiltValueNullFieldError.checkNotNull(
              workTime, r'BranchModel', 'workTime'),
          workDays: workDays,
          description: description,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
