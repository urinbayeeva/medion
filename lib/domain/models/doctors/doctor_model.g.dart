// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Doctor> _$doctorSerializer = new _$DoctorSerializer();
Serializer<DoctorCategory> _$doctorCategorySerializer =
    new _$DoctorCategorySerializer();

class _$DoctorSerializer implements StructuredSerializer<Doctor> {
  @override
  final Iterable<Type> types = const [Doctor, _$Doctor];
  @override
  final String wireName = 'Doctor';

  @override
  Iterable<Object?> serialize(Serializers serializers, Doctor object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'category_ids',
      serializers.serialize(object.categoryIds,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'specialty',
      serializers.serialize(object.specialty,
          specifiedType: const FullType(String)),
      'academic_rank',
      serializers.serialize(object.academicRank,
          specifiedType: const FullType(String)),
      'work_experience',
      serializers.serialize(object.workExperience,
          specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.infoDdescription;
    if (value != null) {
      result
        ..add('info_description')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.workMobile;
    if (value != null) {
      result
        ..add('Work_Mobile')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.workHome;
    if (value != null) {
      result
        ..add('Work_Phone')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.gender;
    if (value != null) {
      result
        ..add('gender')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
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
  Doctor deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DoctorBuilder();

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
          result.infoDdescription = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'Work_Mobile':
          result.workMobile = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'Work_Phone':
          result.workHome = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'gender':
          result.gender = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'category_ids':
          result.categoryIds.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
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
              specifiedType: const FullType(String))! as String;
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
      serializers.serialize(object.category_name,
          specifiedType: const FullType(String)),
      'doctor_data',
      serializers.serialize(object.doctor_data,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Doctor)])),
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
          result.category_name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'doctor_data':
          result.doctor_data.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Doctor)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$Doctor extends Doctor {
  @override
  final int id;
  @override
  final String name;
  @override
  final bool? infoDdescription;
  @override
  final bool? workMobile;
  @override
  final bool? workHome;
  @override
  final bool? gender;
  @override
  final BuiltList<String> categoryIds;
  @override
  final String specialty;
  @override
  final String? image;
  @override
  final String academicRank;
  @override
  final int workExperience;

  factory _$Doctor([void Function(DoctorBuilder)? updates]) =>
      (new DoctorBuilder()..update(updates))._build();

  _$Doctor._(
      {required this.id,
      required this.name,
      this.infoDdescription,
      this.workMobile,
      this.workHome,
      this.gender,
      required this.categoryIds,
      required this.specialty,
      this.image,
      required this.academicRank,
      required this.workExperience})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'Doctor', 'id');
    BuiltValueNullFieldError.checkNotNull(name, r'Doctor', 'name');
    BuiltValueNullFieldError.checkNotNull(
        categoryIds, r'Doctor', 'categoryIds');
    BuiltValueNullFieldError.checkNotNull(specialty, r'Doctor', 'specialty');
    BuiltValueNullFieldError.checkNotNull(
        academicRank, r'Doctor', 'academicRank');
    BuiltValueNullFieldError.checkNotNull(
        workExperience, r'Doctor', 'workExperience');
  }

  @override
  Doctor rebuild(void Function(DoctorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DoctorBuilder toBuilder() => new DoctorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Doctor &&
        id == other.id &&
        name == other.name &&
        infoDdescription == other.infoDdescription &&
        workMobile == other.workMobile &&
        workHome == other.workHome &&
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
    _$hash = $jc(_$hash, infoDdescription.hashCode);
    _$hash = $jc(_$hash, workMobile.hashCode);
    _$hash = $jc(_$hash, workHome.hashCode);
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
    return (newBuiltValueToStringHelper(r'Doctor')
          ..add('id', id)
          ..add('name', name)
          ..add('infoDdescription', infoDdescription)
          ..add('workMobile', workMobile)
          ..add('workHome', workHome)
          ..add('gender', gender)
          ..add('categoryIds', categoryIds)
          ..add('specialty', specialty)
          ..add('image', image)
          ..add('academicRank', academicRank)
          ..add('workExperience', workExperience))
        .toString();
  }
}

class DoctorBuilder implements Builder<Doctor, DoctorBuilder> {
  _$Doctor? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  bool? _infoDdescription;
  bool? get infoDdescription => _$this._infoDdescription;
  set infoDdescription(bool? infoDdescription) =>
      _$this._infoDdescription = infoDdescription;

  bool? _workMobile;
  bool? get workMobile => _$this._workMobile;
  set workMobile(bool? workMobile) => _$this._workMobile = workMobile;

  bool? _workHome;
  bool? get workHome => _$this._workHome;
  set workHome(bool? workHome) => _$this._workHome = workHome;

  bool? _gender;
  bool? get gender => _$this._gender;
  set gender(bool? gender) => _$this._gender = gender;

  ListBuilder<String>? _categoryIds;
  ListBuilder<String> get categoryIds =>
      _$this._categoryIds ??= new ListBuilder<String>();
  set categoryIds(ListBuilder<String>? categoryIds) =>
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

  DoctorBuilder();

  DoctorBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _infoDdescription = $v.infoDdescription;
      _workMobile = $v.workMobile;
      _workHome = $v.workHome;
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
  void replace(Doctor other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Doctor;
  }

  @override
  void update(void Function(DoctorBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Doctor build() => _build();

  _$Doctor _build() {
    _$Doctor _$result;
    try {
      _$result = _$v ??
          new _$Doctor._(
              id: BuiltValueNullFieldError.checkNotNull(id, r'Doctor', 'id'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'Doctor', 'name'),
              infoDdescription: infoDdescription,
              workMobile: workMobile,
              workHome: workHome,
              gender: gender,
              categoryIds: categoryIds.build(),
              specialty: BuiltValueNullFieldError.checkNotNull(
                  specialty, r'Doctor', 'specialty'),
              image: image,
              academicRank: BuiltValueNullFieldError.checkNotNull(
                  academicRank, r'Doctor', 'academicRank'),
              workExperience: BuiltValueNullFieldError.checkNotNull(
                  workExperience, r'Doctor', 'workExperience'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'categoryIds';
        categoryIds.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Doctor', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$DoctorCategory extends DoctorCategory {
  @override
  final String category_name;
  @override
  final BuiltList<Doctor> doctor_data;

  factory _$DoctorCategory([void Function(DoctorCategoryBuilder)? updates]) =>
      (new DoctorCategoryBuilder()..update(updates))._build();

  _$DoctorCategory._({required this.category_name, required this.doctor_data})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        category_name, r'DoctorCategory', 'category_name');
    BuiltValueNullFieldError.checkNotNull(
        doctor_data, r'DoctorCategory', 'doctor_data');
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
        category_name == other.category_name &&
        doctor_data == other.doctor_data;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, category_name.hashCode);
    _$hash = $jc(_$hash, doctor_data.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DoctorCategory')
          ..add('category_name', category_name)
          ..add('doctor_data', doctor_data))
        .toString();
  }
}

class DoctorCategoryBuilder
    implements Builder<DoctorCategory, DoctorCategoryBuilder> {
  _$DoctorCategory? _$v;

  String? _category_name;
  String? get category_name => _$this._category_name;
  set category_name(String? category_name) =>
      _$this._category_name = category_name;

  ListBuilder<Doctor>? _doctor_data;
  ListBuilder<Doctor> get doctor_data =>
      _$this._doctor_data ??= new ListBuilder<Doctor>();
  set doctor_data(ListBuilder<Doctor>? doctor_data) =>
      _$this._doctor_data = doctor_data;

  DoctorCategoryBuilder();

  DoctorCategoryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _category_name = $v.category_name;
      _doctor_data = $v.doctor_data.toBuilder();
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
              category_name: BuiltValueNullFieldError.checkNotNull(
                  category_name, r'DoctorCategory', 'category_name'),
              doctor_data: doctor_data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'doctor_data';
        doctor_data.build();
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

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
