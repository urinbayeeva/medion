// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DoctorCategory> _$doctorCategorySerializer =
    _$DoctorCategorySerializer();
Serializer<DoctorData> _$doctorDataSerializer = _$DoctorDataSerializer();
Serializer<Discount> _$discountSerializer = _$DiscountSerializer();
Serializer<ModelDoctor> _$modelDoctorSerializer = _$ModelDoctorSerializer();
Serializer<WorkSchedule> _$workScheduleSerializer = _$WorkScheduleSerializer();
Serializer<ScheduleItem> _$scheduleItemSerializer = _$ScheduleItemSerializer();
Serializer<DoctorReview> _$doctorReviewSerializer = _$DoctorReviewSerializer();
Serializer<GalleryItems> _$galleryItemsSerializer = _$GalleryItemsSerializer();
Serializer<Articles> _$articlesSerializer = _$ArticlesSerializer();
Serializer<DoctorInfoDetails> _$doctorInfoDetailsSerializer =
    _$DoctorInfoDetailsSerializer();
Serializer<PriceItem> _$priceItemSerializer = _$PriceItemSerializer();
Serializer<DoctorsJob> _$doctorsJobSerializer = _$DoctorsJobSerializer();

class _$DoctorCategorySerializer
    implements StructuredSerializer<DoctorCategory> {
  @override
  final Iterable<Type> types = const [DoctorCategory, _$DoctorCategory];
  @override
  final String wireName = 'DoctorCategory';

  @override
  Iterable<Object?> serialize(Serializers serializers, DoctorCategory object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.doctorData;
    if (value != null) {
      result
        ..add('doctors')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(DoctorData)])));
    }
    return result;
  }

  @override
  DoctorCategory deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = DoctorCategoryBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'doctors':
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
      'category_ids',
      serializers.serialize(object.categoryIds,
          specifiedType:
              const FullType(BuiltList, const [const FullType(int)])),
    ];
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
            specifiedType: const FullType(JsonObject)));
    }
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
        ..add('job_name')
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
    value = object.hasDiscount;
    if (value != null) {
      result
        ..add('has_discount')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  DoctorData deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = DoctorDataBuilder();

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
              specifiedType: const FullType(JsonObject)) as JsonObject?;
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
        case 'job_name':
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
        case 'has_discount':
          result.hasDiscount = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
      }
    }

    return result.build();
  }
}

class _$DiscountSerializer implements StructuredSerializer<Discount> {
  @override
  final Iterable<Type> types = const [Discount, _$Discount];
  @override
  final String wireName = 'Discount';

  @override
  Iterable<Object?> serialize(Serializers serializers, Discount object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
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
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.discountEndDate;
    if (value != null) {
      result
        ..add('discount_end_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Discount deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = DiscountBuilder();

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
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'discount_end_date':
          result.discountEndDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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
      'has_discount',
      serializers.serialize(object.hasDiscount,
          specifiedType: const FullType(bool)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'background_image_url',
      serializers.serialize(object.backgroundImageUrl,
          specifiedType: const FullType(String)),
      'image',
      serializers.serialize(object.image,
          specifiedType: const FullType(String)),
      'work_schedule',
      serializers.serialize(object.workSchedule,
          specifiedType: const FullType(WorkSchedule)),
      'experience',
      serializers.serialize(object.experience,
          specifiedType: const FullType(
              BuiltList, const [const FullType(DoctorInfoDetails)])),
      'articles',
      serializers.serialize(object.articles,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Articles)])),
      'gallery_items',
      serializers.serialize(object.galleryItems,
          specifiedType:
              const FullType(BuiltList, const [const FullType(GalleryItems)])),
      'specializations',
      serializers.serialize(object.specializations,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'education',
      serializers.serialize(object.education,
          specifiedType: const FullType(
              BuiltList, const [const FullType(DoctorInfoDetails)])),
      'discounts',
      serializers.serialize(object.discount,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Discount)])),
      'award',
      serializers.serialize(object.award,
          specifiedType: const FullType(
              BuiltList, const [const FullType(DoctorInfoDetails)])),
      'price_list',
      serializers.serialize(object.priceList,
          specifiedType:
              const FullType(BuiltList, const [const FullType(PriceItem)])),
      'service_price_list',
      serializers.serialize(object.servicePriceList,
          specifiedType: const FullType(JsonObject)),
      'academic_rank',
      serializers.serialize(object.academicRank,
          specifiedType: const FullType(JsonObject)),
      'reviews',
      serializers.serialize(object.reviews,
          specifiedType:
              const FullType(BuiltList, const [const FullType(DoctorReview)])),
    ];
    Object? value;
    value = object.experienceYear;
    if (value != null) {
      result
        ..add('experience_year')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.isThereFreeTime;
    if (value != null) {
      result
        ..add('is_there_free_time')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.canPatientAccept;
    if (value != null) {
      result
        ..add('can_patient_accept')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.shortDesc;
    if (value != null) {
      result
        ..add('short_desc')
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
    value = object.jobName;
    if (value != null) {
      result
        ..add('job_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.jobId;
    if (value != null) {
      result
        ..add('job_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  ModelDoctor deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ModelDoctorBuilder();

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
        case 'experience_year':
          result.experienceYear = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'is_there_free_time':
          result.isThereFreeTime = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'can_patient_accept':
          result.canPatientAccept = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'has_discount':
          result.hasDiscount = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'background_image_url':
          result.backgroundImageUrl = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'short_desc':
          result.shortDesc = serializers.deserialize(value,
              specifiedType: const FullType(JsonObject)) as JsonObject?;
          break;
        case 'work_schedule':
          result.workSchedule.replace(serializers.deserialize(value,
              specifiedType: const FullType(WorkSchedule))! as WorkSchedule);
          break;
        case 'experience':
          result.experience.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(DoctorInfoDetails)]))!
              as BuiltList<Object?>);
          break;
        case 'articles':
          result.articles.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Articles)]))!
              as BuiltList<Object?>);
          break;
        case 'gallery_items':
          result.galleryItems.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(GalleryItems)]))!
              as BuiltList<Object?>);
          break;
        case 'specializations':
          result.specializations.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'education':
          result.education.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(DoctorInfoDetails)]))!
              as BuiltList<Object?>);
          break;
        case 'discounts':
          result.discount.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Discount)]))!
              as BuiltList<Object?>);
          break;
        case 'award':
          result.award.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(DoctorInfoDetails)]))!
              as BuiltList<Object?>);
          break;
        case 'gender':
          result.gender = serializers.deserialize(value,
              specifiedType: const FullType(JsonObject)) as JsonObject?;
          break;
        case 'job_name':
          result.jobName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'job_id':
          result.jobId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'price_list':
          result.priceList.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(PriceItem)]))!
              as BuiltList<Object?>);
          break;
        case 'service_price_list':
          result.servicePriceList = serializers.deserialize(value,
              specifiedType: const FullType(JsonObject))! as JsonObject;
          break;
        case 'academic_rank':
          result.academicRank = serializers.deserialize(value,
              specifiedType: const FullType(JsonObject))! as JsonObject;
          break;
        case 'reviews':
          result.reviews.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(DoctorReview)]))!
              as BuiltList<Object?>);
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
      'Sunday',
      serializers.serialize(object.sunday,
          specifiedType:
              const FullType(BuiltList, const [const FullType(ScheduleItem)])),
    ];

    return result;
  }

  @override
  WorkSchedule deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = WorkScheduleBuilder();

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
        case 'Sunday':
          result.sunday.replace(serializers.deserialize(value,
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
          specifiedType: const FullType(JsonObject)),
      'time',
      serializers.serialize(object.time,
          specifiedType: const FullType(JsonObject)),
    ];

    return result;
  }

  @override
  ScheduleItem deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ScheduleItemBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'company':
          result.company = serializers.deserialize(value,
              specifiedType: const FullType(JsonObject))! as JsonObject;
          break;
        case 'time':
          result.time = serializers.deserialize(value,
              specifiedType: const FullType(JsonObject))! as JsonObject;
          break;
      }
    }

    return result.build();
  }
}

