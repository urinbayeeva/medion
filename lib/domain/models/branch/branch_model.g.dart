// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BranchModel> _$branchModelSerializer = _$BranchModelSerializer();
Serializer<BranchDetailModel> _$branchDetailModelSerializer =
    _$BranchDetailModelSerializer();
Serializer<AwardsModel> _$awardsModelSerializer = _$AwardsModelSerializer();
Serializer<EducationModel> _$educationModelSerializer =
    _$EducationModelSerializer();
Serializer<StudyLead> _$studyLeadSerializer = _$StudyLeadSerializer();
Serializer<StudyLeadResult> _$studyLeadResultSerializer =
    _$StudyLeadResultSerializer();
Serializer<Course> _$courseSerializer = _$CourseSerializer();
Serializer<ContentModel> _$contentModelSerializer = _$ContentModelSerializer();
Serializer<BannerModel> _$bannerModelSerializer = _$BannerModelSerializer();
Serializer<ChildContentModel> _$childContentModelSerializer =
    _$ChildContentModelSerializer();
Serializer<MedionModel> _$medionModelSerializer = _$MedionModelSerializer();
Serializer<OfferModel> _$offerModelSerializer = _$OfferModelSerializer();
Serializer<ReviewModel> _$reviewModelSerializer = _$ReviewModelSerializer();
Serializer<ReviewInfoModel> _$reviewInfoModelSerializer =
    _$ReviewInfoModelSerializer();
Serializer<GetReviewModel> _$getReviewModelSerializer =
    _$GetReviewModelSerializer();
Serializer<PostReviewModel> _$postReviewModelSerializer =
    _$PostReviewModelSerializer();
Serializer<PostReviewResult> _$postReviewResultSerializer =
    _$PostReviewResultSerializer();
