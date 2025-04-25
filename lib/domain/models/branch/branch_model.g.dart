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
Serializer<ContentModel> _$contentModelSerializer =
    new _$ContentModelSerializer();
Serializer<ChildContentModel> _$childContentModelSerializer =
    new _$ChildContentModelSerializer();
Serializer<MedionModel> _$medionModelSerializer = new _$MedionModelSerializer();
Serializer<OfferModel> _$offerModelSerializer = new _$OfferModelSerializer();

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
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
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
          result.workDays.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
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

class _$ContentModelSerializer implements StructuredSerializer<ContentModel> {
  @override
  final Iterable<Type> types = const [ContentModel, _$ContentModel];
  @override
  final String wireName = 'ContentModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, ContentModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'create_date',
      serializers.serialize(object.createDate,
          specifiedType: const FullType(String)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
      'link',
      serializers.serialize(object.link,
          specifiedType: const FullType(JsonObject)),
      'primary_image',
      serializers.serialize(object.primaryImage,
          specifiedType: const FullType(String)),
      'images',
      serializers.serialize(object.images,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'children',
      serializers.serialize(object.children,
          specifiedType: const FullType(
              BuiltList, const [const FullType(ChildContentModel)])),
    ];
    Object? value;
    value = object.discountCondition;
    if (value != null) {
      result
        ..add('discount_condition')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(JsonObject)));
    }
    value = object.discountLocation;
    if (value != null) {
      result
        ..add('discount_location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(JsonObject)));
    }
    value = object.discountStartDate;
    if (value != null) {
      result
        ..add('discount_start_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(JsonObject)));
    }
    value = object.discountEndDate;
    if (value != null) {
      result
        ..add('discount_end_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(JsonObject)));
    }
    value = object.phoneNumber;
    if (value != null) {
      result
        ..add('phone_number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(JsonObject)));
    }
    value = object.phoneNumberShort;
    if (value != null) {
      result
        ..add('phone_number_short')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(JsonObject)));
    }
    return result;
  }

  @override
  ContentModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ContentModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'create_date':
          result.createDate = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'link':
          result.link = serializers.deserialize(value,
              specifiedType: const FullType(JsonObject))! as JsonObject;
          break;
        case 'primary_image':
          result.primaryImage = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'images':
          result.images.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'children':
          result.children.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ChildContentModel)]))!
              as BuiltList<Object?>);
          break;
        case 'discount_condition':
          result.discountCondition = serializers.deserialize(value,
              specifiedType: const FullType(JsonObject)) as JsonObject?;
          break;
        case 'discount_location':
          result.discountLocation = serializers.deserialize(value,
              specifiedType: const FullType(JsonObject)) as JsonObject?;
          break;
        case 'discount_start_date':
          result.discountStartDate = serializers.deserialize(value,
              specifiedType: const FullType(JsonObject)) as JsonObject?;
          break;
        case 'discount_end_date':
          result.discountEndDate = serializers.deserialize(value,
              specifiedType: const FullType(JsonObject)) as JsonObject?;
          break;
        case 'phone_number':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(JsonObject)) as JsonObject?;
          break;
        case 'phone_number_short':
          result.phoneNumberShort = serializers.deserialize(value,
              specifiedType: const FullType(JsonObject)) as JsonObject?;
          break;
      }
    }

    return result.build();
  }
}

