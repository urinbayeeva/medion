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
      serializers.serialize(object.category_name,
          specifiedType: const FullType(String)),
      'doctor_data',
      serializers.serialize(object.doctor_data,
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
          result.category_name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'doctor_data':
          result.doctor_data.replace(serializers.deserialize(value,
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
      serializers.serialize(object.category_ids,
          specifiedType:
              const FullType(BuiltList, const [const FullType(int)])),
      'specialty',
      serializers.serialize(object.specialty,
          specifiedType: const FullType(String)),
      'work_experience',
      serializers.serialize(object.work_experience,
          specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.info_description;
    if (value != null) {
      result
        ..add('info_description')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.Work_Mobile;
    if (value != null) {
      result
        ..add('Work_Mobile')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.Work_Phone;
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
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.academic_rank;
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
          result.info_description = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'Work_Mobile':
          result.Work_Mobile = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'Work_Phone':
          result.Work_Phone = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'gender':
          result.gender = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'category_ids':
          result.category_ids.replace(serializers.deserialize(value,
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
          result.academic_rank = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'work_experience':
          result.work_experience = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$DoctorCategory extends DoctorCategory {
  @override
  final String category_name;
  @override
  final BuiltList<DoctorData> doctor_data;

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

  ListBuilder<DoctorData>? _doctor_data;
  ListBuilder<DoctorData> get doctor_data =>
      _$this._doctor_data ??= new ListBuilder<DoctorData>();
  set doctor_data(ListBuilder<DoctorData>? doctor_data) =>
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

class _$DoctorData extends DoctorData {
  @override
  final int id;
  @override
  final String name;
  @override
  final bool? info_description;
  @override
  final bool? Work_Mobile;
  @override
  final bool? Work_Phone;
  @override
  final String? gender;
  @override
  final BuiltList<int> category_ids;
  @override
  final String specialty;
  @override
  final String? image;
  @override
  final String? academic_rank;
  @override
  final int work_experience;

  factory _$DoctorData([void Function(DoctorDataBuilder)? updates]) =>
      (new DoctorDataBuilder()..update(updates))._build();

  _$DoctorData._(
      {required this.id,
      required this.name,
      this.info_description,
      this.Work_Mobile,
      this.Work_Phone,
      this.gender,
      required this.category_ids,
      required this.specialty,
      this.image,
      this.academic_rank,
      required this.work_experience})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'DoctorData', 'id');
    BuiltValueNullFieldError.checkNotNull(name, r'DoctorData', 'name');
    BuiltValueNullFieldError.checkNotNull(
        category_ids, r'DoctorData', 'category_ids');
    BuiltValueNullFieldError.checkNotNull(
        specialty, r'DoctorData', 'specialty');
    BuiltValueNullFieldError.checkNotNull(
        work_experience, r'DoctorData', 'work_experience');
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
        info_description == other.info_description &&
        Work_Mobile == other.Work_Mobile &&
        Work_Phone == other.Work_Phone &&
        gender == other.gender &&
        category_ids == other.category_ids &&
        specialty == other.specialty &&
        image == other.image &&
        academic_rank == other.academic_rank &&
        work_experience == other.work_experience;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, info_description.hashCode);
    _$hash = $jc(_$hash, Work_Mobile.hashCode);
    _$hash = $jc(_$hash, Work_Phone.hashCode);
    _$hash = $jc(_$hash, gender.hashCode);
    _$hash = $jc(_$hash, category_ids.hashCode);
    _$hash = $jc(_$hash, specialty.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jc(_$hash, academic_rank.hashCode);
    _$hash = $jc(_$hash, work_experience.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DoctorData')
          ..add('id', id)
          ..add('name', name)
          ..add('info_description', info_description)
          ..add('Work_Mobile', Work_Mobile)
          ..add('Work_Phone', Work_Phone)
          ..add('gender', gender)
          ..add('category_ids', category_ids)
          ..add('specialty', specialty)
          ..add('image', image)
          ..add('academic_rank', academic_rank)
          ..add('work_experience', work_experience))
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

  bool? _info_description;
  bool? get info_description => _$this._info_description;
  set info_description(bool? info_description) =>
      _$this._info_description = info_description;

  bool? _Work_Mobile;
  bool? get Work_Mobile => _$this._Work_Mobile;
  set Work_Mobile(bool? Work_Mobile) => _$this._Work_Mobile = Work_Mobile;

  bool? _Work_Phone;
  bool? get Work_Phone => _$this._Work_Phone;
  set Work_Phone(bool? Work_Phone) => _$this._Work_Phone = Work_Phone;

  String? _gender;
  String? get gender => _$this._gender;
  set gender(String? gender) => _$this._gender = gender;

  ListBuilder<int>? _category_ids;
  ListBuilder<int> get category_ids =>
      _$this._category_ids ??= new ListBuilder<int>();
  set category_ids(ListBuilder<int>? category_ids) =>
      _$this._category_ids = category_ids;

  String? _specialty;
  String? get specialty => _$this._specialty;
  set specialty(String? specialty) => _$this._specialty = specialty;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  String? _academic_rank;
  String? get academic_rank => _$this._academic_rank;
  set academic_rank(String? academic_rank) =>
      _$this._academic_rank = academic_rank;

  int? _work_experience;
  int? get work_experience => _$this._work_experience;
  set work_experience(int? work_experience) =>
      _$this._work_experience = work_experience;

  DoctorDataBuilder();

  DoctorDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _info_description = $v.info_description;
      _Work_Mobile = $v.Work_Mobile;
      _Work_Phone = $v.Work_Phone;
      _gender = $v.gender;
      _category_ids = $v.category_ids.toBuilder();
      _specialty = $v.specialty;
      _image = $v.image;
      _academic_rank = $v.academic_rank;
      _work_experience = $v.work_experience;
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
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'DoctorData', 'id'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'DoctorData', 'name'),
              info_description: info_description,
              Work_Mobile: Work_Mobile,
              Work_Phone: Work_Phone,
              gender: gender,
              category_ids: category_ids.build(),
              specialty: BuiltValueNullFieldError.checkNotNull(
                  specialty, r'DoctorData', 'specialty'),
              image: image,
              academic_rank: academic_rank,
              work_experience: BuiltValueNullFieldError.checkNotNull(
                  work_experience, r'DoctorData', 'work_experience'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'category_ids';
        category_ids.build();
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