class _$DoctorReviewSerializer implements StructuredSerializer<DoctorReview> {
  @override
  final Iterable<Type> types = const [DoctorReview, _$DoctorReview];
  @override
  final String wireName = 'DoctorReview';

  @override
  Iterable<Object?> serialize(Serializers serializers, DoctorReview object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.ratings;
    if (value != null) {
      result
        ..add('ratings')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.review;
    if (value != null) {
      result
        ..add('review')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.companyId;
    if (value != null) {
      result
        ..add('company_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.companyName;
    if (value != null) {
      result
        ..add('company_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.companyLogoUrl;
    if (value != null) {
      result
        ..add('company_logo_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.state;
    if (value != null) {
      result
        ..add('state')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.integratorLogoUrl;
    if (value != null) {
      result
        ..add('integrator_logo_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.doctorId;
    if (value != null) {
      result
        ..add('doctor_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.createDate;
    if (value != null) {
      result
        ..add('create_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.location;
    if (value != null) {
      result
        ..add('location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.patientName;
    if (value != null) {
      result
        ..add('patient_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  DoctorReview deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = DoctorReviewBuilder();

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
        case 'ratings':
          result.ratings = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'review':
          result.review = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'company_id':
          result.companyId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'company_name':
          result.companyName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'company_logo_url':
          result.companyLogoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'state':
          result.state = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'integrator_logo_url':
          result.integratorLogoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'doctor_id':
          result.doctorId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'create_date':
          result.createDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'patient_name':
          result.patientName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GalleryItemsSerializer implements StructuredSerializer<GalleryItems> {
  @override
  final Iterable<Type> types = const [GalleryItems, _$GalleryItems];
  @override
  final String wireName = 'GalleryItems';

  @override
  Iterable<Object?> serialize(Serializers serializers, GalleryItems object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
      'file_name',
      serializers.serialize(object.fileName,
          specifiedType: const FullType(String)),
      'video_image',
      serializers.serialize(object.videoImage,
          specifiedType: const FullType(String)),
      'file_url',
      serializers.serialize(object.fileUrl,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GalleryItems deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GalleryItemsBuilder();

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
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'file_name':
          result.fileName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'video_image':
          result.videoImage = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'file_url':
          result.fileUrl = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ArticlesSerializer implements StructuredSerializer<Articles> {
  @override
  final Iterable<Type> types = const [Articles, _$Articles];
  @override
  final String wireName = 'Articles';

  @override
  Iterable<Object?> serialize(Serializers serializers, Articles object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
      'primary_image',
      serializers.serialize(object.primaryImage,
          specifiedType: const FullType(String)),
      'images',
      serializers.serialize(object.images,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
    ];

    return result;
  }

  @override
  Articles deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ArticlesBuilder();

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
        case 'type':
          result.type = serializers.deserialize(value,
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
      }
    }

    return result.build();
  }
}

class _$DoctorInfoDetailsSerializer
    implements StructuredSerializer<DoctorInfoDetails> {
  @override
  final Iterable<Type> types = const [DoctorInfoDetails, _$DoctorInfoDetails];
  @override
  final String wireName = 'DoctorInfoDetails';

  @override
  Iterable<Object?> serialize(Serializers serializers, DoctorInfoDetails object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'description',
      serializers.serialize(object.description,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
    ];
    Object? value;
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.date;
    if (value != null) {
      result
        ..add('date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.icon;
    if (value != null) {
      result
        ..add('icon')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.educationDegree;
    if (value != null) {
      result
        ..add('education_degree')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.certificateSeries;
    if (value != null) {
      result
        ..add('certificate_series')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.certificateFileUrl;
    if (value != null) {
      result
        ..add('certificate_file_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  DoctorInfoDetails deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = DoctorInfoDetailsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'icon':
          result.icon = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'education_degree':
          result.educationDegree = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'certificate_series':
          result.certificateSeries = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'certificate_file_url':
          result.certificateFileUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
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
          specifiedType: const FullType(JsonObject)),
      'categ_id',
      serializers.serialize(object.categId,
          specifiedType: const FullType(String)),
      'service_id',
      serializers.serialize(object.serviceId,
          specifiedType: const FullType(int)),
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
      serializers.serialize(object.age,
          specifiedType: const FullType(JsonObject)),
    ];

    return result;
  }

  @override
  PriceItem deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = PriceItemBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'product_type':
          result.productType = serializers.deserialize(value,
              specifiedType: const FullType(JsonObject))! as JsonObject;
          break;
        case 'categ_id':
          result.categId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'service_id':
          result.serviceId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
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
              specifiedType: const FullType(JsonObject))! as JsonObject;
          break;
      }
    }

    return result.build();
  }
}

class _$DoctorsJobSerializer implements StructuredSerializer<DoctorsJob> {
  @override
  final Iterable<Type> types = const [DoctorsJob, _$DoctorsJob];
  @override
  final String wireName = 'DoctorsJob';

  @override
  Iterable<Object?> serialize(Serializers serializers, DoctorsJob object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  DoctorsJob deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = DoctorsJobBuilder();

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
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$DoctorCategory extends DoctorCategory {
  @override
  final BuiltList<DoctorData>? doctorData;

  factory _$DoctorCategory([void Function(DoctorCategoryBuilder)? updates]) =>
      (DoctorCategoryBuilder()..update(updates))._build();

  _$DoctorCategory._({this.doctorData}) : super._();
  @override
  DoctorCategory rebuild(void Function(DoctorCategoryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DoctorCategoryBuilder toBuilder() => DoctorCategoryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DoctorCategory && doctorData == other.doctorData;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, doctorData.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DoctorCategory')
          ..add('doctorData', doctorData))
        .toString();
  }
}

class DoctorCategoryBuilder
    implements Builder<DoctorCategory, DoctorCategoryBuilder> {
  _$DoctorCategory? _$v;

  ListBuilder<DoctorData>? _doctorData;
  ListBuilder<DoctorData> get doctorData =>
      _$this._doctorData ??= ListBuilder<DoctorData>();
  set doctorData(ListBuilder<DoctorData>? doctorData) =>
      _$this._doctorData = doctorData;

  DoctorCategoryBuilder();

  DoctorCategoryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _doctorData = $v.doctorData?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DoctorCategory other) {
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
          _$DoctorCategory._(
            doctorData: _doctorData?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'doctorData';
        _doctorData?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
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
  final int? id;
  @override
  final JsonObject? name;
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
  @override
  final bool? hasDiscount;

  factory _$DoctorData([void Function(DoctorDataBuilder)? updates]) =>
      (DoctorDataBuilder()..update(updates))._build();

  _$DoctorData._(
      {this.id,
      this.name,
      this.infoDescription,
      this.workMobbile,
      this.workPhone,
      this.gender,
      required this.categoryIds,
      this.specialty,
      this.image,
      this.academicRank,
      this.workExperience,
      this.hasDiscount})
      : super._();
  @override
  DoctorData rebuild(void Function(DoctorDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DoctorDataBuilder toBuilder() => DoctorDataBuilder()..replace(this);

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
        workExperience == other.workExperience &&
        hasDiscount == other.hasDiscount;
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
    _$hash = $jc(_$hash, hasDiscount.hashCode);
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
          ..add('workExperience', workExperience)
          ..add('hasDiscount', hasDiscount))
        .toString();
  }
}

class DoctorDataBuilder implements Builder<DoctorData, DoctorDataBuilder> {
  _$DoctorData? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  JsonObject? _name;
  JsonObject? get name => _$this._name;
  set name(JsonObject? name) => _$this._name = name;

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
      _$this._categoryIds ??= ListBuilder<int>();
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

  bool? _hasDiscount;
  bool? get hasDiscount => _$this._hasDiscount;
  set hasDiscount(bool? hasDiscount) => _$this._hasDiscount = hasDiscount;

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
      _hasDiscount = $v.hasDiscount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DoctorData other) {
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
          _$DoctorData._(
            id: id,
            name: name,
            infoDescription: infoDescription,
            workMobbile: workMobbile,
            workPhone: workPhone,
            gender: gender,
            categoryIds: categoryIds.build(),
            specialty: specialty,
            image: image,
            academicRank: academicRank,
            workExperience: workExperience,
            hasDiscount: hasDiscount,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'categoryIds';
        categoryIds.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'DoctorData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Discount extends Discount {
  @override
  final int? id;
  @override
  final String? title;
  @override
  final String? image;
  @override
  final String? discountEndDate;

  factory _$Discount([void Function(DiscountBuilder)? updates]) =>
      (DiscountBuilder()..update(updates))._build();

  _$Discount._({this.id, this.title, this.image, this.discountEndDate})
      : super._();
  @override
  Discount rebuild(void Function(DiscountBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DiscountBuilder toBuilder() => DiscountBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Discount &&
        id == other.id &&
        title == other.title &&
        image == other.image &&
        discountEndDate == other.discountEndDate;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jc(_$hash, discountEndDate.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Discount')
          ..add('id', id)
          ..add('title', title)
          ..add('image', image)
          ..add('discountEndDate', discountEndDate))
        .toString();
  }
}

class DiscountBuilder implements Builder<Discount, DiscountBuilder> {
  _$Discount? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  String? _discountEndDate;
  String? get discountEndDate => _$this._discountEndDate;
  set discountEndDate(String? discountEndDate) =>
      _$this._discountEndDate = discountEndDate;

  DiscountBuilder();

  DiscountBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _title = $v.title;
      _image = $v.image;
      _discountEndDate = $v.discountEndDate;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Discount other) {
    _$v = other as _$Discount;
  }

  @override
  void update(void Function(DiscountBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Discount build() => _build();

  _$Discount _build() {
    final _$result = _$v ??
        _$Discount._(
          id: id,
          title: title,
          image: image,
          discountEndDate: discountEndDate,
        );
    replace(_$result);
    return _$result;
  }
}

class _$ModelDoctor extends ModelDoctor {
  @override
  final int id;
  @override
  final int? experienceYear;
  @override
  final bool? isThereFreeTime;
  @override
  final bool? canPatientAccept;
  @override
  final bool hasDiscount;
  @override
  final String name;
  @override
  final String backgroundImageUrl;
  @override
  final String image;
  @override
  final JsonObject? shortDesc;
  @override
  final WorkSchedule workSchedule;
  @override
  final BuiltList<DoctorInfoDetails> experience;
  @override
  final BuiltList<Articles> articles;
  @override
  final BuiltList<GalleryItems> galleryItems;
  @override
  final BuiltList<String> specializations;
  @override
  final BuiltList<DoctorInfoDetails> education;
  @override
  final BuiltList<Discount> discount;
  @override
  final BuiltList<DoctorInfoDetails> award;
  @override
  final JsonObject? gender;
  @override
  final String? jobName;
  @override
  final String? jobId;
  @override
  final BuiltList<PriceItem> priceList;
  @override
  final JsonObject servicePriceList;
  @override
  final JsonObject academicRank;
  @override
  final BuiltList<DoctorReview> reviews;

  factory _$ModelDoctor([void Function(ModelDoctorBuilder)? updates]) =>
      (ModelDoctorBuilder()..update(updates))._build();

  _$ModelDoctor._(
      {required this.id,
      this.experienceYear,
      this.isThereFreeTime,
      this.canPatientAccept,
      required this.hasDiscount,
      required this.name,
      required this.backgroundImageUrl,
      required this.image,
      this.shortDesc,
      required this.workSchedule,
      required this.experience,
      required this.articles,
      required this.galleryItems,
      required this.specializations,
      required this.education,
      required this.discount,
      required this.award,
      this.gender,
      this.jobName,
      this.jobId,
      required this.priceList,
      required this.servicePriceList,
      required this.academicRank,
      required this.reviews})
      : super._();
  @override
  ModelDoctor rebuild(void Function(ModelDoctorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ModelDoctorBuilder toBuilder() => ModelDoctorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ModelDoctor &&
        id == other.id &&
        experienceYear == other.experienceYear &&
        isThereFreeTime == other.isThereFreeTime &&
        canPatientAccept == other.canPatientAccept &&
        hasDiscount == other.hasDiscount &&
        name == other.name &&
        backgroundImageUrl == other.backgroundImageUrl &&
        image == other.image &&
        shortDesc == other.shortDesc &&
        workSchedule == other.workSchedule &&
        experience == other.experience &&
        articles == other.articles &&
        galleryItems == other.galleryItems &&
        specializations == other.specializations &&
        education == other.education &&
        discount == other.discount &&
        award == other.award &&
        gender == other.gender &&
        jobName == other.jobName &&
        jobId == other.jobId &&
        priceList == other.priceList &&
        servicePriceList == other.servicePriceList &&
        academicRank == other.academicRank &&
        reviews == other.reviews;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, experienceYear.hashCode);
    _$hash = $jc(_$hash, isThereFreeTime.hashCode);
    _$hash = $jc(_$hash, canPatientAccept.hashCode);
    _$hash = $jc(_$hash, hasDiscount.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, backgroundImageUrl.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jc(_$hash, shortDesc.hashCode);
    _$hash = $jc(_$hash, workSchedule.hashCode);
    _$hash = $jc(_$hash, experience.hashCode);
    _$hash = $jc(_$hash, articles.hashCode);
    _$hash = $jc(_$hash, galleryItems.hashCode);
    _$hash = $jc(_$hash, specializations.hashCode);
    _$hash = $jc(_$hash, education.hashCode);
    _$hash = $jc(_$hash, discount.hashCode);
    _$hash = $jc(_$hash, award.hashCode);
    _$hash = $jc(_$hash, gender.hashCode);
    _$hash = $jc(_$hash, jobName.hashCode);
    _$hash = $jc(_$hash, jobId.hashCode);
    _$hash = $jc(_$hash, priceList.hashCode);
    _$hash = $jc(_$hash, servicePriceList.hashCode);
    _$hash = $jc(_$hash, academicRank.hashCode);
    _$hash = $jc(_$hash, reviews.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ModelDoctor')
          ..add('id', id)
          ..add('experienceYear', experienceYear)
          ..add('isThereFreeTime', isThereFreeTime)
          ..add('canPatientAccept', canPatientAccept)
          ..add('hasDiscount', hasDiscount)
          ..add('name', name)
          ..add('backgroundImageUrl', backgroundImageUrl)
          ..add('image', image)
          ..add('shortDesc', shortDesc)
          ..add('workSchedule', workSchedule)
          ..add('experience', experience)
          ..add('articles', articles)
          ..add('galleryItems', galleryItems)
          ..add('specializations', specializations)
          ..add('education', education)
          ..add('discount', discount)
          ..add('award', award)
          ..add('gender', gender)
          ..add('jobName', jobName)
          ..add('jobId', jobId)
          ..add('priceList', priceList)
          ..add('servicePriceList', servicePriceList)
          ..add('academicRank', academicRank)
          ..add('reviews', reviews))
        .toString();
  }
}

class ModelDoctorBuilder implements Builder<ModelDoctor, ModelDoctorBuilder> {
  _$ModelDoctor? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _experienceYear;
  int? get experienceYear => _$this._experienceYear;
  set experienceYear(int? experienceYear) =>
      _$this._experienceYear = experienceYear;

  bool? _isThereFreeTime;
  bool? get isThereFreeTime => _$this._isThereFreeTime;
  set isThereFreeTime(bool? isThereFreeTime) =>
      _$this._isThereFreeTime = isThereFreeTime;

  bool? _canPatientAccept;
  bool? get canPatientAccept => _$this._canPatientAccept;
  set canPatientAccept(bool? canPatientAccept) =>
      _$this._canPatientAccept = canPatientAccept;

  bool? _hasDiscount;
  bool? get hasDiscount => _$this._hasDiscount;
  set hasDiscount(bool? hasDiscount) => _$this._hasDiscount = hasDiscount;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _backgroundImageUrl;
  String? get backgroundImageUrl => _$this._backgroundImageUrl;
  set backgroundImageUrl(String? backgroundImageUrl) =>
      _$this._backgroundImageUrl = backgroundImageUrl;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  JsonObject? _shortDesc;
  JsonObject? get shortDesc => _$this._shortDesc;
  set shortDesc(JsonObject? shortDesc) => _$this._shortDesc = shortDesc;

  WorkScheduleBuilder? _workSchedule;
  WorkScheduleBuilder get workSchedule =>
      _$this._workSchedule ??= WorkScheduleBuilder();
  set workSchedule(WorkScheduleBuilder? workSchedule) =>
      _$this._workSchedule = workSchedule;

  ListBuilder<DoctorInfoDetails>? _experience;
  ListBuilder<DoctorInfoDetails> get experience =>
      _$this._experience ??= ListBuilder<DoctorInfoDetails>();
  set experience(ListBuilder<DoctorInfoDetails>? experience) =>
      _$this._experience = experience;

  ListBuilder<Articles>? _articles;
  ListBuilder<Articles> get articles =>
      _$this._articles ??= ListBuilder<Articles>();
  set articles(ListBuilder<Articles>? articles) => _$this._articles = articles;

  ListBuilder<GalleryItems>? _galleryItems;
  ListBuilder<GalleryItems> get galleryItems =>
      _$this._galleryItems ??= ListBuilder<GalleryItems>();
  set galleryItems(ListBuilder<GalleryItems>? galleryItems) =>
      _$this._galleryItems = galleryItems;

  ListBuilder<String>? _specializations;
  ListBuilder<String> get specializations =>
      _$this._specializations ??= ListBuilder<String>();
  set specializations(ListBuilder<String>? specializations) =>
      _$this._specializations = specializations;

  ListBuilder<DoctorInfoDetails>? _education;
  ListBuilder<DoctorInfoDetails> get education =>
      _$this._education ??= ListBuilder<DoctorInfoDetails>();
  set education(ListBuilder<DoctorInfoDetails>? education) =>
      _$this._education = education;

  ListBuilder<Discount>? _discount;
  ListBuilder<Discount> get discount =>
      _$this._discount ??= ListBuilder<Discount>();
  set discount(ListBuilder<Discount>? discount) => _$this._discount = discount;

  ListBuilder<DoctorInfoDetails>? _award;
  ListBuilder<DoctorInfoDetails> get award =>
      _$this._award ??= ListBuilder<DoctorInfoDetails>();
  set award(ListBuilder<DoctorInfoDetails>? award) => _$this._award = award;

  JsonObject? _gender;
  JsonObject? get gender => _$this._gender;
  set gender(JsonObject? gender) => _$this._gender = gender;

  String? _jobName;
  String? get jobName => _$this._jobName;
  set jobName(String? jobName) => _$this._jobName = jobName;

  String? _jobId;
  String? get jobId => _$this._jobId;
  set jobId(String? jobId) => _$this._jobId = jobId;

  ListBuilder<PriceItem>? _priceList;
  ListBuilder<PriceItem> get priceList =>
      _$this._priceList ??= ListBuilder<PriceItem>();
  set priceList(ListBuilder<PriceItem>? priceList) =>
      _$this._priceList = priceList;

  JsonObject? _servicePriceList;
  JsonObject? get servicePriceList => _$this._servicePriceList;
  set servicePriceList(JsonObject? servicePriceList) =>
      _$this._servicePriceList = servicePriceList;

  JsonObject? _academicRank;
  JsonObject? get academicRank => _$this._academicRank;
  set academicRank(JsonObject? academicRank) =>
      _$this._academicRank = academicRank;

  ListBuilder<DoctorReview>? _reviews;
  ListBuilder<DoctorReview> get reviews =>
      _$this._reviews ??= ListBuilder<DoctorReview>();
  set reviews(ListBuilder<DoctorReview>? reviews) => _$this._reviews = reviews;

  ModelDoctorBuilder();

  ModelDoctorBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _experienceYear = $v.experienceYear;
      _isThereFreeTime = $v.isThereFreeTime;
      _canPatientAccept = $v.canPatientAccept;
      _hasDiscount = $v.hasDiscount;
      _name = $v.name;
      _backgroundImageUrl = $v.backgroundImageUrl;
      _image = $v.image;
      _shortDesc = $v.shortDesc;
      _workSchedule = $v.workSchedule.toBuilder();
      _experience = $v.experience.toBuilder();
      _articles = $v.articles.toBuilder();
      _galleryItems = $v.galleryItems.toBuilder();
      _specializations = $v.specializations.toBuilder();
      _education = $v.education.toBuilder();
      _discount = $v.discount.toBuilder();
      _award = $v.award.toBuilder();
      _gender = $v.gender;
      _jobName = $v.jobName;
      _jobId = $v.jobId;
      _priceList = $v.priceList.toBuilder();
      _servicePriceList = $v.servicePriceList;
      _academicRank = $v.academicRank;
      _reviews = $v.reviews.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ModelDoctor other) {
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
          _$ModelDoctor._(
            id: BuiltValueNullFieldError.checkNotNull(id, r'ModelDoctor', 'id'),
            experienceYear: experienceYear,
            isThereFreeTime: isThereFreeTime,
            canPatientAccept: canPatientAccept,
            hasDiscount: BuiltValueNullFieldError.checkNotNull(
                hasDiscount, r'ModelDoctor', 'hasDiscount'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'ModelDoctor', 'name'),
            backgroundImageUrl: BuiltValueNullFieldError.checkNotNull(
                backgroundImageUrl, r'ModelDoctor', 'backgroundImageUrl'),
            image: BuiltValueNullFieldError.checkNotNull(
                image, r'ModelDoctor', 'image'),
            shortDesc: shortDesc,
            workSchedule: workSchedule.build(),
            experience: experience.build(),
            articles: articles.build(),
            galleryItems: galleryItems.build(),
            specializations: specializations.build(),
            education: education.build(),
            discount: discount.build(),
            award: award.build(),
            gender: gender,
            jobName: jobName,
            jobId: jobId,
            priceList: priceList.build(),
            servicePriceList: BuiltValueNullFieldError.checkNotNull(
                servicePriceList, r'ModelDoctor', 'servicePriceList'),
            academicRank: BuiltValueNullFieldError.checkNotNull(
                academicRank, r'ModelDoctor', 'academicRank'),
            reviews: reviews.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'workSchedule';
        workSchedule.build();
        _$failedField = 'experience';
        experience.build();
        _$failedField = 'articles';
        articles.build();
        _$failedField = 'galleryItems';
        galleryItems.build();
        _$failedField = 'specializations';
        specializations.build();
        _$failedField = 'education';
        education.build();
        _$failedField = 'discount';
        discount.build();
        _$failedField = 'award';
        award.build();

        _$failedField = 'priceList';
        priceList.build();

        _$failedField = 'reviews';
        reviews.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
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
  @override
  final BuiltList<ScheduleItem> sunday;

  factory _$WorkSchedule([void Function(WorkScheduleBuilder)? updates]) =>
      (WorkScheduleBuilder()..update(updates))._build();

  _$WorkSchedule._(
      {required this.monday,
      required this.tuesday,
      required this.wednesday,
      required this.thursday,
      required this.friday,
      required this.saturday,
      required this.sunday})
      : super._();
  @override
  WorkSchedule rebuild(void Function(WorkScheduleBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WorkScheduleBuilder toBuilder() => WorkScheduleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WorkSchedule &&
        monday == other.monday &&
        tuesday == other.tuesday &&
        wednesday == other.wednesday &&
        thursday == other.thursday &&
        friday == other.friday &&
        saturday == other.saturday &&
        sunday == other.sunday;
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
    _$hash = $jc(_$hash, sunday.hashCode);
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
          ..add('saturday', saturday)
          ..add('sunday', sunday))
        .toString();
  }
}

class WorkScheduleBuilder
    implements Builder<WorkSchedule, WorkScheduleBuilder> {
  _$WorkSchedule? _$v;

  ListBuilder<ScheduleItem>? _monday;
  ListBuilder<ScheduleItem> get monday =>
      _$this._monday ??= ListBuilder<ScheduleItem>();
  set monday(ListBuilder<ScheduleItem>? monday) => _$this._monday = monday;

  ListBuilder<ScheduleItem>? _tuesday;
  ListBuilder<ScheduleItem> get tuesday =>
      _$this._tuesday ??= ListBuilder<ScheduleItem>();
  set tuesday(ListBuilder<ScheduleItem>? tuesday) => _$this._tuesday = tuesday;

  ListBuilder<ScheduleItem>? _wednesday;
  ListBuilder<ScheduleItem> get wednesday =>
      _$this._wednesday ??= ListBuilder<ScheduleItem>();
  set wednesday(ListBuilder<ScheduleItem>? wednesday) =>
      _$this._wednesday = wednesday;

  ListBuilder<ScheduleItem>? _thursday;
  ListBuilder<ScheduleItem> get thursday =>
      _$this._thursday ??= ListBuilder<ScheduleItem>();
  set thursday(ListBuilder<ScheduleItem>? thursday) =>
      _$this._thursday = thursday;

  ListBuilder<ScheduleItem>? _friday;
  ListBuilder<ScheduleItem> get friday =>
      _$this._friday ??= ListBuilder<ScheduleItem>();
  set friday(ListBuilder<ScheduleItem>? friday) => _$this._friday = friday;

  ListBuilder<ScheduleItem>? _saturday;
  ListBuilder<ScheduleItem> get saturday =>
      _$this._saturday ??= ListBuilder<ScheduleItem>();
  set saturday(ListBuilder<ScheduleItem>? saturday) =>
      _$this._saturday = saturday;

  ListBuilder<ScheduleItem>? _sunday;
  ListBuilder<ScheduleItem> get sunday =>
      _$this._sunday ??= ListBuilder<ScheduleItem>();
  set sunday(ListBuilder<ScheduleItem>? sunday) => _$this._sunday = sunday;

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
      _sunday = $v.sunday.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WorkSchedule other) {
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
          _$WorkSchedule._(
            monday: monday.build(),
            tuesday: tuesday.build(),
            wednesday: wednesday.build(),
            thursday: thursday.build(),
            friday: friday.build(),
            saturday: saturday.build(),
            sunday: sunday.build(),
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
        _$failedField = 'sunday';
        sunday.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
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
  final JsonObject company;
  @override
  final JsonObject time;

  factory _$ScheduleItem([void Function(ScheduleItemBuilder)? updates]) =>
      (ScheduleItemBuilder()..update(updates))._build();

  _$ScheduleItem._({required this.company, required this.time}) : super._();
  @override
  ScheduleItem rebuild(void Function(ScheduleItemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ScheduleItemBuilder toBuilder() => ScheduleItemBuilder()..replace(this);

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

  JsonObject? _company;
  JsonObject? get company => _$this._company;
  set company(JsonObject? company) => _$this._company = company;

  JsonObject? _time;
  JsonObject? get time => _$this._time;
  set time(JsonObject? time) => _$this._time = time;

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
        _$ScheduleItem._(
          company: BuiltValueNullFieldError.checkNotNull(
              company, r'ScheduleItem', 'company'),
          time: BuiltValueNullFieldError.checkNotNull(
              time, r'ScheduleItem', 'time'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$DoctorReview extends DoctorReview {
  @override
  final int? id;
  @override
  final String? ratings;
  @override
  final String? review;
  @override
  final int? companyId;
  @override
  final String? companyName;
  @override
  final String? companyLogoUrl;
  @override
  final String? state;
  @override
  final String? integratorLogoUrl;
  @override
  final int? doctorId;
  @override
  final String? createDate;
  @override
  final String? location;
  @override
  final String? patientName;

  factory _$DoctorReview([void Function(DoctorReviewBuilder)? updates]) =>
      (DoctorReviewBuilder()..update(updates))._build();

  _$DoctorReview._(
      {this.id,
      this.ratings,
      this.review,
      this.companyId,
      this.companyName,
      this.companyLogoUrl,
      this.state,
      this.integratorLogoUrl,
      this.doctorId,
      this.createDate,
      this.location,
      this.patientName})
      : super._();
  @override
  DoctorReview rebuild(void Function(DoctorReviewBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DoctorReviewBuilder toBuilder() => DoctorReviewBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DoctorReview &&
        id == other.id &&
        ratings == other.ratings &&
        review == other.review &&
        companyId == other.companyId &&
        companyName == other.companyName &&
        companyLogoUrl == other.companyLogoUrl &&
        state == other.state &&
        integratorLogoUrl == other.integratorLogoUrl &&
        doctorId == other.doctorId &&
        createDate == other.createDate &&
        location == other.location &&
        patientName == other.patientName;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, ratings.hashCode);
    _$hash = $jc(_$hash, review.hashCode);
    _$hash = $jc(_$hash, companyId.hashCode);
    _$hash = $jc(_$hash, companyName.hashCode);
    _$hash = $jc(_$hash, companyLogoUrl.hashCode);
    _$hash = $jc(_$hash, state.hashCode);
    _$hash = $jc(_$hash, integratorLogoUrl.hashCode);
    _$hash = $jc(_$hash, doctorId.hashCode);
    _$hash = $jc(_$hash, createDate.hashCode);
    _$hash = $jc(_$hash, location.hashCode);
    _$hash = $jc(_$hash, patientName.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DoctorReview')
          ..add('id', id)
          ..add('ratings', ratings)
          ..add('review', review)
          ..add('companyId', companyId)
          ..add('companyName', companyName)
          ..add('companyLogoUrl', companyLogoUrl)
          ..add('state', state)
          ..add('integratorLogoUrl', integratorLogoUrl)
          ..add('doctorId', doctorId)
          ..add('createDate', createDate)
          ..add('location', location)
          ..add('patientName', patientName))
        .toString();
  }
}

class DoctorReviewBuilder
    implements Builder<DoctorReview, DoctorReviewBuilder> {
  _$DoctorReview? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _ratings;
  String? get ratings => _$this._ratings;
  set ratings(String? ratings) => _$this._ratings = ratings;

  String? _review;
  String? get review => _$this._review;
  set review(String? review) => _$this._review = review;

  int? _companyId;
  int? get companyId => _$this._companyId;
  set companyId(int? companyId) => _$this._companyId = companyId;

  String? _companyName;
  String? get companyName => _$this._companyName;
  set companyName(String? companyName) => _$this._companyName = companyName;

  String? _companyLogoUrl;
  String? get companyLogoUrl => _$this._companyLogoUrl;
  set companyLogoUrl(String? companyLogoUrl) =>
      _$this._companyLogoUrl = companyLogoUrl;

  String? _state;
  String? get state => _$this._state;
  set state(String? state) => _$this._state = state;

  String? _integratorLogoUrl;
  String? get integratorLogoUrl => _$this._integratorLogoUrl;
  set integratorLogoUrl(String? integratorLogoUrl) =>
      _$this._integratorLogoUrl = integratorLogoUrl;

  int? _doctorId;
  int? get doctorId => _$this._doctorId;
  set doctorId(int? doctorId) => _$this._doctorId = doctorId;

  String? _createDate;
  String? get createDate => _$this._createDate;
  set createDate(String? createDate) => _$this._createDate = createDate;

  String? _location;
  String? get location => _$this._location;
  set location(String? location) => _$this._location = location;

  String? _patientName;
  String? get patientName => _$this._patientName;
  set patientName(String? patientName) => _$this._patientName = patientName;

  DoctorReviewBuilder();

  DoctorReviewBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _ratings = $v.ratings;
      _review = $v.review;
      _companyId = $v.companyId;
      _companyName = $v.companyName;
      _companyLogoUrl = $v.companyLogoUrl;
      _state = $v.state;
      _integratorLogoUrl = $v.integratorLogoUrl;
      _doctorId = $v.doctorId;
      _createDate = $v.createDate;
      _location = $v.location;
      _patientName = $v.patientName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DoctorReview other) {
    _$v = other as _$DoctorReview;
  }

  @override
  void update(void Function(DoctorReviewBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DoctorReview build() => _build();

  _$DoctorReview _build() {
    final _$result = _$v ??
        _$DoctorReview._(
          id: id,
          ratings: ratings,
          review: review,
          companyId: companyId,
          companyName: companyName,
          companyLogoUrl: companyLogoUrl,
          state: state,
          integratorLogoUrl: integratorLogoUrl,
          doctorId: doctorId,
          createDate: createDate,
          location: location,
          patientName: patientName,
        );
    replace(_$result);
    return _$result;
  }
}

class _$GalleryItems extends GalleryItems {
  @override
  final int id;
  @override
  final String type;
  @override
  final String fileName;
  @override
  final String videoImage;
  @override
  final String fileUrl;

  factory _$GalleryItems([void Function(GalleryItemsBuilder)? updates]) =>
      (GalleryItemsBuilder()..update(updates))._build();

  _$GalleryItems._(
      {required this.id,
      required this.type,
      required this.fileName,
      required this.videoImage,
      required this.fileUrl})
      : super._();
  @override
  GalleryItems rebuild(void Function(GalleryItemsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GalleryItemsBuilder toBuilder() => GalleryItemsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GalleryItems &&
        id == other.id &&
        type == other.type &&
        fileName == other.fileName &&
        videoImage == other.videoImage &&
        fileUrl == other.fileUrl;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, fileName.hashCode);
    _$hash = $jc(_$hash, videoImage.hashCode);
    _$hash = $jc(_$hash, fileUrl.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GalleryItems')
          ..add('id', id)
          ..add('type', type)
          ..add('fileName', fileName)
          ..add('videoImage', videoImage)
          ..add('fileUrl', fileUrl))
        .toString();
  }
}

class GalleryItemsBuilder
    implements Builder<GalleryItems, GalleryItemsBuilder> {
  _$GalleryItems? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  String? _fileName;
  String? get fileName => _$this._fileName;
  set fileName(String? fileName) => _$this._fileName = fileName;

  String? _videoImage;
  String? get videoImage => _$this._videoImage;
  set videoImage(String? videoImage) => _$this._videoImage = videoImage;

  String? _fileUrl;
  String? get fileUrl => _$this._fileUrl;
  set fileUrl(String? fileUrl) => _$this._fileUrl = fileUrl;

  GalleryItemsBuilder();

  GalleryItemsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _type = $v.type;
      _fileName = $v.fileName;
      _videoImage = $v.videoImage;
      _fileUrl = $v.fileUrl;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GalleryItems other) {
    _$v = other as _$GalleryItems;
  }

  @override
  void update(void Function(GalleryItemsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GalleryItems build() => _build();

  _$GalleryItems _build() {
    final _$result = _$v ??
        _$GalleryItems._(
          id: BuiltValueNullFieldError.checkNotNull(id, r'GalleryItems', 'id'),
          type: BuiltValueNullFieldError.checkNotNull(
              type, r'GalleryItems', 'type'),
          fileName: BuiltValueNullFieldError.checkNotNull(
              fileName, r'GalleryItems', 'fileName'),
          videoImage: BuiltValueNullFieldError.checkNotNull(
              videoImage, r'GalleryItems', 'videoImage'),
          fileUrl: BuiltValueNullFieldError.checkNotNull(
              fileUrl, r'GalleryItems', 'fileUrl'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$Articles extends Articles {
  @override
  final int id;
  @override
  final String type;
  @override
  final String title;
  @override
  final String description;
  @override
  final String primaryImage;
  @override
  final BuiltList<String> images;

  factory _$Articles([void Function(ArticlesBuilder)? updates]) =>
      (ArticlesBuilder()..update(updates))._build();

  _$Articles._(
      {required this.id,
      required this.type,
      required this.title,
      required this.description,
      required this.primaryImage,
      required this.images})
      : super._();
  @override
  Articles rebuild(void Function(ArticlesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ArticlesBuilder toBuilder() => ArticlesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Articles &&
        id == other.id &&
        type == other.type &&
        title == other.title &&
        description == other.description &&
        primaryImage == other.primaryImage &&
        images == other.images;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, primaryImage.hashCode);
    _$hash = $jc(_$hash, images.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Articles')
          ..add('id', id)
          ..add('type', type)
          ..add('title', title)
          ..add('description', description)
          ..add('primaryImage', primaryImage)
          ..add('images', images))
        .toString();
  }
}

class ArticlesBuilder implements Builder<Articles, ArticlesBuilder> {
  _$Articles? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _primaryImage;
  String? get primaryImage => _$this._primaryImage;
  set primaryImage(String? primaryImage) => _$this._primaryImage = primaryImage;

  ListBuilder<String>? _images;
  ListBuilder<String> get images => _$this._images ??= ListBuilder<String>();
  set images(ListBuilder<String>? images) => _$this._images = images;

  ArticlesBuilder();

  ArticlesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _type = $v.type;
      _title = $v.title;
      _description = $v.description;
      _primaryImage = $v.primaryImage;
      _images = $v.images.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Articles other) {
    _$v = other as _$Articles;
  }

  @override
  void update(void Function(ArticlesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Articles build() => _build();

  _$Articles _build() {
    _$Articles _$result;
    try {
      _$result = _$v ??
          _$Articles._(
            id: BuiltValueNullFieldError.checkNotNull(id, r'Articles', 'id'),
            type: BuiltValueNullFieldError.checkNotNull(
                type, r'Articles', 'type'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'Articles', 'title'),
            description: BuiltValueNullFieldError.checkNotNull(
                description, r'Articles', 'description'),
            primaryImage: BuiltValueNullFieldError.checkNotNull(
                primaryImage, r'Articles', 'primaryImage'),
            images: images.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'images';
        images.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'Articles', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$DoctorInfoDetails extends DoctorInfoDetails {
  @override
  final String? title;
  @override
  final String? date;
  @override
  final String? icon;
  @override
  final String? educationDegree;
  @override
  final String? certificateSeries;
  @override
  final String? certificateFileUrl;
  @override
  final BuiltList<String> description;

  factory _$DoctorInfoDetails(
          [void Function(DoctorInfoDetailsBuilder)? updates]) =>
      (DoctorInfoDetailsBuilder()..update(updates))._build();

  _$DoctorInfoDetails._(
      {this.title,
      this.date,
      this.icon,
      this.educationDegree,
      this.certificateSeries,
      this.certificateFileUrl,
      required this.description})
      : super._();
  @override
  DoctorInfoDetails rebuild(void Function(DoctorInfoDetailsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DoctorInfoDetailsBuilder toBuilder() =>
      DoctorInfoDetailsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DoctorInfoDetails &&
        title == other.title &&
        date == other.date &&
        icon == other.icon &&
        educationDegree == other.educationDegree &&
        certificateSeries == other.certificateSeries &&
        certificateFileUrl == other.certificateFileUrl &&
        description == other.description;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, date.hashCode);
    _$hash = $jc(_$hash, icon.hashCode);
    _$hash = $jc(_$hash, educationDegree.hashCode);
    _$hash = $jc(_$hash, certificateSeries.hashCode);
    _$hash = $jc(_$hash, certificateFileUrl.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DoctorInfoDetails')
          ..add('title', title)
          ..add('date', date)
          ..add('icon', icon)
          ..add('educationDegree', educationDegree)
          ..add('certificateSeries', certificateSeries)
          ..add('certificateFileUrl', certificateFileUrl)
          ..add('description', description))
        .toString();
  }
}

class DoctorInfoDetailsBuilder
    implements Builder<DoctorInfoDetails, DoctorInfoDetailsBuilder> {
  _$DoctorInfoDetails? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _date;
  String? get date => _$this._date;
  set date(String? date) => _$this._date = date;

  String? _icon;
  String? get icon => _$this._icon;
  set icon(String? icon) => _$this._icon = icon;

  String? _educationDegree;
  String? get educationDegree => _$this._educationDegree;
  set educationDegree(String? educationDegree) =>
      _$this._educationDegree = educationDegree;

  String? _certificateSeries;
  String? get certificateSeries => _$this._certificateSeries;
  set certificateSeries(String? certificateSeries) =>
      _$this._certificateSeries = certificateSeries;

  String? _certificateFileUrl;
  String? get certificateFileUrl => _$this._certificateFileUrl;
  set certificateFileUrl(String? certificateFileUrl) =>
      _$this._certificateFileUrl = certificateFileUrl;

  ListBuilder<String>? _description;
  ListBuilder<String> get description =>
      _$this._description ??= ListBuilder<String>();
  set description(ListBuilder<String>? description) =>
      _$this._description = description;

  DoctorInfoDetailsBuilder();

  DoctorInfoDetailsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _date = $v.date;
      _icon = $v.icon;
      _educationDegree = $v.educationDegree;
      _certificateSeries = $v.certificateSeries;
      _certificateFileUrl = $v.certificateFileUrl;
      _description = $v.description.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DoctorInfoDetails other) {
    _$v = other as _$DoctorInfoDetails;
  }

  @override
  void update(void Function(DoctorInfoDetailsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DoctorInfoDetails build() => _build();

  _$DoctorInfoDetails _build() {
    _$DoctorInfoDetails _$result;
    try {
      _$result = _$v ??
          _$DoctorInfoDetails._(
            title: title,
            date: date,
            icon: icon,
            educationDegree: educationDegree,
            certificateSeries: certificateSeries,
            certificateFileUrl: certificateFileUrl,
            description: description.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'description';
        description.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'DoctorInfoDetails', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$PriceItem extends PriceItem {
  @override
  final JsonObject productType;
  @override
  final String categId;
  @override
  final int serviceId;
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
  final JsonObject age;

  factory _$PriceItem([void Function(PriceItemBuilder)? updates]) =>
      (PriceItemBuilder()..update(updates))._build();

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
      : super._();
  @override
  PriceItem rebuild(void Function(PriceItemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PriceItemBuilder toBuilder() => PriceItemBuilder()..replace(this);

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

  JsonObject? _productType;
  JsonObject? get productType => _$this._productType;
  set productType(JsonObject? productType) => _$this._productType = productType;

  String? _categId;
  String? get categId => _$this._categId;
  set categId(String? categId) => _$this._categId = categId;

  int? _serviceId;
  int? get serviceId => _$this._serviceId;
  set serviceId(int? serviceId) => _$this._serviceId = serviceId;

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

  JsonObject? _age;
  JsonObject? get age => _$this._age;
  set age(JsonObject? age) => _$this._age = age;

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
        _$PriceItem._(
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

class _$DoctorsJob extends DoctorsJob {
  @override
  final String name;
  @override
  final int id;

  factory _$DoctorsJob([void Function(DoctorsJobBuilder)? updates]) =>
      (DoctorsJobBuilder()..update(updates))._build();

  _$DoctorsJob._({required this.name, required this.id}) : super._();
  @override
  DoctorsJob rebuild(void Function(DoctorsJobBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DoctorsJobBuilder toBuilder() => DoctorsJobBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DoctorsJob && name == other.name && id == other.id;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DoctorsJob')
          ..add('name', name)
          ..add('id', id))
        .toString();
  }
}

class DoctorsJobBuilder implements Builder<DoctorsJob, DoctorsJobBuilder> {
  _$DoctorsJob? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  DoctorsJobBuilder();

  DoctorsJobBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DoctorsJob other) {
    _$v = other as _$DoctorsJob;
  }

  @override
  void update(void Function(DoctorsJobBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DoctorsJob build() => _build();

  _$DoctorsJob _build() {
    final _$result = _$v ??
        _$DoctorsJob._(
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'DoctorsJob', 'name'),
          id: BuiltValueNullFieldError.checkNotNull(id, r'DoctorsJob', 'id'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
