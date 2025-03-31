// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DoctorCategory> _$doctorCategorySerializer =
    new _$DoctorCategorySerializer();
Serializer<DoctorData> _$doctorDataSerializer = new _$DoctorDataSerializer();
Serializer<ModelDoctor> _$modelDoctorSerializer = new _$ModelDoctorSerializer();
Serializer<WorkSchedule> _$workScheduleSerializer =
    new _$WorkScheduleSerializer();
Serializer<ScheduleItem> _$scheduleItemSerializer =
    new _$ScheduleItemSerializer();
Serializer<Experience> _$experienceSerializer = new _$ExperienceSerializer();
Serializer<Education> _$educationSerializer = new _$EducationSerializer();
Serializer<Award> _$awardSerializer = new _$AwardSerializer();
Serializer<PriceItem> _$priceItemSerializer = new _$PriceItemSerializer();

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
    value = object.specialty;
    if (value != null) {
      result
        ..add('specialty')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(JsonObject)));
    }
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(JsonObject)));
    }
    value = object.academicRank;
    if (value != null) {
      result
        ..add('academic_rank')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(JsonObject)));
    }
    value = object.workExperience;
    if (value != null) {
      result
        ..add('work_experience')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(JsonObject)));
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
              specifiedType: const FullType(JsonObject)) as JsonObject?;
          break;
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(JsonObject)) as JsonObject?;
          break;
        case 'academic_rank':
          result.academicRank = serializers.deserialize(value,
              specifiedType: const FullType(JsonObject)) as JsonObject?;
          break;
        case 'work_experience':
          result.workExperience = serializers.deserialize(value,
              specifiedType: const FullType(JsonObject)) as JsonObject?;
          break;
      }
    }

    return result.build();
  }
}

class _$ModelDoctorSerializer implements StructuredSerializer<ModelDoctor> {
  @override
  final Iterable<Type> types = const [ModelDoctor, _$ModelDoctor];
  @override
  final String wireName = 'ModelDoctor';

