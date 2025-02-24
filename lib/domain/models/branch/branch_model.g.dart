// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BranchModel> _$branchModelSerializer = new _$BranchModelSerializer();
Serializer<AwardsModel> _$awardsModelSerializer = new _$AwardsModelSerializer();
Serializer<EducationModel> _$educationModelSerializer =
    new _$EducationModelSerializer();
Serializer<Course> _$courseSerializer = new _$CourseSerializer();

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

class _$AwardsModelSerializer implements StructuredSerializer<AwardsModel> {
  @override
  final Iterable<Type> types = const [AwardsModel, _$AwardsModel];
  @override
  final String wireName = 'AwardsModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, AwardsModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.branchId;
    if (value != null) {
      result
        ..add('branch_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.title;
    if (value != null) {
      result
        ..add('title')
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
  AwardsModel deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AwardsModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'branch_id':
          result.branchId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$EducationModelSerializer
    implements StructuredSerializer<EducationModel> {
  @override
  final Iterable<Type> types = const [EducationModel, _$EducationModel];
  @override
  final String wireName = 'EducationModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, EducationModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
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
    value = object.mission;
    if (value != null) {
      result
        ..add('mission')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.values;
    if (value != null) {
      result
        ..add('values')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.goals;
    if (value != null) {
      result
        ..add('goals')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.audience;
    if (value != null) {
      result
        ..add('audience')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.whyUs;
    if (value != null) {
      result
        ..add('why_us')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.companyId;
    if (value != null) {
      result
        ..add('company_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.courses;
    if (value != null) {
      result
        ..add('courses')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(Course)])));
    }
    return result;
  }

  @override
  EducationModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EducationModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'mission':
          result.mission = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'values':
          result.values = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'goals':
          result.goals = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'audience':
          result.audience = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'why_us':
          result.whyUs = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'company_id':
          result.companyId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'courses':
          result.courses.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Course)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$CourseSerializer implements StructuredSerializer<Course> {
  @override
  final Iterable<Type> types = const [Course, _$Course];
  @override
  final String wireName = 'Course';

  @override
  Iterable<Object?> serialize(Serializers serializers, Course object,
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
    value = object.description;
    if (value != null) {
      result
        ..add('description')
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
    return result;
  }

  @override
  Course deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CourseBuilder();

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
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'image':
          result.image = serializers.deserialize(value,
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

class _$AwardsModel extends AwardsModel {
  @override
  final int? branchId;
  @override
  final int? id;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final String? image;

  factory _$AwardsModel([void Function(AwardsModelBuilder)? updates]) =>
      (new AwardsModelBuilder()..update(updates))._build();

  _$AwardsModel._(
      {this.branchId, this.id, this.title, this.description, this.image})
      : super._();

  @override
  AwardsModel rebuild(void Function(AwardsModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AwardsModelBuilder toBuilder() => new AwardsModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AwardsModel &&
        branchId == other.branchId &&
        id == other.id &&
        title == other.title &&
        description == other.description &&
        image == other.image;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, branchId.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AwardsModel')
          ..add('branchId', branchId)
          ..add('id', id)
          ..add('title', title)
          ..add('description', description)
          ..add('image', image))
        .toString();
  }
}

class AwardsModelBuilder implements Builder<AwardsModel, AwardsModelBuilder> {
  _$AwardsModel? _$v;

  int? _branchId;
  int? get branchId => _$this._branchId;
  set branchId(int? branchId) => _$this._branchId = branchId;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  AwardsModelBuilder();

  AwardsModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _branchId = $v.branchId;
      _id = $v.id;
      _title = $v.title;
      _description = $v.description;
      _image = $v.image;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AwardsModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AwardsModel;
  }

  @override
  void update(void Function(AwardsModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AwardsModel build() => _build();

  _$AwardsModel _build() {
    final _$result = _$v ??
        new _$AwardsModel._(
          branchId: branchId,
          id: id,
          title: title,
          description: description,
          image: image,
        );
    replace(_$result);
    return _$result;
  }
}

class _$EducationModel extends EducationModel {
  @override
  final String? name;
  @override
  final String? description;
  @override
  final String? mission;
  @override
  final String? values;
  @override
  final String? goals;
  @override
  final String? audience;
  @override
  final String? whyUs;
  @override
  final int? companyId;
  @override
  final BuiltList<Course>? courses;

  factory _$EducationModel([void Function(EducationModelBuilder)? updates]) =>
      (new EducationModelBuilder()..update(updates))._build();

  _$EducationModel._(
      {this.name,
      this.description,
      this.mission,
      this.values,
      this.goals,
      this.audience,
      this.whyUs,
      this.companyId,
      this.courses})
      : super._();

  @override
  EducationModel rebuild(void Function(EducationModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EducationModelBuilder toBuilder() =>
      new EducationModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EducationModel &&
        name == other.name &&
        description == other.description &&
        mission == other.mission &&
        values == other.values &&
        goals == other.goals &&
        audience == other.audience &&
        whyUs == other.whyUs &&
        companyId == other.companyId &&
        courses == other.courses;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, mission.hashCode);
    _$hash = $jc(_$hash, values.hashCode);
    _$hash = $jc(_$hash, goals.hashCode);
    _$hash = $jc(_$hash, audience.hashCode);
    _$hash = $jc(_$hash, whyUs.hashCode);
    _$hash = $jc(_$hash, companyId.hashCode);
    _$hash = $jc(_$hash, courses.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EducationModel')
          ..add('name', name)
          ..add('description', description)
          ..add('mission', mission)
          ..add('values', values)
          ..add('goals', goals)
          ..add('audience', audience)
          ..add('whyUs', whyUs)
          ..add('companyId', companyId)
          ..add('courses', courses))
        .toString();
  }
}

class EducationModelBuilder
    implements Builder<EducationModel, EducationModelBuilder> {
  _$EducationModel? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _mission;
  String? get mission => _$this._mission;
  set mission(String? mission) => _$this._mission = mission;

  String? _values;
  String? get values => _$this._values;
  set values(String? values) => _$this._values = values;

  String? _goals;
  String? get goals => _$this._goals;
  set goals(String? goals) => _$this._goals = goals;

  String? _audience;
  String? get audience => _$this._audience;
  set audience(String? audience) => _$this._audience = audience;

  String? _whyUs;
  String? get whyUs => _$this._whyUs;
  set whyUs(String? whyUs) => _$this._whyUs = whyUs;

  int? _companyId;
  int? get companyId => _$this._companyId;
  set companyId(int? companyId) => _$this._companyId = companyId;

  ListBuilder<Course>? _courses;
  ListBuilder<Course> get courses =>
      _$this._courses ??= new ListBuilder<Course>();
  set courses(ListBuilder<Course>? courses) => _$this._courses = courses;

  EducationModelBuilder();

  EducationModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _description = $v.description;
      _mission = $v.mission;
      _values = $v.values;
      _goals = $v.goals;
      _audience = $v.audience;
      _whyUs = $v.whyUs;
      _companyId = $v.companyId;
      _courses = $v.courses?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EducationModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EducationModel;
  }

  @override
  void update(void Function(EducationModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EducationModel build() => _build();

  _$EducationModel _build() {
    _$EducationModel _$result;
    try {
      _$result = _$v ??
          new _$EducationModel._(
            name: name,
            description: description,
            mission: mission,
            values: values,
            goals: goals,
            audience: audience,
            whyUs: whyUs,
            companyId: companyId,
            courses: _courses?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'courses';
        _courses?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'EducationModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Course extends Course {
  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final String? image;

  factory _$Course([void Function(CourseBuilder)? updates]) =>
      (new CourseBuilder()..update(updates))._build();

  _$Course._({this.id, this.name, this.description, this.image}) : super._();

  @override
  Course rebuild(void Function(CourseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CourseBuilder toBuilder() => new CourseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Course &&
        id == other.id &&
        name == other.name &&
        description == other.description &&
        image == other.image;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Course')
          ..add('id', id)
          ..add('name', name)
          ..add('description', description)
          ..add('image', image))
        .toString();
  }
}

class CourseBuilder implements Builder<Course, CourseBuilder> {
  _$Course? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  CourseBuilder();

  CourseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _description = $v.description;
      _image = $v.image;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Course other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Course;
  }

  @override
  void update(void Function(CourseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Course build() => _build();

  _$Course _build() {
    final _$result = _$v ??
        new _$Course._(
          id: id,
          name: name,
          description: description,
          image: image,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