Serializer<PostVisitReviewModel> _$postVisitReviewModelSerializer =
    _$PostVisitReviewModelSerializer();

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
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.workingAllDays;
    if (value != null) {
      result
        ..add('working_all_days')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.extraDescription;
    if (value != null) {
      result
        ..add('extra_description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ourOffer;
    if (value != null) {
      result
        ..add('offers')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(OfferModel)])));
    }
    value = object.icon;
    if (value != null) {
      result
        ..add('icon')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.licenses;
    if (value != null) {
      result
        ..add('licenses')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    return result;
  }

  @override
  BranchModel deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = BranchModelBuilder();

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
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'working_all_days':
          result.workingAllDays = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'extra_description':
          result.extraDescription = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'offers':
          result.ourOffer.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(OfferModel)]))!
              as BuiltList<Object?>);
          break;
        case 'icon':
          result.icon = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$BranchDetailModelSerializer
    implements StructuredSerializer<BranchDetailModel> {
  @override
  final Iterable<Type> types = const [BranchDetailModel, _$BranchDetailModel];
  @override
  final String wireName = 'BranchDetailModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, BranchDetailModel object,
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
      'offers',
      serializers.serialize(object.offers,
          specifiedType:
              const FullType(BuiltList, const [const FullType(OfferModel)])),
    ];
    Object? value;
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
    value = object.workTime;
    if (value != null) {
      result
        ..add('work_time')
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
    value = object.workingAllDays;
    if (value != null) {
      result
        ..add('working_all_days')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.licenses;
    if (value != null) {
      result
        ..add('licenses')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.images;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.video;
    if (value != null) {
      result
        ..add('video')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(dynamic)])));
    }
    value = object.workDays;
    if (value != null) {
      result
        ..add('work_days')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    return result;
  }

  @override
  BranchDetailModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = BranchDetailModelBuilder();

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
        case 'work_time':
          result.workTime = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'working_all_days':
          result.workingAllDays = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'licenses':
          result.licenses.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'image':
          result.images.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'latitude':
          result.latitude = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'longitude':
          result.longitude = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'video':
          result.video.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(dynamic)]))!
              as BuiltList<Object?>);
          break;
        case 'work_days':
          result.workDays.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'offers':
          result.offers.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(OfferModel)]))!
              as BuiltList<Object?>);
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
    final result = AwardsModelBuilder();

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
    final result = <Object?>[
      'company_id',
      serializers.serialize(object.companyId,
          specifiedType: const FullType(int)),
    ];
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
    value = object.courses;
    if (value != null) {
      result
        ..add('courses')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(Course)])));
    }
    value = object.bannerLink;
    if (value != null) {
      result
        ..add('banner_link')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.bannerImage;
    if (value != null) {
      result
        ..add('banner_image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.missionTitle;
    if (value != null) {
      result
        ..add('mission_title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.missionIcon;
    if (value != null) {
      result
        ..add('mission_icon')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.valuesTitle;
    if (value != null) {
      result
        ..add('values_title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.valuesIcon;
    if (value != null) {
      result
        ..add('values_icon')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.goalsTitle;
    if (value != null) {
      result
        ..add('goals_title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.goalsIcon;
    if (value != null) {
      result
        ..add('goals_icon')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.audienceTitle;
    if (value != null) {
      result
        ..add('audience_title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.audienceIcon;
    if (value != null) {
      result
        ..add('audience_icon')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.whyUsTitle;
    if (value != null) {
      result
        ..add('why_us_title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.whyUsIcon;
    if (value != null) {
      result
        ..add('why_us_icon')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  EducationModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = EducationModelBuilder();

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
              specifiedType: const FullType(int))! as int;
          break;
        case 'courses':
          result.courses.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Course)]))!
              as BuiltList<Object?>);
          break;
        case 'banner_link':
          result.bannerLink = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'banner_image':
          result.bannerImage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'mission_title':
          result.missionTitle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'mission_icon':
          result.missionIcon = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'values_title':
          result.valuesTitle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'values_icon':
          result.valuesIcon = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'goals_title':
          result.goalsTitle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'goals_icon':
          result.goalsIcon = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'audience_title':
          result.audienceTitle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'audience_icon':
          result.audienceIcon = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'why_us_title':
          result.whyUsTitle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'why_us_icon':
          result.whyUsIcon = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$StudyLeadSerializer implements StructuredSerializer<StudyLead> {
  @override
  final Iterable<Type> types = const [StudyLead, _$StudyLead];
  @override
  final String wireName = 'StudyLead';

  @override
  Iterable<Object?> serialize(Serializers serializers, StudyLead object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'full_name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'phone',
      serializers.serialize(object.phone,
          specifiedType: const FullType(String)),
      'company_id',
      serializers.serialize(object.companyId,
          specifiedType: const FullType(int)),
      'course_id',
      serializers.serialize(object.courseId,
          specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  StudyLead deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = StudyLeadBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'full_name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'phone':
          result.phone = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'company_id':
          result.companyId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'course_id':
          result.courseId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$StudyLeadResultSerializer
    implements StructuredSerializer<StudyLeadResult> {
  @override
  final Iterable<Type> types = const [StudyLeadResult, _$StudyLeadResult];
  @override
  final String wireName = 'StudyLeadResult';

  @override
  Iterable<Object?> serialize(Serializers serializers, StudyLeadResult object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'status',
      serializers.serialize(object.status,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  StudyLeadResult deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = StudyLeadResultBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
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
    final result = CourseBuilder();

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
      'banners',
      serializers.serialize(object.banners,
          specifiedType:
              const FullType(BuiltList, const [const FullType(BannerModel)])),
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
    value = object.categoryId;
    if (value != null) {
      result
        ..add('category_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  ContentModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ContentModelBuilder();

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
        case 'category_id':
          result.categoryId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'banners':
          result.banners.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(BannerModel)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$BannerModelSerializer implements StructuredSerializer<BannerModel> {
  @override
  final Iterable<Type> types = const [BannerModel, _$BannerModel];
  @override
  final String wireName = 'BannerModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, BannerModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'image',
      serializers.serialize(object.image,
          specifiedType: const FullType(String)),
      'image_mobile',
      serializers.serialize(object.imageMobile,
          specifiedType: const FullType(String)),
      'link',
      serializers.serialize(object.link, specifiedType: const FullType(String)),
      'button_text',
      serializers.serialize(object.buttonText,
          specifiedType: const FullType(String)),
      'horizontal',
      serializers.serialize(object.horizontal,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  BannerModel deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = BannerModelBuilder();

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
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'image_mobile':
          result.imageMobile = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'link':
          result.link = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'button_text':
          result.buttonText = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'horizontal':
          result.horizontal = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
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
    final result = ChildContentModelBuilder();

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
    ];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.licenses;
    if (value != null) {
      result
        ..add('licenses')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    return result;
  }

  @override
  MedionModel deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = MedionModelBuilder();

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
    final result = <Object?>[];
    Object? value;
    value = object.offerta;
    if (value != null) {
      result
        ..add('offerta')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.companyName;
    if (value != null) {
      result
        ..add('company_name')
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
    value = object.description;
    if (value != null) {
      result
        ..add('description')
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
    return result;
  }

  @override
  OfferModel deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = OfferModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'offerta':
          result.offerta = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'company_name':
          result.companyName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$ReviewModelSerializer implements StructuredSerializer<ReviewModel> {
  @override
  final Iterable<Type> types = const [ReviewModel, _$ReviewModel];
  @override
  final String wireName = 'ReviewModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, ReviewModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'categories',
      serializers.serialize(object.categories,
          specifiedType: const FullType(
              BuiltList, const [const FullType(ReviewInfoModel)])),
      'branches',
      serializers.serialize(object.branches,
          specifiedType: const FullType(
              BuiltList, const [const FullType(ReviewInfoModel)])),
      'source',
      serializers.serialize(object.source,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'reviews',
      serializers.serialize(object.reviews,
          specifiedType: const FullType(
              BuiltList, const [const FullType(GetReviewModel)])),
    ];

    return result;
  }

  @override
  ReviewModel deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ReviewModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'categories':
          result.categories.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ReviewInfoModel)]))!
              as BuiltList<Object?>);
          break;
        case 'branches':
          result.branches.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ReviewInfoModel)]))!
              as BuiltList<Object?>);
          break;
        case 'source':
          result.source.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'reviews':
          result.reviews.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(GetReviewModel)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$ReviewInfoModelSerializer
    implements StructuredSerializer<ReviewInfoModel> {
  @override
  final Iterable<Type> types = const [ReviewInfoModel, _$ReviewInfoModel];
  @override
  final String wireName = 'ReviewInfoModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, ReviewInfoModel object,
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
    return result;
  }

  @override
  ReviewInfoModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ReviewInfoModelBuilder();

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
      }
    }

    return result.build();
  }
}

class _$GetReviewModelSerializer
    implements StructuredSerializer<GetReviewModel> {
  @override
  final Iterable<Type> types = const [GetReviewModel, _$GetReviewModel];
  @override
  final String wireName = 'GetReviewModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, GetReviewModel object,
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
    value = object.location;
    if (value != null) {
      result
        ..add('location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.doctorId;
    if (value != null) {
      result
        ..add('doctor_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.doctorName;
    if (value != null) {
      result
        ..add('doctor_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.doctorJobName;
    if (value != null) {
      result
        ..add('doctor_job_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.doctorImage;
    if (value != null) {
      result
        ..add('doctor_image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.dateTime;
    if (value != null) {
      result
        ..add('create_date')
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
    value = object.integratorLogoUrl;
    if (value != null) {
      result
        ..add('integrator_logo_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GetReviewModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GetReviewModelBuilder();

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
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'doctor_id':
          result.doctorId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'doctor_name':
          result.doctorName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'doctor_job_name':
          result.doctorJobName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'doctor_image':
          result.doctorImage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'create_date':
          result.dateTime = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'patient_name':
          result.patientName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'integrator_logo_url':
          result.integratorLogoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$PostReviewModelSerializer
    implements StructuredSerializer<PostReviewModel> {
  @override
  final Iterable<Type> types = const [PostReviewModel, _$PostReviewModel];
  @override
  final String wireName = 'PostReviewModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, PostReviewModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.isAnonym;
    if (value != null) {
      result
        ..add('is_anonym')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.companyId;
    if (value != null) {
      result
        ..add('company_id')
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
    return result;
  }

  @override
  PostReviewModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = PostReviewModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'is_anonym':
          result.isAnonym = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'company_id':
          result.companyId = serializers.deserialize(value,
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
      }
    }

    return result.build();
  }
}

class _$PostReviewResultSerializer
    implements StructuredSerializer<PostReviewResult> {
  @override
  final Iterable<Type> types = const [PostReviewResult, _$PostReviewResult];
  @override
  final String wireName = 'PostReviewResult';

  @override
  Iterable<Object?> serialize(Serializers serializers, PostReviewResult object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.message;
    if (value != null) {
      result
        ..add('message')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  PostReviewResult deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = PostReviewResultBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$PostVisitReviewModelSerializer
    implements StructuredSerializer<PostVisitReviewModel> {
  @override
  final Iterable<Type> types = const [
    PostVisitReviewModel,
    _$PostVisitReviewModel
  ];
  @override
  final String wireName = 'PostVisitReviewModel';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, PostVisitReviewModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
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
    value = object.visitId;
    if (value != null) {
      result
        ..add('visit_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  PostVisitReviewModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = PostVisitReviewModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ratings':
          result.ratings = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'review':
          result.review = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'visit_id':
          result.visitId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
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
  @override
  final String? title;
  @override
  final bool? workingAllDays;
  @override
  final String? extraDescription;
  @override
  final BuiltList<OfferModel>? ourOffer;
  @override
  final String? icon;
  @override
  final BuiltList<String>? licenses;

  factory _$BranchModel([void Function(BranchModelBuilder)? updates]) =>
      (BranchModelBuilder()..update(updates))._build();

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
      this.description,
      this.title,
      this.workingAllDays,
      this.extraDescription,
      this.ourOffer,
      this.icon,
      this.licenses})
      : super._();
  @override
  BranchModel rebuild(void Function(BranchModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BranchModelBuilder toBuilder() => BranchModelBuilder()..replace(this);

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
        description == other.description &&
        title == other.title &&
        workingAllDays == other.workingAllDays &&
        extraDescription == other.extraDescription &&
        ourOffer == other.ourOffer &&
        icon == other.icon &&
        licenses == other.licenses;
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
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, workingAllDays.hashCode);
    _$hash = $jc(_$hash, extraDescription.hashCode);
    _$hash = $jc(_$hash, ourOffer.hashCode);
    _$hash = $jc(_$hash, icon.hashCode);
    _$hash = $jc(_$hash, licenses.hashCode);
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
          ..add('description', description)
          ..add('title', title)
          ..add('workingAllDays', workingAllDays)
          ..add('extraDescription', extraDescription)
          ..add('ourOffer', ourOffer)
          ..add('icon', icon)
          ..add('licenses', licenses))
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
      _$this._workDays ??= ListBuilder<String>();
  set workDays(ListBuilder<String>? workDays) => _$this._workDays = workDays;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  bool? _workingAllDays;
  bool? get workingAllDays => _$this._workingAllDays;
  set workingAllDays(bool? workingAllDays) =>
      _$this._workingAllDays = workingAllDays;

  String? _extraDescription;
  String? get extraDescription => _$this._extraDescription;
  set extraDescription(String? extraDescription) =>
      _$this._extraDescription = extraDescription;

  ListBuilder<OfferModel>? _ourOffer;
  ListBuilder<OfferModel> get ourOffer =>
      _$this._ourOffer ??= ListBuilder<OfferModel>();
  set ourOffer(ListBuilder<OfferModel>? ourOffer) =>
      _$this._ourOffer = ourOffer;

  String? _icon;
  String? get icon => _$this._icon;
  set icon(String? icon) => _$this._icon = icon;

  ListBuilder<String>? _licenses;
  ListBuilder<String> get licenses =>
      _$this._licenses ??= ListBuilder<String>();
  set licenses(ListBuilder<String>? licenses) => _$this._licenses = licenses;

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
      _title = $v.title;
      _workingAllDays = $v.workingAllDays;
      _extraDescription = $v.extraDescription;
      _ourOffer = $v.ourOffer?.toBuilder();
      _icon = $v.icon;
      _licenses = $v.licenses?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BranchModel other) {
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
          _$BranchModel._(
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
            title: title,
            workingAllDays: workingAllDays,
            extraDescription: extraDescription,
            ourOffer: _ourOffer?.build(),
            icon: icon,
            licenses: _licenses?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'workDays';
        _workDays?.build();

        _$failedField = 'ourOffer';
        _ourOffer?.build();

        _$failedField = 'licenses';
        _licenses?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'BranchModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$BranchDetailModel extends BranchDetailModel {
  @override
  final int id;
  @override
  final String? name;
  @override
  final String? address;
  @override
  final String? phone;
  @override
  final String? workTime;
  @override
  final String? description;
  @override
  final bool? workingAllDays;
  @override
  final BuiltList<String>? licenses;
  @override
  final BuiltList<String>? images;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final BuiltList<dynamic>? video;
  @override
  final BuiltList<String>? workDays;
  @override
  final BuiltList<OfferModel> offers;

  factory _$BranchDetailModel(
          [void Function(BranchDetailModelBuilder)? updates]) =>
      (BranchDetailModelBuilder()..update(updates))._build();

  _$BranchDetailModel._(
      {required this.id,
      this.name,
      this.address,
      this.phone,
      this.workTime,
      this.description,
      this.workingAllDays,
      this.licenses,
      this.images,
      required this.latitude,
      required this.longitude,
      this.video,
      this.workDays,
      required this.offers})
      : super._();
  @override
  BranchDetailModel rebuild(void Function(BranchDetailModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BranchDetailModelBuilder toBuilder() =>
      BranchDetailModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BranchDetailModel &&
        id == other.id &&
        name == other.name &&
        address == other.address &&
        phone == other.phone &&
        workTime == other.workTime &&
        description == other.description &&
        workingAllDays == other.workingAllDays &&
        licenses == other.licenses &&
        images == other.images &&
        latitude == other.latitude &&
        longitude == other.longitude &&
        video == other.video &&
        workDays == other.workDays &&
        offers == other.offers;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, address.hashCode);
    _$hash = $jc(_$hash, phone.hashCode);
    _$hash = $jc(_$hash, workTime.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, workingAllDays.hashCode);
    _$hash = $jc(_$hash, licenses.hashCode);
    _$hash = $jc(_$hash, images.hashCode);
    _$hash = $jc(_$hash, latitude.hashCode);
    _$hash = $jc(_$hash, longitude.hashCode);
    _$hash = $jc(_$hash, video.hashCode);
    _$hash = $jc(_$hash, workDays.hashCode);
    _$hash = $jc(_$hash, offers.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BranchDetailModel')
          ..add('id', id)
          ..add('name', name)
          ..add('address', address)
          ..add('phone', phone)
          ..add('workTime', workTime)
          ..add('description', description)
          ..add('workingAllDays', workingAllDays)
          ..add('licenses', licenses)
          ..add('images', images)
          ..add('latitude', latitude)
          ..add('longitude', longitude)
          ..add('video', video)
          ..add('workDays', workDays)
          ..add('offers', offers))
        .toString();
  }
}

class BranchDetailModelBuilder
    implements Builder<BranchDetailModel, BranchDetailModelBuilder> {
  _$BranchDetailModel? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  String? _phone;
  String? get phone => _$this._phone;
  set phone(String? phone) => _$this._phone = phone;

  String? _workTime;
  String? get workTime => _$this._workTime;
  set workTime(String? workTime) => _$this._workTime = workTime;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  bool? _workingAllDays;
  bool? get workingAllDays => _$this._workingAllDays;
  set workingAllDays(bool? workingAllDays) =>
      _$this._workingAllDays = workingAllDays;

  ListBuilder<String>? _licenses;
  ListBuilder<String> get licenses =>
      _$this._licenses ??= ListBuilder<String>();
  set licenses(ListBuilder<String>? licenses) => _$this._licenses = licenses;

  ListBuilder<String>? _images;
  ListBuilder<String> get images => _$this._images ??= ListBuilder<String>();
  set images(ListBuilder<String>? images) => _$this._images = images;

  double? _latitude;
  double? get latitude => _$this._latitude;
  set latitude(double? latitude) => _$this._latitude = latitude;

  double? _longitude;
  double? get longitude => _$this._longitude;
  set longitude(double? longitude) => _$this._longitude = longitude;

  ListBuilder<dynamic>? _video;
  ListBuilder<dynamic> get video => _$this._video ??= ListBuilder<dynamic>();
  set video(ListBuilder<dynamic>? video) => _$this._video = video;

  ListBuilder<String>? _workDays;
  ListBuilder<String> get workDays =>
      _$this._workDays ??= ListBuilder<String>();
  set workDays(ListBuilder<String>? workDays) => _$this._workDays = workDays;

  ListBuilder<OfferModel>? _offers;
  ListBuilder<OfferModel> get offers =>
      _$this._offers ??= ListBuilder<OfferModel>();
  set offers(ListBuilder<OfferModel>? offers) => _$this._offers = offers;

  BranchDetailModelBuilder();

  BranchDetailModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _address = $v.address;
      _phone = $v.phone;
      _workTime = $v.workTime;
      _description = $v.description;
      _workingAllDays = $v.workingAllDays;
      _licenses = $v.licenses?.toBuilder();
      _images = $v.images?.toBuilder();
      _latitude = $v.latitude;
      _longitude = $v.longitude;
      _video = $v.video?.toBuilder();
      _workDays = $v.workDays?.toBuilder();
      _offers = $v.offers.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BranchDetailModel other) {
    _$v = other as _$BranchDetailModel;
  }

  @override
  void update(void Function(BranchDetailModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BranchDetailModel build() => _build();

  _$BranchDetailModel _build() {
    _$BranchDetailModel _$result;
    try {
      _$result = _$v ??
          _$BranchDetailModel._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'BranchDetailModel', 'id'),
            name: name,
            address: address,
            phone: phone,
            workTime: workTime,
            description: description,
            workingAllDays: workingAllDays,
            licenses: _licenses?.build(),
            images: _images?.build(),
            latitude: BuiltValueNullFieldError.checkNotNull(
                latitude, r'BranchDetailModel', 'latitude'),
            longitude: BuiltValueNullFieldError.checkNotNull(
                longitude, r'BranchDetailModel', 'longitude'),
            video: _video?.build(),
            workDays: _workDays?.build(),
            offers: offers.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'licenses';
        _licenses?.build();
        _$failedField = 'images';
        _images?.build();

        _$failedField = 'video';
        _video?.build();
        _$failedField = 'workDays';
        _workDays?.build();
        _$failedField = 'offers';
        offers.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'BranchDetailModel', _$failedField, e.toString());
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
      (AwardsModelBuilder()..update(updates))._build();

  _$AwardsModel._(
      {this.branchId, this.id, this.title, this.description, this.image})
      : super._();
  @override
  AwardsModel rebuild(void Function(AwardsModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AwardsModelBuilder toBuilder() => AwardsModelBuilder()..replace(this);

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
        _$AwardsModel._(
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
  final int companyId;
  @override
  final BuiltList<Course>? courses;
  @override
  final String? bannerLink;
  @override
  final String? bannerImage;
  @override
  final String? missionTitle;
  @override
  final String? missionIcon;
  @override
  final String? valuesTitle;
  @override
  final String? valuesIcon;
  @override
  final String? goalsTitle;
  @override
  final String? goalsIcon;
  @override
  final String? audienceTitle;
  @override
  final String? audienceIcon;
  @override
  final String? whyUsTitle;
  @override
  final String? whyUsIcon;

  factory _$EducationModel([void Function(EducationModelBuilder)? updates]) =>
      (EducationModelBuilder()..update(updates))._build();

  _$EducationModel._(
      {this.name,
      this.description,
      this.mission,
      this.values,
      this.goals,
      this.audience,
      this.whyUs,
      required this.companyId,
      this.courses,
      this.bannerLink,
      this.bannerImage,
      this.missionTitle,
      this.missionIcon,
      this.valuesTitle,
      this.valuesIcon,
      this.goalsTitle,
      this.goalsIcon,
      this.audienceTitle,
      this.audienceIcon,
      this.whyUsTitle,
      this.whyUsIcon})
      : super._();
  @override
  EducationModel rebuild(void Function(EducationModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EducationModelBuilder toBuilder() => EducationModelBuilder()..replace(this);

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
        courses == other.courses &&
        bannerLink == other.bannerLink &&
        bannerImage == other.bannerImage &&
        missionTitle == other.missionTitle &&
        missionIcon == other.missionIcon &&
        valuesTitle == other.valuesTitle &&
        valuesIcon == other.valuesIcon &&
        goalsTitle == other.goalsTitle &&
        goalsIcon == other.goalsIcon &&
        audienceTitle == other.audienceTitle &&
        audienceIcon == other.audienceIcon &&
        whyUsTitle == other.whyUsTitle &&
        whyUsIcon == other.whyUsIcon;
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
    _$hash = $jc(_$hash, bannerLink.hashCode);
    _$hash = $jc(_$hash, bannerImage.hashCode);
    _$hash = $jc(_$hash, missionTitle.hashCode);
    _$hash = $jc(_$hash, missionIcon.hashCode);
    _$hash = $jc(_$hash, valuesTitle.hashCode);
    _$hash = $jc(_$hash, valuesIcon.hashCode);
    _$hash = $jc(_$hash, goalsTitle.hashCode);
    _$hash = $jc(_$hash, goalsIcon.hashCode);
    _$hash = $jc(_$hash, audienceTitle.hashCode);
    _$hash = $jc(_$hash, audienceIcon.hashCode);
    _$hash = $jc(_$hash, whyUsTitle.hashCode);
    _$hash = $jc(_$hash, whyUsIcon.hashCode);
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
          ..add('courses', courses)
          ..add('bannerLink', bannerLink)
          ..add('bannerImage', bannerImage)
          ..add('missionTitle', missionTitle)
          ..add('missionIcon', missionIcon)
          ..add('valuesTitle', valuesTitle)
          ..add('valuesIcon', valuesIcon)
          ..add('goalsTitle', goalsTitle)
          ..add('goalsIcon', goalsIcon)
          ..add('audienceTitle', audienceTitle)
          ..add('audienceIcon', audienceIcon)
          ..add('whyUsTitle', whyUsTitle)
          ..add('whyUsIcon', whyUsIcon))
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
  ListBuilder<Course> get courses => _$this._courses ??= ListBuilder<Course>();
  set courses(ListBuilder<Course>? courses) => _$this._courses = courses;

  String? _bannerLink;
  String? get bannerLink => _$this._bannerLink;
  set bannerLink(String? bannerLink) => _$this._bannerLink = bannerLink;

  String? _bannerImage;
  String? get bannerImage => _$this._bannerImage;
  set bannerImage(String? bannerImage) => _$this._bannerImage = bannerImage;

  String? _missionTitle;
  String? get missionTitle => _$this._missionTitle;
  set missionTitle(String? missionTitle) => _$this._missionTitle = missionTitle;

  String? _missionIcon;
  String? get missionIcon => _$this._missionIcon;
  set missionIcon(String? missionIcon) => _$this._missionIcon = missionIcon;

  String? _valuesTitle;
  String? get valuesTitle => _$this._valuesTitle;
  set valuesTitle(String? valuesTitle) => _$this._valuesTitle = valuesTitle;

  String? _valuesIcon;
  String? get valuesIcon => _$this._valuesIcon;
  set valuesIcon(String? valuesIcon) => _$this._valuesIcon = valuesIcon;

  String? _goalsTitle;
  String? get goalsTitle => _$this._goalsTitle;
  set goalsTitle(String? goalsTitle) => _$this._goalsTitle = goalsTitle;

  String? _goalsIcon;
  String? get goalsIcon => _$this._goalsIcon;
  set goalsIcon(String? goalsIcon) => _$this._goalsIcon = goalsIcon;

  String? _audienceTitle;
  String? get audienceTitle => _$this._audienceTitle;
  set audienceTitle(String? audienceTitle) =>
      _$this._audienceTitle = audienceTitle;

  String? _audienceIcon;
  String? get audienceIcon => _$this._audienceIcon;
  set audienceIcon(String? audienceIcon) => _$this._audienceIcon = audienceIcon;

  String? _whyUsTitle;
  String? get whyUsTitle => _$this._whyUsTitle;
  set whyUsTitle(String? whyUsTitle) => _$this._whyUsTitle = whyUsTitle;

  String? _whyUsIcon;
  String? get whyUsIcon => _$this._whyUsIcon;
  set whyUsIcon(String? whyUsIcon) => _$this._whyUsIcon = whyUsIcon;

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
      _bannerLink = $v.bannerLink;
      _bannerImage = $v.bannerImage;
      _missionTitle = $v.missionTitle;
      _missionIcon = $v.missionIcon;
      _valuesTitle = $v.valuesTitle;
      _valuesIcon = $v.valuesIcon;
      _goalsTitle = $v.goalsTitle;
      _goalsIcon = $v.goalsIcon;
      _audienceTitle = $v.audienceTitle;
      _audienceIcon = $v.audienceIcon;
      _whyUsTitle = $v.whyUsTitle;
      _whyUsIcon = $v.whyUsIcon;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EducationModel other) {
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
          _$EducationModel._(
            name: name,
            description: description,
            mission: mission,
            values: values,
            goals: goals,
            audience: audience,
            whyUs: whyUs,
            companyId: BuiltValueNullFieldError.checkNotNull(
                companyId, r'EducationModel', 'companyId'),
            courses: _courses?.build(),
            bannerLink: bannerLink,
            bannerImage: bannerImage,
            missionTitle: missionTitle,
            missionIcon: missionIcon,
            valuesTitle: valuesTitle,
            valuesIcon: valuesIcon,
            goalsTitle: goalsTitle,
            goalsIcon: goalsIcon,
            audienceTitle: audienceTitle,
            audienceIcon: audienceIcon,
            whyUsTitle: whyUsTitle,
            whyUsIcon: whyUsIcon,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'courses';
        _courses?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'EducationModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$StudyLead extends StudyLead {
  @override
  final String name;
  @override
  final String phone;
  @override
  final int companyId;
  @override
  final int courseId;

  factory _$StudyLead([void Function(StudyLeadBuilder)? updates]) =>
      (StudyLeadBuilder()..update(updates))._build();

  _$StudyLead._(
      {required this.name,
      required this.phone,
      required this.companyId,
      required this.courseId})
      : super._();
  @override
  StudyLead rebuild(void Function(StudyLeadBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StudyLeadBuilder toBuilder() => StudyLeadBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StudyLead &&
        name == other.name &&
        phone == other.phone &&
        companyId == other.companyId &&
        courseId == other.courseId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, phone.hashCode);
    _$hash = $jc(_$hash, companyId.hashCode);
    _$hash = $jc(_$hash, courseId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'StudyLead')
          ..add('name', name)
          ..add('phone', phone)
          ..add('companyId', companyId)
          ..add('courseId', courseId))
        .toString();
  }
}

class StudyLeadBuilder implements Builder<StudyLead, StudyLeadBuilder> {
  _$StudyLead? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _phone;
  String? get phone => _$this._phone;
  set phone(String? phone) => _$this._phone = phone;

  int? _companyId;
  int? get companyId => _$this._companyId;
  set companyId(int? companyId) => _$this._companyId = companyId;

  int? _courseId;
  int? get courseId => _$this._courseId;
  set courseId(int? courseId) => _$this._courseId = courseId;

  StudyLeadBuilder();

  StudyLeadBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _phone = $v.phone;
      _companyId = $v.companyId;
      _courseId = $v.courseId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StudyLead other) {
    _$v = other as _$StudyLead;
  }

  @override
  void update(void Function(StudyLeadBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  StudyLead build() => _build();

  _$StudyLead _build() {
    final _$result = _$v ??
        _$StudyLead._(
          name:
              BuiltValueNullFieldError.checkNotNull(name, r'StudyLead', 'name'),
          phone: BuiltValueNullFieldError.checkNotNull(
              phone, r'StudyLead', 'phone'),
          companyId: BuiltValueNullFieldError.checkNotNull(
              companyId, r'StudyLead', 'companyId'),
          courseId: BuiltValueNullFieldError.checkNotNull(
              courseId, r'StudyLead', 'courseId'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$StudyLeadResult extends StudyLeadResult {
  @override
  final String status;

  factory _$StudyLeadResult([void Function(StudyLeadResultBuilder)? updates]) =>
      (StudyLeadResultBuilder()..update(updates))._build();

  _$StudyLeadResult._({required this.status}) : super._();
  @override
  StudyLeadResult rebuild(void Function(StudyLeadResultBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StudyLeadResultBuilder toBuilder() => StudyLeadResultBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StudyLeadResult && status == other.status;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'StudyLeadResult')
          ..add('status', status))
        .toString();
  }
}

class StudyLeadResultBuilder
    implements Builder<StudyLeadResult, StudyLeadResultBuilder> {
  _$StudyLeadResult? _$v;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  StudyLeadResultBuilder();

  StudyLeadResultBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _status = $v.status;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StudyLeadResult other) {
    _$v = other as _$StudyLeadResult;
  }

  @override
  void update(void Function(StudyLeadResultBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  StudyLeadResult build() => _build();

  _$StudyLeadResult _build() {
    final _$result = _$v ??
        _$StudyLeadResult._(
          status: BuiltValueNullFieldError.checkNotNull(
              status, r'StudyLeadResult', 'status'),
        );
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
      (CourseBuilder()..update(updates))._build();

  _$Course._({this.id, this.name, this.description, this.image}) : super._();
  @override
  Course rebuild(void Function(CourseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CourseBuilder toBuilder() => CourseBuilder()..replace(this);

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
        _$Course._(
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
  @override
  final int? categoryId;
  @override
  final BuiltList<BannerModel> banners;

  factory _$ContentModel([void Function(ContentModelBuilder)? updates]) =>
      (ContentModelBuilder()..update(updates))._build();

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
      this.phoneNumberShort,
      this.categoryId,
      required this.banners})
      : super._();
  @override
  ContentModel rebuild(void Function(ContentModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ContentModelBuilder toBuilder() => ContentModelBuilder()..replace(this);

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
        phoneNumberShort == other.phoneNumberShort &&
        categoryId == other.categoryId &&
        banners == other.banners;
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
    _$hash = $jc(_$hash, categoryId.hashCode);
    _$hash = $jc(_$hash, banners.hashCode);
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
          ..add('phoneNumberShort', phoneNumberShort)
          ..add('categoryId', categoryId)
          ..add('banners', banners))
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
  ListBuilder<String> get images => _$this._images ??= ListBuilder<String>();
  set images(ListBuilder<String>? images) => _$this._images = images;

  ListBuilder<ChildContentModel>? _children;
  ListBuilder<ChildContentModel> get children =>
      _$this._children ??= ListBuilder<ChildContentModel>();
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

  int? _categoryId;
  int? get categoryId => _$this._categoryId;
  set categoryId(int? categoryId) => _$this._categoryId = categoryId;

  ListBuilder<BannerModel>? _banners;
  ListBuilder<BannerModel> get banners =>
      _$this._banners ??= ListBuilder<BannerModel>();
  set banners(ListBuilder<BannerModel>? banners) => _$this._banners = banners;

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
      _categoryId = $v.categoryId;
      _banners = $v.banners.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ContentModel other) {
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
          _$ContentModel._(
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
            categoryId: categoryId,
            banners: banners.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'images';
        images.build();
        _$failedField = 'children';
        children.build();

        _$failedField = 'banners';
        banners.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ContentModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$BannerModel extends BannerModel {
  @override
  final String name;
  @override
  final String image;
  @override
  final String imageMobile;
  @override
  final String link;
  @override
  final String buttonText;
  @override
  final bool horizontal;

  factory _$BannerModel([void Function(BannerModelBuilder)? updates]) =>
      (BannerModelBuilder()..update(updates))._build();

  _$BannerModel._(
      {required this.name,
      required this.image,
      required this.imageMobile,
      required this.link,
      required this.buttonText,
      required this.horizontal})
      : super._();
  @override
  BannerModel rebuild(void Function(BannerModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BannerModelBuilder toBuilder() => BannerModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BannerModel &&
        name == other.name &&
        image == other.image &&
        imageMobile == other.imageMobile &&
        link == other.link &&
        buttonText == other.buttonText &&
        horizontal == other.horizontal;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jc(_$hash, imageMobile.hashCode);
    _$hash = $jc(_$hash, link.hashCode);
    _$hash = $jc(_$hash, buttonText.hashCode);
    _$hash = $jc(_$hash, horizontal.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BannerModel')
          ..add('name', name)
          ..add('image', image)
          ..add('imageMobile', imageMobile)
          ..add('link', link)
          ..add('buttonText', buttonText)
          ..add('horizontal', horizontal))
        .toString();
  }
}

class BannerModelBuilder implements Builder<BannerModel, BannerModelBuilder> {
  _$BannerModel? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  String? _imageMobile;
  String? get imageMobile => _$this._imageMobile;
  set imageMobile(String? imageMobile) => _$this._imageMobile = imageMobile;

  String? _link;
  String? get link => _$this._link;
  set link(String? link) => _$this._link = link;

  String? _buttonText;
  String? get buttonText => _$this._buttonText;
  set buttonText(String? buttonText) => _$this._buttonText = buttonText;

  bool? _horizontal;
  bool? get horizontal => _$this._horizontal;
  set horizontal(bool? horizontal) => _$this._horizontal = horizontal;

  BannerModelBuilder();

  BannerModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _image = $v.image;
      _imageMobile = $v.imageMobile;
      _link = $v.link;
      _buttonText = $v.buttonText;
      _horizontal = $v.horizontal;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BannerModel other) {
    _$v = other as _$BannerModel;
  }

  @override
  void update(void Function(BannerModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BannerModel build() => _build();

  _$BannerModel _build() {
    final _$result = _$v ??
        _$BannerModel._(
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'BannerModel', 'name'),
          image: BuiltValueNullFieldError.checkNotNull(
              image, r'BannerModel', 'image'),
          imageMobile: BuiltValueNullFieldError.checkNotNull(
              imageMobile, r'BannerModel', 'imageMobile'),
          link: BuiltValueNullFieldError.checkNotNull(
              link, r'BannerModel', 'link'),
          buttonText: BuiltValueNullFieldError.checkNotNull(
              buttonText, r'BannerModel', 'buttonText'),
          horizontal: BuiltValueNullFieldError.checkNotNull(
              horizontal, r'BannerModel', 'horizontal'),
        );
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
      (ChildContentModelBuilder()..update(updates))._build();

  _$ChildContentModel._(
      {required this.id,
      required this.title,
      required this.description,
      required this.primaryImage,
      required this.createDate})
      : super._();
  @override
  ChildContentModel rebuild(void Function(ChildContentModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChildContentModelBuilder toBuilder() =>
      ChildContentModelBuilder()..replace(this);

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
        _$ChildContentModel._(
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
  final String? name;
  @override
  final String description;
  @override
  final String about;
  @override
  final String history;
  @override
  final String mission;
  @override
  final BuiltList<String>? licenses;

  factory _$MedionModel([void Function(MedionModelBuilder)? updates]) =>
      (MedionModelBuilder()..update(updates))._build();

  _$MedionModel._(
      {this.name,
      required this.description,
      required this.about,
      required this.history,
      required this.mission,
      this.licenses})
      : super._();
  @override
  MedionModel rebuild(void Function(MedionModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MedionModelBuilder toBuilder() => MedionModelBuilder()..replace(this);

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
      _$this._licenses ??= ListBuilder<String>();
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
      _licenses = $v.licenses?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MedionModel other) {
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
          _$MedionModel._(
            name: name,
            description: BuiltValueNullFieldError.checkNotNull(
                description, r'MedionModel', 'description'),
            about: BuiltValueNullFieldError.checkNotNull(
                about, r'MedionModel', 'about'),
            history: BuiltValueNullFieldError.checkNotNull(
                history, r'MedionModel', 'history'),
            mission: BuiltValueNullFieldError.checkNotNull(
                mission, r'MedionModel', 'mission'),
            licenses: _licenses?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'licenses';
        _licenses?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
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
  final String? offerta;
  @override
  final String? companyName;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final String? icon;

  factory _$OfferModel([void Function(OfferModelBuilder)? updates]) =>
      (OfferModelBuilder()..update(updates))._build();

  _$OfferModel._(
      {this.offerta, this.companyName, this.name, this.description, this.icon})
      : super._();
  @override
  OfferModel rebuild(void Function(OfferModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OfferModelBuilder toBuilder() => OfferModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OfferModel &&
        offerta == other.offerta &&
        companyName == other.companyName &&
        name == other.name &&
        description == other.description &&
        icon == other.icon;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, offerta.hashCode);
    _$hash = $jc(_$hash, companyName.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, icon.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OfferModel')
          ..add('offerta', offerta)
          ..add('companyName', companyName)
          ..add('name', name)
          ..add('description', description)
          ..add('icon', icon))
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

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _icon;
  String? get icon => _$this._icon;
  set icon(String? icon) => _$this._icon = icon;

  OfferModelBuilder();

  OfferModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _offerta = $v.offerta;
      _companyName = $v.companyName;
      _name = $v.name;
      _description = $v.description;
      _icon = $v.icon;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OfferModel other) {
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
        _$OfferModel._(
          offerta: offerta,
          companyName: companyName,
          name: name,
          description: description,
          icon: icon,
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
      (PrivacyModelBuilder()..update(updates))._build();

  _$PrivacyModel._({this.privacy, required this.companyName}) : super._();
  @override
  PrivacyModel rebuild(void Function(PrivacyModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PrivacyModelBuilder toBuilder() => PrivacyModelBuilder()..replace(this);

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
        _$PrivacyModel._(
          privacy: privacy,
          companyName: BuiltValueNullFieldError.checkNotNull(
              companyName, r'PrivacyModel', 'companyName'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$ReviewModel extends ReviewModel {
  @override
  final BuiltList<ReviewInfoModel> categories;
  @override
  final BuiltList<ReviewInfoModel> branches;
  @override
  final BuiltList<String> source;
  @override
  final BuiltList<GetReviewModel> reviews;

  factory _$ReviewModel([void Function(ReviewModelBuilder)? updates]) =>
      (ReviewModelBuilder()..update(updates))._build();

  _$ReviewModel._(
      {required this.categories,
      required this.branches,
      required this.source,
      required this.reviews})
      : super._();
  @override
  ReviewModel rebuild(void Function(ReviewModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReviewModelBuilder toBuilder() => ReviewModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReviewModel &&
        categories == other.categories &&
        branches == other.branches &&
        source == other.source &&
        reviews == other.reviews;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, categories.hashCode);
    _$hash = $jc(_$hash, branches.hashCode);
    _$hash = $jc(_$hash, source.hashCode);
    _$hash = $jc(_$hash, reviews.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReviewModel')
          ..add('categories', categories)
          ..add('branches', branches)
          ..add('source', source)
          ..add('reviews', reviews))
        .toString();
  }
}

class ReviewModelBuilder implements Builder<ReviewModel, ReviewModelBuilder> {
  _$ReviewModel? _$v;

  ListBuilder<ReviewInfoModel>? _categories;
  ListBuilder<ReviewInfoModel> get categories =>
      _$this._categories ??= ListBuilder<ReviewInfoModel>();
  set categories(ListBuilder<ReviewInfoModel>? categories) =>
      _$this._categories = categories;

  ListBuilder<ReviewInfoModel>? _branches;
  ListBuilder<ReviewInfoModel> get branches =>
      _$this._branches ??= ListBuilder<ReviewInfoModel>();
  set branches(ListBuilder<ReviewInfoModel>? branches) =>
      _$this._branches = branches;

  ListBuilder<String>? _source;
  ListBuilder<String> get source => _$this._source ??= ListBuilder<String>();
  set source(ListBuilder<String>? source) => _$this._source = source;

  ListBuilder<GetReviewModel>? _reviews;
  ListBuilder<GetReviewModel> get reviews =>
      _$this._reviews ??= ListBuilder<GetReviewModel>();
  set reviews(ListBuilder<GetReviewModel>? reviews) =>
      _$this._reviews = reviews;

  ReviewModelBuilder();

  ReviewModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _categories = $v.categories.toBuilder();
      _branches = $v.branches.toBuilder();
      _source = $v.source.toBuilder();
      _reviews = $v.reviews.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReviewModel other) {
    _$v = other as _$ReviewModel;
  }

  @override
  void update(void Function(ReviewModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReviewModel build() => _build();

  _$ReviewModel _build() {
    _$ReviewModel _$result;
    try {
      _$result = _$v ??
          _$ReviewModel._(
            categories: categories.build(),
            branches: branches.build(),
            source: source.build(),
            reviews: reviews.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'categories';
        categories.build();
        _$failedField = 'branches';
        branches.build();
        _$failedField = 'source';
        source.build();
        _$failedField = 'reviews';
        reviews.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'ReviewModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ReviewInfoModel extends ReviewInfoModel {
  @override
  final int? id;
  @override
  final String? name;

  factory _$ReviewInfoModel([void Function(ReviewInfoModelBuilder)? updates]) =>
      (ReviewInfoModelBuilder()..update(updates))._build();

  _$ReviewInfoModel._({this.id, this.name}) : super._();
  @override
  ReviewInfoModel rebuild(void Function(ReviewInfoModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReviewInfoModelBuilder toBuilder() => ReviewInfoModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReviewInfoModel && id == other.id && name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReviewInfoModel')
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class ReviewInfoModelBuilder
    implements Builder<ReviewInfoModel, ReviewInfoModelBuilder> {
  _$ReviewInfoModel? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  ReviewInfoModelBuilder();

  ReviewInfoModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReviewInfoModel other) {
    _$v = other as _$ReviewInfoModel;
  }

  @override
  void update(void Function(ReviewInfoModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReviewInfoModel build() => _build();

  _$ReviewInfoModel _build() {
    final _$result = _$v ??
        _$ReviewInfoModel._(
          id: id,
          name: name,
        );
    replace(_$result);
    return _$result;
  }
}

class _$GetReviewModel extends GetReviewModel {
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
  final String? location;
  @override
  final int? doctorId;
  @override
  final String? doctorName;
  @override
  final String? doctorJobName;
  @override
  final String? doctorImage;
  @override
  final String? dateTime;
  @override
  final String? patientName;
  @override
  final String? integratorLogoUrl;

  factory _$GetReviewModel([void Function(GetReviewModelBuilder)? updates]) =>
      (GetReviewModelBuilder()..update(updates))._build();

  _$GetReviewModel._(
      {this.id,
      this.ratings,
      this.review,
      this.companyId,
      this.companyName,
      this.companyLogoUrl,
      this.state,
      this.location,
      this.doctorId,
      this.doctorName,
      this.doctorJobName,
      this.doctorImage,
      this.dateTime,
      this.patientName,
      this.integratorLogoUrl})
      : super._();
  @override
  GetReviewModel rebuild(void Function(GetReviewModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetReviewModelBuilder toBuilder() => GetReviewModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetReviewModel &&
        id == other.id &&
        ratings == other.ratings &&
        review == other.review &&
        companyId == other.companyId &&
        companyName == other.companyName &&
        companyLogoUrl == other.companyLogoUrl &&
        state == other.state &&
        location == other.location &&
        doctorId == other.doctorId &&
        doctorName == other.doctorName &&
        doctorJobName == other.doctorJobName &&
        doctorImage == other.doctorImage &&
        dateTime == other.dateTime &&
        patientName == other.patientName &&
        integratorLogoUrl == other.integratorLogoUrl;
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
    _$hash = $jc(_$hash, location.hashCode);
    _$hash = $jc(_$hash, doctorId.hashCode);
    _$hash = $jc(_$hash, doctorName.hashCode);
    _$hash = $jc(_$hash, doctorJobName.hashCode);
    _$hash = $jc(_$hash, doctorImage.hashCode);
    _$hash = $jc(_$hash, dateTime.hashCode);
    _$hash = $jc(_$hash, patientName.hashCode);
    _$hash = $jc(_$hash, integratorLogoUrl.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GetReviewModel')
          ..add('id', id)
          ..add('ratings', ratings)
          ..add('review', review)
          ..add('companyId', companyId)
          ..add('companyName', companyName)
          ..add('companyLogoUrl', companyLogoUrl)
          ..add('state', state)
          ..add('location', location)
          ..add('doctorId', doctorId)
          ..add('doctorName', doctorName)
          ..add('doctorJobName', doctorJobName)
          ..add('doctorImage', doctorImage)
          ..add('dateTime', dateTime)
          ..add('patientName', patientName)
          ..add('integratorLogoUrl', integratorLogoUrl))
        .toString();
  }
}

class GetReviewModelBuilder
    implements Builder<GetReviewModel, GetReviewModelBuilder> {
  _$GetReviewModel? _$v;

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

  String? _location;
  String? get location => _$this._location;
  set location(String? location) => _$this._location = location;

  int? _doctorId;
  int? get doctorId => _$this._doctorId;
  set doctorId(int? doctorId) => _$this._doctorId = doctorId;

  String? _doctorName;
  String? get doctorName => _$this._doctorName;
  set doctorName(String? doctorName) => _$this._doctorName = doctorName;

  String? _doctorJobName;
  String? get doctorJobName => _$this._doctorJobName;
  set doctorJobName(String? doctorJobName) =>
      _$this._doctorJobName = doctorJobName;

  String? _doctorImage;
  String? get doctorImage => _$this._doctorImage;
  set doctorImage(String? doctorImage) => _$this._doctorImage = doctorImage;

  String? _dateTime;
  String? get dateTime => _$this._dateTime;
  set dateTime(String? dateTime) => _$this._dateTime = dateTime;

  String? _patientName;
  String? get patientName => _$this._patientName;
  set patientName(String? patientName) => _$this._patientName = patientName;

  String? _integratorLogoUrl;
  String? get integratorLogoUrl => _$this._integratorLogoUrl;
  set integratorLogoUrl(String? integratorLogoUrl) =>
      _$this._integratorLogoUrl = integratorLogoUrl;

  GetReviewModelBuilder();

  GetReviewModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _ratings = $v.ratings;
      _review = $v.review;
      _companyId = $v.companyId;
      _companyName = $v.companyName;
      _companyLogoUrl = $v.companyLogoUrl;
      _state = $v.state;
      _location = $v.location;
      _doctorId = $v.doctorId;
      _doctorName = $v.doctorName;
      _doctorJobName = $v.doctorJobName;
      _doctorImage = $v.doctorImage;
      _dateTime = $v.dateTime;
      _patientName = $v.patientName;
      _integratorLogoUrl = $v.integratorLogoUrl;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetReviewModel other) {
    _$v = other as _$GetReviewModel;
  }

  @override
  void update(void Function(GetReviewModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetReviewModel build() => _build();

  _$GetReviewModel _build() {
    final _$result = _$v ??
        _$GetReviewModel._(
          id: id,
          ratings: ratings,
          review: review,
          companyId: companyId,
          companyName: companyName,
          companyLogoUrl: companyLogoUrl,
          state: state,
          location: location,
          doctorId: doctorId,
          doctorName: doctorName,
          doctorJobName: doctorJobName,
          doctorImage: doctorImage,
          dateTime: dateTime,
          patientName: patientName,
          integratorLogoUrl: integratorLogoUrl,
        );
    replace(_$result);
    return _$result;
  }
}

class _$PostReviewModel extends PostReviewModel {
  @override
  final bool? isAnonym;
  @override
  final int? companyId;
  @override
  final String? ratings;
  @override
  final String? review;

  factory _$PostReviewModel([void Function(PostReviewModelBuilder)? updates]) =>
      (PostReviewModelBuilder()..update(updates))._build();

  _$PostReviewModel._(
      {this.isAnonym, this.companyId, this.ratings, this.review})
      : super._();
  @override
  PostReviewModel rebuild(void Function(PostReviewModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PostReviewModelBuilder toBuilder() => PostReviewModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PostReviewModel &&
        isAnonym == other.isAnonym &&
        companyId == other.companyId &&
        ratings == other.ratings &&
        review == other.review;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, isAnonym.hashCode);
    _$hash = $jc(_$hash, companyId.hashCode);
    _$hash = $jc(_$hash, ratings.hashCode);
    _$hash = $jc(_$hash, review.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PostReviewModel')
          ..add('isAnonym', isAnonym)
          ..add('companyId', companyId)
          ..add('ratings', ratings)
          ..add('review', review))
        .toString();
  }
}

class PostReviewModelBuilder
    implements Builder<PostReviewModel, PostReviewModelBuilder> {
  _$PostReviewModel? _$v;

  bool? _isAnonym;
  bool? get isAnonym => _$this._isAnonym;
  set isAnonym(bool? isAnonym) => _$this._isAnonym = isAnonym;

  int? _companyId;
  int? get companyId => _$this._companyId;
  set companyId(int? companyId) => _$this._companyId = companyId;

  String? _ratings;
  String? get ratings => _$this._ratings;
  set ratings(String? ratings) => _$this._ratings = ratings;

  String? _review;
  String? get review => _$this._review;
  set review(String? review) => _$this._review = review;

  PostReviewModelBuilder();

  PostReviewModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isAnonym = $v.isAnonym;
      _companyId = $v.companyId;
      _ratings = $v.ratings;
      _review = $v.review;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PostReviewModel other) {
    _$v = other as _$PostReviewModel;
  }

  @override
  void update(void Function(PostReviewModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PostReviewModel build() => _build();

  _$PostReviewModel _build() {
    final _$result = _$v ??
        _$PostReviewModel._(
          isAnonym: isAnonym,
          companyId: companyId,
          ratings: ratings,
          review: review,
        );
    replace(_$result);
    return _$result;
  }
}

class _$PostReviewResult extends PostReviewResult {
  @override
  final String? status;
  @override
  final String? message;

  factory _$PostReviewResult(
          [void Function(PostReviewResultBuilder)? updates]) =>
      (PostReviewResultBuilder()..update(updates))._build();

  _$PostReviewResult._({this.status, this.message}) : super._();
  @override
  PostReviewResult rebuild(void Function(PostReviewResultBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PostReviewResultBuilder toBuilder() =>
      PostReviewResultBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PostReviewResult &&
        status == other.status &&
        message == other.message;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PostReviewResult')
          ..add('status', status)
          ..add('message', message))
        .toString();
  }
}

class PostReviewResultBuilder
    implements Builder<PostReviewResult, PostReviewResultBuilder> {
  _$PostReviewResult? _$v;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  PostReviewResultBuilder();

  PostReviewResultBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _status = $v.status;
      _message = $v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PostReviewResult other) {
    _$v = other as _$PostReviewResult;
  }

  @override
  void update(void Function(PostReviewResultBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PostReviewResult build() => _build();

  _$PostReviewResult _build() {
    final _$result = _$v ??
        _$PostReviewResult._(
          status: status,
          message: message,
        );
    replace(_$result);
    return _$result;
  }
}

class _$PostVisitReviewModel extends PostVisitReviewModel {
  @override
  final String? ratings;
  @override
  final String? review;
  @override
  final int? visitId;

  factory _$PostVisitReviewModel(
          [void Function(PostVisitReviewModelBuilder)? updates]) =>
      (PostVisitReviewModelBuilder()..update(updates))._build();

  _$PostVisitReviewModel._({this.ratings, this.review, this.visitId})
      : super._();
  @override
  PostVisitReviewModel rebuild(
          void Function(PostVisitReviewModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PostVisitReviewModelBuilder toBuilder() =>
      PostVisitReviewModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PostVisitReviewModel &&
        ratings == other.ratings &&
        review == other.review &&
        visitId == other.visitId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, ratings.hashCode);
    _$hash = $jc(_$hash, review.hashCode);
    _$hash = $jc(_$hash, visitId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PostVisitReviewModel')
          ..add('ratings', ratings)
          ..add('review', review)
          ..add('visitId', visitId))
        .toString();
  }
}

class PostVisitReviewModelBuilder
    implements Builder<PostVisitReviewModel, PostVisitReviewModelBuilder> {
  _$PostVisitReviewModel? _$v;

  String? _ratings;
  String? get ratings => _$this._ratings;
  set ratings(String? ratings) => _$this._ratings = ratings;

  String? _review;
  String? get review => _$this._review;
  set review(String? review) => _$this._review = review;

  int? _visitId;
  int? get visitId => _$this._visitId;
  set visitId(int? visitId) => _$this._visitId = visitId;

  PostVisitReviewModelBuilder();

  PostVisitReviewModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ratings = $v.ratings;
      _review = $v.review;
      _visitId = $v.visitId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PostVisitReviewModel other) {
    _$v = other as _$PostVisitReviewModel;
  }

  @override
  void update(void Function(PostVisitReviewModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PostVisitReviewModel build() => _build();

  _$PostVisitReviewModel _build() {
    final _$result = _$v ??
        _$PostVisitReviewModel._(
          ratings: ratings,
          review: review,
          visitId: visitId,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