class _$ChildContentModelSerializer
    implements StructuredSerializer<ChildContentModel> {
  @override
  final Iterable<Type> types = const [ChildContentModel, _$ChildContentModel];
  @override
  final String wireName = 'ChildContentModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, ChildContentModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
      'primary_image',
      serializers.serialize(object.primaryImage,
          specifiedType: const FullType(String)),
      'create_date',
      serializers.serialize(object.createDate,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  ChildContentModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ChildContentModelBuilder();

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
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'primary_image':
          result.primaryImage = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'create_date':
          result.createDate = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$MedionModelSerializer implements StructuredSerializer<MedionModel> {
  @override
  final Iterable<Type> types = const [MedionModel, _$MedionModel];
  @override
  final String wireName = 'MedionModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, MedionModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
      'about',
      serializers.serialize(object.about,
          specifiedType: const FullType(String)),
      'history',
      serializers.serialize(object.history,
          specifiedType: const FullType(String)),
      'mission',
      serializers.serialize(object.mission,
          specifiedType: const FullType(String)),
      'licenses',
      serializers.serialize(object.licenses,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
    ];

    return result;
  }

  @override
  MedionModel deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MedionModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'about':
          result.about = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'history':
          result.history = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'mission':
          result.mission = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'licenses':
          result.licenses.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$OfferModelSerializer implements StructuredSerializer<OfferModel> {
  @override
  final Iterable<Type> types = const [OfferModel, _$OfferModel];
  @override
  final String wireName = 'OfferModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, OfferModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'offerta',
      serializers.serialize(object.offerta,
          specifiedType: const FullType(String)),
      'company_name',
      serializers.serialize(object.companyName,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  OfferModel deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OfferModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'offerta':
          result.offerta = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'company_name':
          result.companyName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
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
  final BuiltList<String>? workDays;
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

  ListBuilder<String>? _workDays;
  ListBuilder<String> get workDays =>
      _$this._workDays ??= new ListBuilder<String>();
  set workDays(ListBuilder<String>? workDays) => _$this._workDays = workDays;

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
      _workDays = $v.workDays?.toBuilder();
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
    _$BranchModel _$result;
    try {
      _$result = _$v ??
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
            workDays: _workDays?.build(),
            description: description,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'workDays';
        _workDays?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'BranchModel', _$failedField, e.toString());
      }
      rethrow;
    }
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

class _$ContentModel extends ContentModel {
  @override
  final String type;
  @override
  final int id;
  @override
  final String createDate;
  @override
  final String title;
  @override
  final String description;
  @override
  final JsonObject link;
  @override
  final String primaryImage;
  @override
  final BuiltList<String> images;
  @override
  final BuiltList<ChildContentModel> children;
  @override
  final JsonObject? discountCondition;
  @override
  final JsonObject? discountLocation;
  @override
  final JsonObject? discountStartDate;
  @override
  final JsonObject? discountEndDate;
  @override
  final JsonObject? phoneNumber;
  @override
  final JsonObject? phoneNumberShort;

  factory _$ContentModel([void Function(ContentModelBuilder)? updates]) =>
      (new ContentModelBuilder()..update(updates))._build();

  _$ContentModel._(
      {required this.type,
      required this.id,
      required this.createDate,
      required this.title,
      required this.description,
      required this.link,
      required this.primaryImage,
      required this.images,
      required this.children,
      this.discountCondition,
      this.discountLocation,
      this.discountStartDate,
      this.discountEndDate,
      this.phoneNumber,
      this.phoneNumberShort})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(type, r'ContentModel', 'type');
    BuiltValueNullFieldError.checkNotNull(id, r'ContentModel', 'id');
    BuiltValueNullFieldError.checkNotNull(
        createDate, r'ContentModel', 'createDate');
    BuiltValueNullFieldError.checkNotNull(title, r'ContentModel', 'title');
    BuiltValueNullFieldError.checkNotNull(
        description, r'ContentModel', 'description');
    BuiltValueNullFieldError.checkNotNull(link, r'ContentModel', 'link');
    BuiltValueNullFieldError.checkNotNull(
        primaryImage, r'ContentModel', 'primaryImage');
    BuiltValueNullFieldError.checkNotNull(images, r'ContentModel', 'images');
    BuiltValueNullFieldError.checkNotNull(
        children, r'ContentModel', 'children');
  }

  @override
  ContentModel rebuild(void Function(ContentModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ContentModelBuilder toBuilder() => new ContentModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ContentModel &&
        type == other.type &&
        id == other.id &&
        createDate == other.createDate &&
        title == other.title &&
        description == other.description &&
        link == other.link &&
        primaryImage == other.primaryImage &&
        images == other.images &&
        children == other.children &&
        discountCondition == other.discountCondition &&
        discountLocation == other.discountLocation &&
        discountStartDate == other.discountStartDate &&
        discountEndDate == other.discountEndDate &&
        phoneNumber == other.phoneNumber &&
        phoneNumberShort == other.phoneNumberShort;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, createDate.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, link.hashCode);
    _$hash = $jc(_$hash, primaryImage.hashCode);
    _$hash = $jc(_$hash, images.hashCode);
    _$hash = $jc(_$hash, children.hashCode);
    _$hash = $jc(_$hash, discountCondition.hashCode);
    _$hash = $jc(_$hash, discountLocation.hashCode);
    _$hash = $jc(_$hash, discountStartDate.hashCode);
    _$hash = $jc(_$hash, discountEndDate.hashCode);
    _$hash = $jc(_$hash, phoneNumber.hashCode);
    _$hash = $jc(_$hash, phoneNumberShort.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ContentModel')
          ..add('type', type)
          ..add('id', id)
          ..add('createDate', createDate)
          ..add('title', title)
          ..add('description', description)
          ..add('link', link)
          ..add('primaryImage', primaryImage)
          ..add('images', images)
          ..add('children', children)
          ..add('discountCondition', discountCondition)
          ..add('discountLocation', discountLocation)
          ..add('discountStartDate', discountStartDate)
          ..add('discountEndDate', discountEndDate)
          ..add('phoneNumber', phoneNumber)
          ..add('phoneNumberShort', phoneNumberShort))
        .toString();
  }
}

class ContentModelBuilder
    implements Builder<ContentModel, ContentModelBuilder> {
  _$ContentModel? _$v;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _createDate;
  String? get createDate => _$this._createDate;
  set createDate(String? createDate) => _$this._createDate = createDate;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  JsonObject? _link;
  JsonObject? get link => _$this._link;
  set link(JsonObject? link) => _$this._link = link;

  String? _primaryImage;
  String? get primaryImage => _$this._primaryImage;
  set primaryImage(String? primaryImage) => _$this._primaryImage = primaryImage;

  ListBuilder<String>? _images;
  ListBuilder<String> get images =>
      _$this._images ??= new ListBuilder<String>();
  set images(ListBuilder<String>? images) => _$this._images = images;

  ListBuilder<ChildContentModel>? _children;
  ListBuilder<ChildContentModel> get children =>
      _$this._children ??= new ListBuilder<ChildContentModel>();
  set children(ListBuilder<ChildContentModel>? children) =>
      _$this._children = children;

  JsonObject? _discountCondition;
  JsonObject? get discountCondition => _$this._discountCondition;
  set discountCondition(JsonObject? discountCondition) =>
      _$this._discountCondition = discountCondition;

  JsonObject? _discountLocation;
  JsonObject? get discountLocation => _$this._discountLocation;
  set discountLocation(JsonObject? discountLocation) =>
      _$this._discountLocation = discountLocation;

  JsonObject? _discountStartDate;
  JsonObject? get discountStartDate => _$this._discountStartDate;
  set discountStartDate(JsonObject? discountStartDate) =>
      _$this._discountStartDate = discountStartDate;

  JsonObject? _discountEndDate;
  JsonObject? get discountEndDate => _$this._discountEndDate;
  set discountEndDate(JsonObject? discountEndDate) =>
      _$this._discountEndDate = discountEndDate;

  JsonObject? _phoneNumber;
  JsonObject? get phoneNumber => _$this._phoneNumber;
  set phoneNumber(JsonObject? phoneNumber) => _$this._phoneNumber = phoneNumber;

  JsonObject? _phoneNumberShort;
  JsonObject? get phoneNumberShort => _$this._phoneNumberShort;
  set phoneNumberShort(JsonObject? phoneNumberShort) =>
      _$this._phoneNumberShort = phoneNumberShort;

  ContentModelBuilder();

  ContentModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _type = $v.type;
      _id = $v.id;
      _createDate = $v.createDate;
      _title = $v.title;
      _description = $v.description;
      _link = $v.link;
      _primaryImage = $v.primaryImage;
      _images = $v.images.toBuilder();
      _children = $v.children.toBuilder();
      _discountCondition = $v.discountCondition;
      _discountLocation = $v.discountLocation;
      _discountStartDate = $v.discountStartDate;
      _discountEndDate = $v.discountEndDate;
      _phoneNumber = $v.phoneNumber;
      _phoneNumberShort = $v.phoneNumberShort;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ContentModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ContentModel;
  }

  @override
  void update(void Function(ContentModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ContentModel build() => _build();

  _$ContentModel _build() {
    _$ContentModel _$result;
    try {
      _$result = _$v ??
          new _$ContentModel._(
            type: BuiltValueNullFieldError.checkNotNull(
                type, r'ContentModel', 'type'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'ContentModel', 'id'),
            createDate: BuiltValueNullFieldError.checkNotNull(
                createDate, r'ContentModel', 'createDate'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'ContentModel', 'title'),
            description: BuiltValueNullFieldError.checkNotNull(
                description, r'ContentModel', 'description'),
            link: BuiltValueNullFieldError.checkNotNull(
                link, r'ContentModel', 'link'),
            primaryImage: BuiltValueNullFieldError.checkNotNull(
                primaryImage, r'ContentModel', 'primaryImage'),
            images: images.build(),
            children: children.build(),
            discountCondition: discountCondition,
            discountLocation: discountLocation,
            discountStartDate: discountStartDate,
            discountEndDate: discountEndDate,
            phoneNumber: phoneNumber,
            phoneNumberShort: phoneNumberShort,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'images';
        images.build();
        _$failedField = 'children';
        children.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ContentModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ChildContentModel extends ChildContentModel {
  @override
  final int id;
  @override
  final String title;
  @override
  final String description;
  @override
  final String primaryImage;
  @override
  final String createDate;

  factory _$ChildContentModel(
          [void Function(ChildContentModelBuilder)? updates]) =>
      (new ChildContentModelBuilder()..update(updates))._build();

  _$ChildContentModel._(
      {required this.id,
      required this.title,
      required this.description,
      required this.primaryImage,
      required this.createDate})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'ChildContentModel', 'id');
    BuiltValueNullFieldError.checkNotNull(title, r'ChildContentModel', 'title');
    BuiltValueNullFieldError.checkNotNull(
        description, r'ChildContentModel', 'description');
    BuiltValueNullFieldError.checkNotNull(
        primaryImage, r'ChildContentModel', 'primaryImage');
    BuiltValueNullFieldError.checkNotNull(
        createDate, r'ChildContentModel', 'createDate');
  }

  @override
  ChildContentModel rebuild(void Function(ChildContentModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChildContentModelBuilder toBuilder() =>
      new ChildContentModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChildContentModel &&
        id == other.id &&
        title == other.title &&
        description == other.description &&
        primaryImage == other.primaryImage &&
        createDate == other.createDate;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, primaryImage.hashCode);
    _$hash = $jc(_$hash, createDate.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ChildContentModel')
          ..add('id', id)
          ..add('title', title)
          ..add('description', description)
          ..add('primaryImage', primaryImage)
          ..add('createDate', createDate))
        .toString();
  }
}

class ChildContentModelBuilder
    implements Builder<ChildContentModel, ChildContentModelBuilder> {
  _$ChildContentModel? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _primaryImage;
  String? get primaryImage => _$this._primaryImage;
  set primaryImage(String? primaryImage) => _$this._primaryImage = primaryImage;

  String? _createDate;
  String? get createDate => _$this._createDate;
  set createDate(String? createDate) => _$this._createDate = createDate;

  ChildContentModelBuilder();

  ChildContentModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _title = $v.title;
      _description = $v.description;
      _primaryImage = $v.primaryImage;
      _createDate = $v.createDate;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChildContentModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChildContentModel;
  }

  @override
  void update(void Function(ChildContentModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChildContentModel build() => _build();

  _$ChildContentModel _build() {
    final _$result = _$v ??
        new _$ChildContentModel._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'ChildContentModel', 'id'),
          title: BuiltValueNullFieldError.checkNotNull(
              title, r'ChildContentModel', 'title'),
          description: BuiltValueNullFieldError.checkNotNull(
              description, r'ChildContentModel', 'description'),
          primaryImage: BuiltValueNullFieldError.checkNotNull(
              primaryImage, r'ChildContentModel', 'primaryImage'),
          createDate: BuiltValueNullFieldError.checkNotNull(
              createDate, r'ChildContentModel', 'createDate'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$MedionModel extends MedionModel {
  @override
  final String name;
  @override
  final String description;
  @override
  final String about;
  @override
  final String history;
  @override
  final String mission;
  @override
  final BuiltList<String> licenses;

  factory _$MedionModel([void Function(MedionModelBuilder)? updates]) =>
      (new MedionModelBuilder()..update(updates))._build();

  _$MedionModel._(
      {required this.name,
      required this.description,
      required this.about,
      required this.history,
      required this.mission,
      required this.licenses})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'MedionModel', 'name');
    BuiltValueNullFieldError.checkNotNull(
        description, r'MedionModel', 'description');
    BuiltValueNullFieldError.checkNotNull(about, r'MedionModel', 'about');
    BuiltValueNullFieldError.checkNotNull(history, r'MedionModel', 'history');
    BuiltValueNullFieldError.checkNotNull(mission, r'MedionModel', 'mission');
    BuiltValueNullFieldError.checkNotNull(licenses, r'MedionModel', 'licenses');
  }

  @override
  MedionModel rebuild(void Function(MedionModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MedionModelBuilder toBuilder() => new MedionModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MedionModel &&
        name == other.name &&
        description == other.description &&
        about == other.about &&
        history == other.history &&
        mission == other.mission &&
        licenses == other.licenses;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, about.hashCode);
    _$hash = $jc(_$hash, history.hashCode);
    _$hash = $jc(_$hash, mission.hashCode);
    _$hash = $jc(_$hash, licenses.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MedionModel')
          ..add('name', name)
          ..add('description', description)
          ..add('about', about)
          ..add('history', history)
          ..add('mission', mission)
          ..add('licenses', licenses))
        .toString();
  }
}

class MedionModelBuilder implements Builder<MedionModel, MedionModelBuilder> {
  _$MedionModel? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _about;
  String? get about => _$this._about;
  set about(String? about) => _$this._about = about;

  String? _history;
  String? get history => _$this._history;
  set history(String? history) => _$this._history = history;

  String? _mission;
  String? get mission => _$this._mission;
  set mission(String? mission) => _$this._mission = mission;

  ListBuilder<String>? _licenses;
  ListBuilder<String> get licenses =>
      _$this._licenses ??= new ListBuilder<String>();
  set licenses(ListBuilder<String>? licenses) => _$this._licenses = licenses;

  MedionModelBuilder();

  MedionModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _description = $v.description;
      _about = $v.about;
      _history = $v.history;
      _mission = $v.mission;
      _licenses = $v.licenses.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MedionModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MedionModel;
  }

  @override
  void update(void Function(MedionModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MedionModel build() => _build();

  _$MedionModel _build() {
    _$MedionModel _$result;
    try {
      _$result = _$v ??
          new _$MedionModel._(
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'MedionModel', 'name'),
            description: BuiltValueNullFieldError.checkNotNull(
                description, r'MedionModel', 'description'),
            about: BuiltValueNullFieldError.checkNotNull(
                about, r'MedionModel', 'about'),
            history: BuiltValueNullFieldError.checkNotNull(
                history, r'MedionModel', 'history'),
            mission: BuiltValueNullFieldError.checkNotNull(
                mission, r'MedionModel', 'mission'),
            licenses: licenses.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'licenses';
        licenses.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'MedionModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$OfferModel extends OfferModel {
  @override
  final String offerta;
  @override
  final String companyName;

  factory _$OfferModel([void Function(OfferModelBuilder)? updates]) =>
      (new OfferModelBuilder()..update(updates))._build();

  _$OfferModel._({required this.offerta, required this.companyName})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(offerta, r'OfferModel', 'offerta');
    BuiltValueNullFieldError.checkNotNull(
        companyName, r'OfferModel', 'companyName');
  }

  @override
  OfferModel rebuild(void Function(OfferModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OfferModelBuilder toBuilder() => new OfferModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OfferModel &&
        offerta == other.offerta &&
        companyName == other.companyName;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, offerta.hashCode);
    _$hash = $jc(_$hash, companyName.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OfferModel')
          ..add('offerta', offerta)
          ..add('companyName', companyName))
        .toString();
  }
}

class OfferModelBuilder implements Builder<OfferModel, OfferModelBuilder> {
  _$OfferModel? _$v;

  String? _offerta;
  String? get offerta => _$this._offerta;
  set offerta(String? offerta) => _$this._offerta = offerta;

  String? _companyName;
  String? get companyName => _$this._companyName;
  set companyName(String? companyName) => _$this._companyName = companyName;

  OfferModelBuilder();

  OfferModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _offerta = $v.offerta;
      _companyName = $v.companyName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OfferModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OfferModel;
  }

  @override
  void update(void Function(OfferModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OfferModel build() => _build();

  _$OfferModel _build() {
    final _$result = _$v ??
        new _$OfferModel._(
          offerta: BuiltValueNullFieldError.checkNotNull(
              offerta, r'OfferModel', 'offerta'),
          companyName: BuiltValueNullFieldError.checkNotNull(
              companyName, r'OfferModel', 'companyName'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$PrivacyModel extends PrivacyModel {
  @override
  final String? privacy;
  @override
  final String companyName;

  factory _$PrivacyModel([void Function(PrivacyModelBuilder)? updates]) =>
      (new PrivacyModelBuilder()..update(updates))._build();

  _$PrivacyModel._({this.privacy, required this.companyName}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        companyName, r'PrivacyModel', 'companyName');
  }

  @override
  PrivacyModel rebuild(void Function(PrivacyModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PrivacyModelBuilder toBuilder() => new PrivacyModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PrivacyModel &&
        privacy == other.privacy &&
        companyName == other.companyName;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, privacy.hashCode);
    _$hash = $jc(_$hash, companyName.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PrivacyModel')
          ..add('privacy', privacy)
          ..add('companyName', companyName))
        .toString();
  }
}

class PrivacyModelBuilder
    implements Builder<PrivacyModel, PrivacyModelBuilder> {
  _$PrivacyModel? _$v;

  String? _privacy;
  String? get privacy => _$this._privacy;
  set privacy(String? privacy) => _$this._privacy = privacy;

  String? _companyName;
  String? get companyName => _$this._companyName;
  set companyName(String? companyName) => _$this._companyName = companyName;

  PrivacyModelBuilder();

  PrivacyModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _privacy = $v.privacy;
      _companyName = $v.companyName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PrivacyModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PrivacyModel;
  }

  @override
  void update(void Function(PrivacyModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PrivacyModel build() => _build();

  _$PrivacyModel _build() {
    final _$result = _$v ??
        new _$PrivacyModel._(
          privacy: privacy,
          companyName: BuiltValueNullFieldError.checkNotNull(
              companyName, r'PrivacyModel', 'companyName'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
