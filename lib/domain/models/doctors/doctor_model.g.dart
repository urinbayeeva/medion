// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DoctorCategory> _$doctorCategorySerializer =
    new _$DoctorCategorySerializer();
Serializer<DoctorData> _$doctorDataSerializer = new _$DoctorDataSerializer();

class _$DoctorCategorySerializer
    implements StructuredSerializer<DoctorCategory> {
  @override
  final Iterable<Type> types = const [DoctorCategory, _$DoctorCategory];
  @override
  final String wireName = 'DoctorCategory';

  @override
  Iterable<Object?> serialize(Serializers serializers, DoctorCategory object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'category_name',
      serializers.serialize(object.categoryName,
          specifiedType: const FullType(String)),
      'doctor_data',
      serializers.serialize(object.doctorData,
          specifiedType:
              const FullType(BuiltList, const [const FullType(DoctorData)])),
    ];

    return result;
  }

  @override
  DoctorCategory deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DoctorCategoryBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'category_name':
          result.categoryName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'doctor_data':
          result.doctorData.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(DoctorData)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$DoctorDataSerializer implements StructuredSerializer<DoctorData> {
  @override
  final Iterable<Type> types = const [DoctorData, _$DoctorData];
  @override
  final String wireName = 'DoctorData';

  @override
  Iterable<Object?> serialize(Serializers serializers, DoctorData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'category_ids',
      serializers.serialize(object.categoryIds,
          specifiedType:
              const FullType(BuiltList, const [const FullType(int)])),
      'specialty',
      serializers.serialize(object.specialty,
          specifiedType: const FullType(String)),
      'work_experience',
      serializers.serialize(object.workExperience,
          specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.infoDescription;
    if (value != null) {
      result
        ..add('info_description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(JsonObject)));
    }
    value = object.workMobbile;
    if (value != null) {
      result
        ..add('Work_Mobile')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(JsonObject)));
    }
    value = object.workPhone;
    if (value != null) {
      result
        ..add('Work_Phone')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(JsonObject)));
    }
    value = object.gender;
    if (value != null) {
      result
        ..add('gender')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(JsonObject)));
    }
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.academicRank;
    if (value != null) {
      result
        ..add('academic_rank')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  DoctorData deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DoctorDataBuilder();

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
        case 'info_description':
          result.infoDescription = serializers.deserialize(value,
              specifiedType: const FullType(JsonObject)) as JsonObject?;
          break;
        case 'Work_Mobile':
          result.workMobbile = serializers.deserialize(value,
              specifiedType: const FullType(JsonObject)) as JsonObject?;
          break;
        case 'Work_Phone':
          result.workPhone = serializers.deserialize(value,
              specifiedType: const FullType(JsonObject)) as JsonObject?;
          break;
        case 'gender':
          result.gender = serializers.deserialize(value,
              specifiedType: const FullType(JsonObject)) as JsonObject?;
          break;
        case 'category_ids':
          result.categoryIds.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'specialty':
          result.specialty = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'academic_rank':
          result.academicRank = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'work_experience':
          result.workExperience = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$DoctorCategory extends DoctorCategory {
  @override
  final String categoryName;
  @override
  final BuiltList<DoctorData> doctorData;

  factory _$DoctorCategory([void Function(DoctorCategoryBuilder)? updates]) =>
      (new DoctorCategoryBuilder()..update(updates))._build();

  _$DoctorCategory._({required this.categoryName, required this.doctorData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        categoryName, r'DoctorCategory', 'categoryName');
    BuiltValueNullFieldError.checkNotNull(
        doctorData, r'DoctorCategory', 'doctorData');
  }

  @override
  DoctorCategory rebuild(void Function(DoctorCategoryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DoctorCategoryBuilder toBuilder() =>
      new DoctorCategoryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DoctorCategory &&
        categoryName == other.categoryName &&
        doctorData == other.doctorData;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, categoryName.hashCode);
    _$hash = $jc(_$hash, doctorData.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DoctorCategory')
          ..add('categoryName', categoryName)
          ..add('doctorData', doctorData))
        .toString();
  }
}

class DoctorCategoryBuilder
    implements Builder<DoctorCategory, DoctorCategoryBuilder> {
  _$DoctorCategory? _$v;

  String? _categoryName;
  String? get categoryName => _$this._categoryName;
  set categoryName(String? categoryName) => _$this._categoryName = categoryName;

  ListBuilder<DoctorData>? _doctorData;
  ListBuilder<DoctorData> get doctorData =>
      _$this._doctorData ??= new ListBuilder<DoctorData>();
  set doctorData(ListBuilder<DoctorData>? doctorData) =>
      _$this._doctorData = doctorData;

  DoctorCategoryBuilder();

  DoctorCategoryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _categoryName = $v.categoryName;
      _doctorData = $v.doctorData.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DoctorCategory other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DoctorCategory;
  }

  @override
  void update(void Function(DoctorCategoryBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DoctorCategory build() => _build();

  _$DoctorCategory _build() {
    _$DoctorCategory _$result;
    try {
      _$result = _$v ??
          new _$DoctorCategory._(
            categoryName: BuiltValueNullFieldError.checkNotNull(
                categoryName, r'DoctorCategory', 'categoryName'),
            doctorData: doctorData.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'doctorData';
        doctorData.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'DoctorCategory', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$DoctorData extends DoctorData {
  @override
  final int id;
  @override
  final String name;
  @override
  final JsonObject? infoDescription;
  @override
  final JsonObject? workMobbile;
  @override
  final JsonObject? workPhone;
  @override
  final JsonObject? gender;
  @override
  final BuiltList<int> categoryIds;
  @override
  final String specialty;
  @override
  final String? image;
  @override
  final String? academicRank;
  @override
  final int workExperience;

  factory _$DoctorData([void Function(DoctorDataBuilder)? updates]) =>
      (new DoctorDataBuilder()..update(updates))._build();

  _$DoctorData._(
      {required this.id,
      required this.name,
      this.infoDescription,
      this.workMobbile,
      this.workPhone,
      this.gender,
      required this.categoryIds,
      required this.specialty,
      this.image,
      this.academicRank,
      required this.workExperience})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'DoctorData', 'id');
    BuiltValueNullFieldError.checkNotNull(name, r'DoctorData', 'name');
    BuiltValueNullFieldError.checkNotNull(
        categoryIds, r'DoctorData', 'categoryIds');
    BuiltValueNullFieldError.checkNotNull(
        specialty, r'DoctorData', 'specialty');
    BuiltValueNullFieldError.checkNotNull(
        workExperience, r'DoctorData', 'workExperience');
  }

  @override
  DoctorData rebuild(void Function(DoctorDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DoctorDataBuilder toBuilder() => new DoctorDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DoctorData &&
        id == other.id &&
        name == other.name &&
        infoDescription == other.infoDescription &&
        workMobbile == other.workMobbile &&
        workPhone == other.workPhone &&
        gender == other.gender &&
        categoryIds == other.categoryIds &&
        specialty == other.specialty &&
        image == other.image &&
        academicRank == other.academicRank &&
        workExperience == other.workExperience;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, infoDescription.hashCode);
    _$hash = $jc(_$hash, workMobbile.hashCode);
    _$hash = $jc(_$hash, workPhone.hashCode);
    _$hash = $jc(_$hash, gender.hashCode);
    _$hash = $jc(_$hash, categoryIds.hashCode);
    _$hash = $jc(_$hash, specialty.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jc(_$hash, academicRank.hashCode);
    _$hash = $jc(_$hash, workExperience.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DoctorData')
          ..add('id', id)
          ..add('name', name)
          ..add('infoDescription', infoDescription)
          ..add('workMobbile', workMobbile)
          ..add('workPhone', workPhone)
          ..add('gender', gender)
          ..add('categoryIds', categoryIds)
          ..add('specialty', specialty)
          ..add('image', image)
          ..add('academicRank', academicRank)
          ..add('workExperience', workExperience))
        .toString();
  }
}

class DoctorDataBuilder implements Builder<DoctorData, DoctorDataBuilder> {
  _$DoctorData? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  JsonObject? _infoDescription;
  JsonObject? get infoDescription => _$this._infoDescription;
  set infoDescription(JsonObject? infoDescription) =>
      _$this._infoDescription = infoDescription;

  JsonObject? _workMobbile;
  JsonObject? get workMobbile => _$this._workMobbile;
  set workMobbile(JsonObject? workMobbile) => _$this._workMobbile = workMobbile;

  JsonObject? _workPhone;
  JsonObject? get workPhone => _$this._workPhone;
  set workPhone(JsonObject? workPhone) => _$this._workPhone = workPhone;

  JsonObject? _gender;
  JsonObject? get gender => _$this._gender;
  set gender(JsonObject? gender) => _$this._gender = gender;

  ListBuilder<int>? _categoryIds;
  ListBuilder<int> get categoryIds =>
      _$this._categoryIds ??= new ListBuilder<int>();
  set categoryIds(ListBuilder<int>? categoryIds) =>
      _$this._categoryIds = categoryIds;

  String? _specialty;
  String? get specialty => _$this._specialty;
  set specialty(String? specialty) => _$this._specialty = specialty;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  String? _academicRank;
  String? get academicRank => _$this._academicRank;
  set academicRank(String? academicRank) => _$this._academicRank = academicRank;

  int? _workExperience;
  int? get workExperience => _$this._workExperience;
  set workExperience(int? workExperience) =>
      _$this._workExperience = workExperience;

  DoctorDataBuilder();

  DoctorDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _infoDescription = $v.infoDescription;
      _workMobbile = $v.workMobbile;
      _workPhone = $v.workPhone;
      _gender = $v.gender;
      _categoryIds = $v.categoryIds.toBuilder();
      _specialty = $v.specialty;
      _image = $v.image;
      _academicRank = $v.academicRank;
      _workExperience = $v.workExperience;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DoctorData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DoctorData;
  }

  @override
  void update(void Function(DoctorDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DoctorData build() => _build();

  _$DoctorData _build() {
    _$DoctorData _$result;
    try {
      _$result = _$v ??
          new _$DoctorData._(
            id: BuiltValueNullFieldError.checkNotNull(id, r'DoctorData', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'DoctorData', 'name'),
            infoDescription: infoDescription,
            workMobbile: workMobbile,
            workPhone: workPhone,
            gender: gender,
            categoryIds: categoryIds.build(),
            specialty: BuiltValueNullFieldError.checkNotNull(
                specialty, r'DoctorData', 'specialty'),
            image: image,
            academicRank: academicRank,
            workExperience: BuiltValueNullFieldError.checkNotNull(
                workExperience, r'DoctorData', 'workExperience'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'categoryIds';
        categoryIds.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'DoctorData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