  @override
  Iterable<Object?> serialize(Serializers serializers, ModelDoctor object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'short_desc',
      serializers.serialize(object.shortDesc,
          specifiedType: const FullType(String)),
      'work_schedule',
      serializers.serialize(object.workSchedule,
          specifiedType: const FullType(WorkSchedule)),
      'experience',
      serializers.serialize(object.experience,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Experience)])),
      'education',
      serializers.serialize(object.education,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Education)])),
      'award',
      serializers.serialize(object.award,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Award)])),
      'job_id',
      serializers.serialize(object.jobId,
          specifiedType: const FullType(String)),
      'image',
      serializers.serialize(object.image,
          specifiedType: const FullType(String)),
      'price_list',
      serializers.serialize(object.priceList,
          specifiedType:
              const FullType(BuiltList, const [const FullType(PriceItem)])),
      'service_price_list',
      serializers.serialize(object.servicePriceList,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.gender;
    if (value != null) {
      result
        ..add('gender')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(JsonObject)));
    }
    return result;
  }

  @override
  ModelDoctor deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ModelDoctorBuilder();

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
        case 'short_desc':
          result.shortDesc = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'work_schedule':
          result.workSchedule.replace(serializers.deserialize(value,
              specifiedType: const FullType(WorkSchedule))! as WorkSchedule);
          break;
        case 'experience':
          result.experience.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Experience)]))!
              as BuiltList<Object?>);
          break;
        case 'education':
          result.education.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Education)]))!
              as BuiltList<Object?>);
          break;
        case 'award':
          result.award.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Award)]))!
              as BuiltList<Object?>);
          break;
        case 'gender':
          result.gender = serializers.deserialize(value,
              specifiedType: const FullType(JsonObject)) as JsonObject?;
          break;
        case 'job_id':
          result.jobId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'price_list':
          result.priceList.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(PriceItem)]))!
              as BuiltList<Object?>);
          break;
        case 'service_price_list':
          result.servicePriceList = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$WorkScheduleSerializer implements StructuredSerializer<WorkSchedule> {
  @override
  final Iterable<Type> types = const [WorkSchedule, _$WorkSchedule];
  @override
  final String wireName = 'WorkSchedule';

  @override
  Iterable<Object?> serialize(Serializers serializers, WorkSchedule object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'Monday',
      serializers.serialize(object.monday,
          specifiedType:
              const FullType(BuiltList, const [const FullType(ScheduleItem)])),
      'Tuesday',
      serializers.serialize(object.tuesday,
          specifiedType:
              const FullType(BuiltList, const [const FullType(ScheduleItem)])),
      'Wednesday',
      serializers.serialize(object.wednesday,
          specifiedType:
              const FullType(BuiltList, const [const FullType(ScheduleItem)])),
      'Thursday',
      serializers.serialize(object.thursday,
          specifiedType:
              const FullType(BuiltList, const [const FullType(ScheduleItem)])),
      'Friday',
      serializers.serialize(object.friday,
          specifiedType:
              const FullType(BuiltList, const [const FullType(ScheduleItem)])),
      'Saturday',
      serializers.serialize(object.saturday,
          specifiedType:
              const FullType(BuiltList, const [const FullType(ScheduleItem)])),
    ];

    return result;
  }

  @override
  WorkSchedule deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WorkScheduleBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'Monday':
          result.monday.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ScheduleItem)]))!
              as BuiltList<Object?>);
          break;
        case 'Tuesday':
          result.tuesday.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ScheduleItem)]))!
              as BuiltList<Object?>);
          break;
        case 'Wednesday':
          result.wednesday.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ScheduleItem)]))!
              as BuiltList<Object?>);
          break;
        case 'Thursday':
          result.thursday.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ScheduleItem)]))!
              as BuiltList<Object?>);
          break;
        case 'Friday':
          result.friday.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ScheduleItem)]))!
              as BuiltList<Object?>);
          break;
        case 'Saturday':
          result.saturday.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ScheduleItem)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$ScheduleItemSerializer implements StructuredSerializer<ScheduleItem> {
  @override
  final Iterable<Type> types = const [ScheduleItem, _$ScheduleItem];
  @override
  final String wireName = 'ScheduleItem';

  @override
  Iterable<Object?> serialize(Serializers serializers, ScheduleItem object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'company',
      serializers.serialize(object.company,
          specifiedType: const FullType(String)),
      'time',
      serializers.serialize(object.time, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  ScheduleItem deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ScheduleItemBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'company':
          result.company = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'time':
          result.time = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ExperienceSerializer implements StructuredSerializer<Experience> {
  @override
  final Iterable<Type> types = const [Experience, _$Experience];
  @override
  final String wireName = 'Experience';

  @override
  Iterable<Object?> serialize(Serializers serializers, Experience object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'date',
      serializers.serialize(object.date, specifiedType: const FullType(String)),
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Experience deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ExperienceBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$EducationSerializer implements StructuredSerializer<Education> {
  @override
  final Iterable<Type> types = const [Education, _$Education];
  @override
  final String wireName = 'Education';

  @override
  Iterable<Object?> serialize(Serializers serializers, Education object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'date',
      serializers.serialize(object.date, specifiedType: const FullType(String)),
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Education deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EducationBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$AwardSerializer implements StructuredSerializer<Award> {
  @override
  final Iterable<Type> types = const [Award, _$Award];
  @override
  final String wireName = 'Award';

  @override
  Iterable<Object?> serialize(Serializers serializers, Award object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  Award deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new AwardBuilder().build();
  }
}

class _$PriceItemSerializer implements StructuredSerializer<PriceItem> {
  @override
  final Iterable<Type> types = const [PriceItem, _$PriceItem];
  @override
  final String wireName = 'PriceItem';

  @override
  Iterable<Object?> serialize(Serializers serializers, PriceItem object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'product_type',
      serializers.serialize(object.productType,
          specifiedType: const FullType(String)),
      'categ_id',
      serializers.serialize(object.categId,
          specifiedType: const FullType(String)),
      'service_id',
      serializers.serialize(object.serviceId,
          specifiedType: const FullType(double)),
      'first_visit_price',
      serializers.serialize(object.firstVisitPrice,
          specifiedType: const FullType(double)),
      'revisit_price',
      serializers.serialize(object.revisitPrice,
          specifiedType: const FullType(double)),
      'performance_percentage',
      serializers.serialize(object.performancePercentage,
          specifiedType: const FullType(double)),
      'per_dividend_refer',
      serializers.serialize(object.perDividendRefer,
          specifiedType: const FullType(double)),
      'service_duration',
      serializers.serialize(object.serviceDuration,
          specifiedType: const FullType(double)),
      'age',
      serializers.serialize(object.age, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  PriceItem deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PriceItemBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'product_type':
          result.productType = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'categ_id':
          result.categId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'service_id':
          result.serviceId = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'first_visit_price':
          result.firstVisitPrice = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'revisit_price':
          result.revisitPrice = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'performance_percentage':
          result.performancePercentage = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'per_dividend_refer':
          result.perDividendRefer = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'service_duration':
          result.serviceDuration = serializers.deserialize(value,
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
  final JsonObject? specialty;
  @override
  final JsonObject? image;
  @override
  final JsonObject? academicRank;
  @override
  final JsonObject? workExperience;

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
      this.specialty,
      this.image,
      this.academicRank,
      this.workExperience})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'DoctorData', 'id');
    BuiltValueNullFieldError.checkNotNull(name, r'DoctorData', 'name');
    BuiltValueNullFieldError.checkNotNull(
        categoryIds, r'DoctorData', 'categoryIds');
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

  JsonObject? _specialty;
  JsonObject? get specialty => _$this._specialty;
  set specialty(JsonObject? specialty) => _$this._specialty = specialty;

  JsonObject? _image;
  JsonObject? get image => _$this._image;
  set image(JsonObject? image) => _$this._image = image;

  JsonObject? _academicRank;
  JsonObject? get academicRank => _$this._academicRank;
  set academicRank(JsonObject? academicRank) =>
      _$this._academicRank = academicRank;

  JsonObject? _workExperience;
  JsonObject? get workExperience => _$this._workExperience;
  set workExperience(JsonObject? workExperience) =>
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
            specialty: specialty,
            image: image,
            academicRank: academicRank,
            workExperience: workExperience,
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

class _$ModelDoctor extends ModelDoctor {
  @override
  final int id;
  @override
  final String name;
  @override
  final String shortDesc;
  @override
  final WorkSchedule workSchedule;
  @override
  final BuiltList<Experience> experience;
  @override
  final BuiltList<Education> education;
  @override
  final BuiltList<Award> award;
  @override
  final JsonObject? gender;
  @override
  final String jobId;
  @override
  final String image;
  @override
  final BuiltList<PriceItem> priceList;
  @override
  final String servicePriceList;

  factory _$ModelDoctor([void Function(ModelDoctorBuilder)? updates]) =>
      (new ModelDoctorBuilder()..update(updates))._build();

  _$ModelDoctor._(
      {required this.id,
      required this.name,
      required this.shortDesc,
      required this.workSchedule,
      required this.experience,
      required this.education,
      required this.award,
      this.gender,
      required this.jobId,
      required this.image,
      required this.priceList,
      required this.servicePriceList})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'ModelDoctor', 'id');
    BuiltValueNullFieldError.checkNotNull(name, r'ModelDoctor', 'name');
    BuiltValueNullFieldError.checkNotNull(
        shortDesc, r'ModelDoctor', 'shortDesc');
    BuiltValueNullFieldError.checkNotNull(
        workSchedule, r'ModelDoctor', 'workSchedule');
    BuiltValueNullFieldError.checkNotNull(
        experience, r'ModelDoctor', 'experience');
    BuiltValueNullFieldError.checkNotNull(
        education, r'ModelDoctor', 'education');
    BuiltValueNullFieldError.checkNotNull(award, r'ModelDoctor', 'award');
    BuiltValueNullFieldError.checkNotNull(jobId, r'ModelDoctor', 'jobId');
    BuiltValueNullFieldError.checkNotNull(image, r'ModelDoctor', 'image');
    BuiltValueNullFieldError.checkNotNull(
        priceList, r'ModelDoctor', 'priceList');
    BuiltValueNullFieldError.checkNotNull(
        servicePriceList, r'ModelDoctor', 'servicePriceList');
  }

  @override
  ModelDoctor rebuild(void Function(ModelDoctorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ModelDoctorBuilder toBuilder() => new ModelDoctorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ModelDoctor &&
        id == other.id &&
        name == other.name &&
        shortDesc == other.shortDesc &&
        workSchedule == other.workSchedule &&
        experience == other.experience &&
        education == other.education &&
        award == other.award &&
        gender == other.gender &&
        jobId == other.jobId &&
        image == other.image &&
        priceList == other.priceList &&
        servicePriceList == other.servicePriceList;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, shortDesc.hashCode);
    _$hash = $jc(_$hash, workSchedule.hashCode);
    _$hash = $jc(_$hash, experience.hashCode);
    _$hash = $jc(_$hash, education.hashCode);
    _$hash = $jc(_$hash, award.hashCode);
    _$hash = $jc(_$hash, gender.hashCode);
    _$hash = $jc(_$hash, jobId.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jc(_$hash, priceList.hashCode);
    _$hash = $jc(_$hash, servicePriceList.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ModelDoctor')
          ..add('id', id)
          ..add('name', name)
          ..add('shortDesc', shortDesc)
          ..add('workSchedule', workSchedule)
          ..add('experience', experience)
          ..add('education', education)
          ..add('award', award)
          ..add('gender', gender)
          ..add('jobId', jobId)
          ..add('image', image)
          ..add('priceList', priceList)
          ..add('servicePriceList', servicePriceList))
        .toString();
  }
}

class ModelDoctorBuilder implements Builder<ModelDoctor, ModelDoctorBuilder> {
  _$ModelDoctor? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _shortDesc;
  String? get shortDesc => _$this._shortDesc;
  set shortDesc(String? shortDesc) => _$this._shortDesc = shortDesc;

  WorkScheduleBuilder? _workSchedule;
  WorkScheduleBuilder get workSchedule =>
      _$this._workSchedule ??= new WorkScheduleBuilder();
  set workSchedule(WorkScheduleBuilder? workSchedule) =>
      _$this._workSchedule = workSchedule;

  ListBuilder<Experience>? _experience;
  ListBuilder<Experience> get experience =>
      _$this._experience ??= new ListBuilder<Experience>();
  set experience(ListBuilder<Experience>? experience) =>
      _$this._experience = experience;

  ListBuilder<Education>? _education;
  ListBuilder<Education> get education =>
      _$this._education ??= new ListBuilder<Education>();
  set education(ListBuilder<Education>? education) =>
      _$this._education = education;

  ListBuilder<Award>? _award;
  ListBuilder<Award> get award => _$this._award ??= new ListBuilder<Award>();
  set award(ListBuilder<Award>? award) => _$this._award = award;

  JsonObject? _gender;
  JsonObject? get gender => _$this._gender;
  set gender(JsonObject? gender) => _$this._gender = gender;

  String? _jobId;
  String? get jobId => _$this._jobId;
  set jobId(String? jobId) => _$this._jobId = jobId;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  ListBuilder<PriceItem>? _priceList;
  ListBuilder<PriceItem> get priceList =>
      _$this._priceList ??= new ListBuilder<PriceItem>();
  set priceList(ListBuilder<PriceItem>? priceList) =>
      _$this._priceList = priceList;

  String? _servicePriceList;
  String? get servicePriceList => _$this._servicePriceList;
  set servicePriceList(String? servicePriceList) =>
      _$this._servicePriceList = servicePriceList;

  ModelDoctorBuilder();

  ModelDoctorBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _shortDesc = $v.shortDesc;
      _workSchedule = $v.workSchedule.toBuilder();
      _experience = $v.experience.toBuilder();
      _education = $v.education.toBuilder();
      _award = $v.award.toBuilder();
      _gender = $v.gender;
      _jobId = $v.jobId;
      _image = $v.image;
      _priceList = $v.priceList.toBuilder();
      _servicePriceList = $v.servicePriceList;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ModelDoctor other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ModelDoctor;
  }

  @override
  void update(void Function(ModelDoctorBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ModelDoctor build() => _build();

  _$ModelDoctor _build() {
    _$ModelDoctor _$result;
    try {
      _$result = _$v ??
          new _$ModelDoctor._(
            id: BuiltValueNullFieldError.checkNotNull(id, r'ModelDoctor', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'ModelDoctor', 'name'),
            shortDesc: BuiltValueNullFieldError.checkNotNull(
                shortDesc, r'ModelDoctor', 'shortDesc'),
            workSchedule: workSchedule.build(),
            experience: experience.build(),
            education: education.build(),
            award: award.build(),
            gender: gender,
            jobId: BuiltValueNullFieldError.checkNotNull(
                jobId, r'ModelDoctor', 'jobId'),
            image: BuiltValueNullFieldError.checkNotNull(
                image, r'ModelDoctor', 'image'),
            priceList: priceList.build(),
            servicePriceList: BuiltValueNullFieldError.checkNotNull(
                servicePriceList, r'ModelDoctor', 'servicePriceList'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'workSchedule';
        workSchedule.build();
        _$failedField = 'experience';
        experience.build();
        _$failedField = 'education';
        education.build();
        _$failedField = 'award';
        award.build();

        _$failedField = 'priceList';
        priceList.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ModelDoctor', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$WorkSchedule extends WorkSchedule {
  @override
  final BuiltList<ScheduleItem> monday;
  @override
  final BuiltList<ScheduleItem> tuesday;
  @override
  final BuiltList<ScheduleItem> wednesday;
  @override
  final BuiltList<ScheduleItem> thursday;
  @override
  final BuiltList<ScheduleItem> friday;
  @override
  final BuiltList<ScheduleItem> saturday;

  factory _$WorkSchedule([void Function(WorkScheduleBuilder)? updates]) =>
      (new WorkScheduleBuilder()..update(updates))._build();

  _$WorkSchedule._(
      {required this.monday,
      required this.tuesday,
      required this.wednesday,
      required this.thursday,
      required this.friday,
      required this.saturday})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(monday, r'WorkSchedule', 'monday');
    BuiltValueNullFieldError.checkNotNull(tuesday, r'WorkSchedule', 'tuesday');
    BuiltValueNullFieldError.checkNotNull(
        wednesday, r'WorkSchedule', 'wednesday');
    BuiltValueNullFieldError.checkNotNull(
        thursday, r'WorkSchedule', 'thursday');
    BuiltValueNullFieldError.checkNotNull(friday, r'WorkSchedule', 'friday');
    BuiltValueNullFieldError.checkNotNull(
        saturday, r'WorkSchedule', 'saturday');
  }

  @override
  WorkSchedule rebuild(void Function(WorkScheduleBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WorkScheduleBuilder toBuilder() => new WorkScheduleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WorkSchedule &&
        monday == other.monday &&
        tuesday == other.tuesday &&
        wednesday == other.wednesday &&
        thursday == other.thursday &&
        friday == other.friday &&
        saturday == other.saturday;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, monday.hashCode);
    _$hash = $jc(_$hash, tuesday.hashCode);
    _$hash = $jc(_$hash, wednesday.hashCode);
    _$hash = $jc(_$hash, thursday.hashCode);
    _$hash = $jc(_$hash, friday.hashCode);
    _$hash = $jc(_$hash, saturday.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WorkSchedule')
          ..add('monday', monday)
          ..add('tuesday', tuesday)
          ..add('wednesday', wednesday)
          ..add('thursday', thursday)
          ..add('friday', friday)
          ..add('saturday', saturday))
        .toString();
  }
}

class WorkScheduleBuilder
    implements Builder<WorkSchedule, WorkScheduleBuilder> {
  _$WorkSchedule? _$v;

  ListBuilder<ScheduleItem>? _monday;
  ListBuilder<ScheduleItem> get monday =>
      _$this._monday ??= new ListBuilder<ScheduleItem>();
  set monday(ListBuilder<ScheduleItem>? monday) => _$this._monday = monday;

  ListBuilder<ScheduleItem>? _tuesday;
  ListBuilder<ScheduleItem> get tuesday =>
      _$this._tuesday ??= new ListBuilder<ScheduleItem>();
  set tuesday(ListBuilder<ScheduleItem>? tuesday) => _$this._tuesday = tuesday;

  ListBuilder<ScheduleItem>? _wednesday;
  ListBuilder<ScheduleItem> get wednesday =>
      _$this._wednesday ??= new ListBuilder<ScheduleItem>();
  set wednesday(ListBuilder<ScheduleItem>? wednesday) =>
      _$this._wednesday = wednesday;

  ListBuilder<ScheduleItem>? _thursday;
  ListBuilder<ScheduleItem> get thursday =>
      _$this._thursday ??= new ListBuilder<ScheduleItem>();
  set thursday(ListBuilder<ScheduleItem>? thursday) =>
      _$this._thursday = thursday;

  ListBuilder<ScheduleItem>? _friday;
  ListBuilder<ScheduleItem> get friday =>
      _$this._friday ??= new ListBuilder<ScheduleItem>();
  set friday(ListBuilder<ScheduleItem>? friday) => _$this._friday = friday;

  ListBuilder<ScheduleItem>? _saturday;
  ListBuilder<ScheduleItem> get saturday =>
      _$this._saturday ??= new ListBuilder<ScheduleItem>();
  set saturday(ListBuilder<ScheduleItem>? saturday) =>
      _$this._saturday = saturday;

  WorkScheduleBuilder();

  WorkScheduleBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _monday = $v.monday.toBuilder();
      _tuesday = $v.tuesday.toBuilder();
      _wednesday = $v.wednesday.toBuilder();
      _thursday = $v.thursday.toBuilder();
      _friday = $v.friday.toBuilder();
      _saturday = $v.saturday.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WorkSchedule other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WorkSchedule;
  }

  @override
  void update(void Function(WorkScheduleBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WorkSchedule build() => _build();

  _$WorkSchedule _build() {
    _$WorkSchedule _$result;
    try {
      _$result = _$v ??
          new _$WorkSchedule._(
            monday: monday.build(),
            tuesday: tuesday.build(),
            wednesday: wednesday.build(),
            thursday: thursday.build(),
            friday: friday.build(),
            saturday: saturday.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'monday';
        monday.build();
        _$failedField = 'tuesday';
        tuesday.build();
        _$failedField = 'wednesday';
        wednesday.build();
        _$failedField = 'thursday';
        thursday.build();
        _$failedField = 'friday';
        friday.build();
        _$failedField = 'saturday';
        saturday.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'WorkSchedule', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ScheduleItem extends ScheduleItem {
  @override
  final String company;
  @override
  final String time;

  factory _$ScheduleItem([void Function(ScheduleItemBuilder)? updates]) =>
      (new ScheduleItemBuilder()..update(updates))._build();

  _$ScheduleItem._({required this.company, required this.time}) : super._() {
    BuiltValueNullFieldError.checkNotNull(company, r'ScheduleItem', 'company');
    BuiltValueNullFieldError.checkNotNull(time, r'ScheduleItem', 'time');
  }

  @override
  ScheduleItem rebuild(void Function(ScheduleItemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ScheduleItemBuilder toBuilder() => new ScheduleItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ScheduleItem &&
        company == other.company &&
        time == other.time;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, company.hashCode);
    _$hash = $jc(_$hash, time.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ScheduleItem')
          ..add('company', company)
          ..add('time', time))
        .toString();
  }
}

class ScheduleItemBuilder
    implements Builder<ScheduleItem, ScheduleItemBuilder> {
  _$ScheduleItem? _$v;

  String? _company;
  String? get company => _$this._company;
  set company(String? company) => _$this._company = company;

  String? _time;
  String? get time => _$this._time;
  set time(String? time) => _$this._time = time;

  ScheduleItemBuilder();

  ScheduleItemBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _company = $v.company;
      _time = $v.time;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ScheduleItem other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ScheduleItem;
  }

  @override
  void update(void Function(ScheduleItemBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ScheduleItem build() => _build();

  _$ScheduleItem _build() {
    final _$result = _$v ??
        new _$ScheduleItem._(
          company: BuiltValueNullFieldError.checkNotNull(
              company, r'ScheduleItem', 'company'),
          time: BuiltValueNullFieldError.checkNotNull(
              time, r'ScheduleItem', 'time'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$Experience extends Experience {
  @override
  final String title;
  @override
  final String date;
  @override
  final String description;

  factory _$Experience([void Function(ExperienceBuilder)? updates]) =>
      (new ExperienceBuilder()..update(updates))._build();

  _$Experience._(
      {required this.title, required this.date, required this.description})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(title, r'Experience', 'title');
    BuiltValueNullFieldError.checkNotNull(date, r'Experience', 'date');
    BuiltValueNullFieldError.checkNotNull(
        description, r'Experience', 'description');
  }

  @override
  Experience rebuild(void Function(ExperienceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ExperienceBuilder toBuilder() => new ExperienceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Experience &&
        title == other.title &&
        date == other.date &&
        description == other.description;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, date.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Experience')
          ..add('title', title)
          ..add('date', date)
          ..add('description', description))
        .toString();
  }
}

class ExperienceBuilder implements Builder<Experience, ExperienceBuilder> {
  _$Experience? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _date;
  String? get date => _$this._date;
  set date(String? date) => _$this._date = date;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  ExperienceBuilder();

  ExperienceBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _date = $v.date;
      _description = $v.description;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Experience other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Experience;
  }

  @override
  void update(void Function(ExperienceBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Experience build() => _build();

  _$Experience _build() {
    final _$result = _$v ??
        new _$Experience._(
          title: BuiltValueNullFieldError.checkNotNull(
              title, r'Experience', 'title'),
          date: BuiltValueNullFieldError.checkNotNull(
              date, r'Experience', 'date'),
          description: BuiltValueNullFieldError.checkNotNull(
              description, r'Experience', 'description'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$Education extends Education {
  @override
  final String title;
  @override
  final String date;
  @override
  final String description;

  factory _$Education([void Function(EducationBuilder)? updates]) =>
      (new EducationBuilder()..update(updates))._build();

  _$Education._(
      {required this.title, required this.date, required this.description})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(title, r'Education', 'title');
    BuiltValueNullFieldError.checkNotNull(date, r'Education', 'date');
    BuiltValueNullFieldError.checkNotNull(
        description, r'Education', 'description');
  }

  @override
  Education rebuild(void Function(EducationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EducationBuilder toBuilder() => new EducationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Education &&
        title == other.title &&
        date == other.date &&
        description == other.description;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, date.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Education')
          ..add('title', title)
          ..add('date', date)
          ..add('description', description))
        .toString();
  }
}

class EducationBuilder implements Builder<Education, EducationBuilder> {
  _$Education? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _date;
  String? get date => _$this._date;
  set date(String? date) => _$this._date = date;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  EducationBuilder();

  EducationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _date = $v.date;
      _description = $v.description;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Education other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Education;
  }

  @override
  void update(void Function(EducationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Education build() => _build();

  _$Education _build() {
    final _$result = _$v ??
        new _$Education._(
          title: BuiltValueNullFieldError.checkNotNull(
              title, r'Education', 'title'),
          date:
              BuiltValueNullFieldError.checkNotNull(date, r'Education', 'date'),
          description: BuiltValueNullFieldError.checkNotNull(
              description, r'Education', 'description'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$Award extends Award {
  factory _$Award([void Function(AwardBuilder)? updates]) =>
      (new AwardBuilder()..update(updates))._build();

  _$Award._() : super._();

  @override
  Award rebuild(void Function(AwardBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AwardBuilder toBuilder() => new AwardBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Award;
  }

  @override
  int get hashCode {
    return 445454152;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'Award').toString();
  }
}

class AwardBuilder implements Builder<Award, AwardBuilder> {
  _$Award? _$v;

  AwardBuilder();

  @override
  void replace(Award other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Award;
  }

  @override
  void update(void Function(AwardBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Award build() => _build();

  _$Award _build() {
    final _$result = _$v ?? new _$Award._();
    replace(_$result);
    return _$result;
  }
}

class _$PriceItem extends PriceItem {
  @override
  final String productType;
  @override
  final String categId;
  @override
  final double serviceId;
  @override
  final double firstVisitPrice;
  @override
  final double revisitPrice;
  @override
  final double performancePercentage;
  @override
  final double perDividendRefer;
  @override
  final double serviceDuration;
  @override
  final String age;

  factory _$PriceItem([void Function(PriceItemBuilder)? updates]) =>
      (new PriceItemBuilder()..update(updates))._build();

  _$PriceItem._(
      {required this.productType,
      required this.categId,
      required this.serviceId,
      required this.firstVisitPrice,
      required this.revisitPrice,
      required this.performancePercentage,
      required this.perDividendRefer,
      required this.serviceDuration,
      required this.age})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        productType, r'PriceItem', 'productType');
    BuiltValueNullFieldError.checkNotNull(categId, r'PriceItem', 'categId');
    BuiltValueNullFieldError.checkNotNull(serviceId, r'PriceItem', 'serviceId');
    BuiltValueNullFieldError.checkNotNull(
        firstVisitPrice, r'PriceItem', 'firstVisitPrice');
    BuiltValueNullFieldError.checkNotNull(
        revisitPrice, r'PriceItem', 'revisitPrice');
    BuiltValueNullFieldError.checkNotNull(
        performancePercentage, r'PriceItem', 'performancePercentage');
    BuiltValueNullFieldError.checkNotNull(
        perDividendRefer, r'PriceItem', 'perDividendRefer');
    BuiltValueNullFieldError.checkNotNull(
        serviceDuration, r'PriceItem', 'serviceDuration');
    BuiltValueNullFieldError.checkNotNull(age, r'PriceItem', 'age');
  }

  @override
  PriceItem rebuild(void Function(PriceItemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PriceItemBuilder toBuilder() => new PriceItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PriceItem &&
        productType == other.productType &&
        categId == other.categId &&
        serviceId == other.serviceId &&
        firstVisitPrice == other.firstVisitPrice &&
        revisitPrice == other.revisitPrice &&
        performancePercentage == other.performancePercentage &&
        perDividendRefer == other.perDividendRefer &&
        serviceDuration == other.serviceDuration &&
        age == other.age;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, productType.hashCode);
    _$hash = $jc(_$hash, categId.hashCode);
    _$hash = $jc(_$hash, serviceId.hashCode);
    _$hash = $jc(_$hash, firstVisitPrice.hashCode);
    _$hash = $jc(_$hash, revisitPrice.hashCode);
    _$hash = $jc(_$hash, performancePercentage.hashCode);
    _$hash = $jc(_$hash, perDividendRefer.hashCode);
    _$hash = $jc(_$hash, serviceDuration.hashCode);
    _$hash = $jc(_$hash, age.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PriceItem')
          ..add('productType', productType)
          ..add('categId', categId)
          ..add('serviceId', serviceId)
          ..add('firstVisitPrice', firstVisitPrice)
          ..add('revisitPrice', revisitPrice)
          ..add('performancePercentage', performancePercentage)
          ..add('perDividendRefer', perDividendRefer)
          ..add('serviceDuration', serviceDuration)
          ..add('age', age))
        .toString();
  }
}

class PriceItemBuilder implements Builder<PriceItem, PriceItemBuilder> {
  _$PriceItem? _$v;

  String? _productType;
  String? get productType => _$this._productType;
  set productType(String? productType) => _$this._productType = productType;

  String? _categId;
  String? get categId => _$this._categId;
  set categId(String? categId) => _$this._categId = categId;

  double? _serviceId;
  double? get serviceId => _$this._serviceId;
  set serviceId(double? serviceId) => _$this._serviceId = serviceId;

  double? _firstVisitPrice;
  double? get firstVisitPrice => _$this._firstVisitPrice;
  set firstVisitPrice(double? firstVisitPrice) =>
      _$this._firstVisitPrice = firstVisitPrice;

  double? _revisitPrice;
  double? get revisitPrice => _$this._revisitPrice;
  set revisitPrice(double? revisitPrice) => _$this._revisitPrice = revisitPrice;

  double? _performancePercentage;
  double? get performancePercentage => _$this._performancePercentage;
  set performancePercentage(double? performancePercentage) =>
      _$this._performancePercentage = performancePercentage;

  double? _perDividendRefer;
  double? get perDividendRefer => _$this._perDividendRefer;
  set perDividendRefer(double? perDividendRefer) =>
      _$this._perDividendRefer = perDividendRefer;

  double? _serviceDuration;
  double? get serviceDuration => _$this._serviceDuration;
  set serviceDuration(double? serviceDuration) =>
      _$this._serviceDuration = serviceDuration;

  String? _age;
  String? get age => _$this._age;
  set age(String? age) => _$this._age = age;

  PriceItemBuilder();

  PriceItemBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _productType = $v.productType;
      _categId = $v.categId;
      _serviceId = $v.serviceId;
      _firstVisitPrice = $v.firstVisitPrice;
      _revisitPrice = $v.revisitPrice;
      _performancePercentage = $v.performancePercentage;
      _perDividendRefer = $v.perDividendRefer;
      _serviceDuration = $v.serviceDuration;
      _age = $v.age;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PriceItem other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PriceItem;
  }

  @override
  void update(void Function(PriceItemBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PriceItem build() => _build();

  _$PriceItem _build() {
    final _$result = _$v ??
        new _$PriceItem._(
          productType: BuiltValueNullFieldError.checkNotNull(
              productType, r'PriceItem', 'productType'),
          categId: BuiltValueNullFieldError.checkNotNull(
              categId, r'PriceItem', 'categId'),
          serviceId: BuiltValueNullFieldError.checkNotNull(
              serviceId, r'PriceItem', 'serviceId'),
          firstVisitPrice: BuiltValueNullFieldError.checkNotNull(
              firstVisitPrice, r'PriceItem', 'firstVisitPrice'),
          revisitPrice: BuiltValueNullFieldError.checkNotNull(
              revisitPrice, r'PriceItem', 'revisitPrice'),
          performancePercentage: BuiltValueNullFieldError.checkNotNull(
              performancePercentage, r'PriceItem', 'performancePercentage'),
          perDividendRefer: BuiltValueNullFieldError.checkNotNull(
              perDividendRefer, r'PriceItem', 'perDividendRefer'),
          serviceDuration: BuiltValueNullFieldError.checkNotNull(
              serviceDuration, r'PriceItem', 'serviceDuration'),
          age: BuiltValueNullFieldError.checkNotNull(age, r'PriceItem', 'age'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
