// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BranchModel> _$branchModelSerializer = new _$BranchModelSerializer();
Serializer<BranchDetailModel> _$branchDetailModelSerializer =
    new _$BranchDetailModelSerializer();
Serializer<OffersModel> _$offersModelSerializer = new _$OffersModelSerializer();
Serializer<AwardsModel> _$awardsModelSerializer = new _$AwardsModelSerializer();
Serializer<EducationModel> _$educationModelSerializer =
    new _$EducationModelSerializer();
Serializer<StudyLead> _$studyLeadSerializer = new _$StudyLeadSerializer();
Serializer<StudyLeadResult> _$studyLeadResultSerializer =
    new _$StudyLeadResultSerializer();
Serializer<Course> _$courseSerializer = new _$CourseSerializer();
Serializer<ContentModel> _$contentModelSerializer =
    new _$ContentModelSerializer();
Serializer<ChildContentModel> _$childContentModelSerializer =
    new _$ChildContentModelSerializer();
Serializer<MedionModel> _$medionModelSerializer = new _$MedionModelSerializer();
Serializer<OfferModel> _$offerModelSerializer = new _$OfferModelSerializer();
Serializer<GetReviewModel> _$getReviewModelSerializer =
    new _$GetReviewModelSerializer();
Serializer<PostReviewModel> _$postReviewModelSerializer =
    new _$PostReviewModelSerializer();
Serializer<PostReviewResult> _$postReviewResultSerializer =
    new _$PostReviewResultSerializer();
Serializer<PostVisitReviewModel> _$postVisitReviewModelSerializer =
    new _$PostVisitReviewModelSerializer();

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
    value = object.offers;
    if (value != null) {
      result
        ..add('offers')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(OffersModel)])));
    }
    return result;
  }

  @override
  BranchDetailModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BranchDetailModelBuilder();

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
                      BuiltList, const [const FullType(OffersModel)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$OffersModelSerializer implements StructuredSerializer<OffersModel> {
  @override
  final Iterable<Type> types = const [OffersModel, _$OffersModel];
  @override
  final String wireName = 'OffersModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, OffersModel object,
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
  OffersModel deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OffersModelBuilder();

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
        case 'icon':
          result.icon = serializers.deserialize(value,
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
    final result = new StudyLeadBuilder();

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
    final result = new StudyLeadResultBuilder();

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
    final result = new MedionModelBuilder();

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
    final result = new OfferModelBuilder();

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
    value = object.title;
    if (value != null) {
      result
        ..add('title')
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
    value = object.location;
    if (value != null) {
      result
        ..add('address')
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
    value = object.doctorId;
    if (value != null) {
      result
        ..add('doctor_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.serviceId;
    if (value != null) {
      result
        ..add('service_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.partnerId;
    if (value != null) {
      result
        ..add('partner_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.isAnonym;
    if (value != null) {
      result
        ..add('is_anonym')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.address;
    if (value != null) {
      result
        ..add('address')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createDate;
    if (value != null) {
      result
        ..add('create_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GetReviewModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GetReviewModelBuilder();

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
        case 'create_date':
          result.dateTime = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'address':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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
        case 'doctor_id':
          result.doctorId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'service_id':
          result.serviceId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'partner_id':
          result.partnerId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'is_anonym':
          result.isAnonym = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'create_date':
          result.createDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
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
    final result = new PostReviewModelBuilder();

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
    final result = new PostReviewResultBuilder();

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
    final result = new PostVisitReviewModelBuilder();

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
      this.description,
      this.title,
      this.workingAllDays,
      this.extraDescription,
      this.ourOffer,
      this.icon,
      this.licenses})
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
      _$this._workDays ??= new ListBuilder<String>();
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
      _$this._ourOffer ??= new ListBuilder<OfferModel>();
  set ourOffer(ListBuilder<OfferModel>? ourOffer) =>
      _$this._ourOffer = ourOffer;

  String? _icon;
  String? get icon => _$this._icon;
  set icon(String? icon) => _$this._icon = icon;

  ListBuilder<String>? _licenses;
  ListBuilder<String> get licenses =>
      _$this._licenses ??= new ListBuilder<String>();
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
        throw new BuiltValueNestedFieldError(
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
  final BuiltList<OffersModel>? offers;

  factory _$BranchDetailModel(
          [void Function(BranchDetailModelBuilder)? updates]) =>
      (new BranchDetailModelBuilder()..update(updates))._build();

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
      this.offers})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'BranchDetailModel', 'id');
    BuiltValueNullFieldError.checkNotNull(
        latitude, r'BranchDetailModel', 'latitude');
    BuiltValueNullFieldError.checkNotNull(
        longitude, r'BranchDetailModel', 'longitude');
  }

  @override
  BranchDetailModel rebuild(void Function(BranchDetailModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BranchDetailModelBuilder toBuilder() =>
      new BranchDetailModelBuilder()..replace(this);

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
      _$this._licenses ??= new ListBuilder<String>();
  set licenses(ListBuilder<String>? licenses) => _$this._licenses = licenses;

  ListBuilder<String>? _images;
  ListBuilder<String> get images =>
      _$this._images ??= new ListBuilder<String>();
  set images(ListBuilder<String>? images) => _$this._images = images;

  double? _latitude;
  double? get latitude => _$this._latitude;
  set latitude(double? latitude) => _$this._latitude = latitude;

  double? _longitude;
  double? get longitude => _$this._longitude;
  set longitude(double? longitude) => _$this._longitude = longitude;

  ListBuilder<dynamic>? _video;
  ListBuilder<dynamic> get video =>
      _$this._video ??= new ListBuilder<dynamic>();
  set video(ListBuilder<dynamic>? video) => _$this._video = video;

  ListBuilder<String>? _workDays;
  ListBuilder<String> get workDays =>
      _$this._workDays ??= new ListBuilder<String>();
  set workDays(ListBuilder<String>? workDays) => _$this._workDays = workDays;

  ListBuilder<OffersModel>? _offers;
  ListBuilder<OffersModel> get offers =>
      _$this._offers ??= new ListBuilder<OffersModel>();
  set offers(ListBuilder<OffersModel>? offers) => _$this._offers = offers;

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
      _offers = $v.offers?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BranchDetailModel other) {
    ArgumentError.checkNotNull(other, 'other');
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
          new _$BranchDetailModel._(
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
            offers: _offers?.build(),
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
        _offers?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'BranchDetailModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$OffersModel extends OffersModel {
  @override
  final String? name;
  @override
  final String? description;
  @override
  final String? icon;

  factory _$OffersModel([void Function(OffersModelBuilder)? updates]) =>
      (new OffersModelBuilder()..update(updates))._build();

  _$OffersModel._({this.name, this.description, this.icon}) : super._();

  @override
  OffersModel rebuild(void Function(OffersModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OffersModelBuilder toBuilder() => new OffersModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OffersModel &&
        name == other.name &&
        description == other.description &&
        icon == other.icon;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, icon.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OffersModel')
          ..add('name', name)
          ..add('description', description)
          ..add('icon', icon))
        .toString();
  }
}

class OffersModelBuilder implements Builder<OffersModel, OffersModelBuilder> {
  _$OffersModel? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _icon;
  String? get icon => _$this._icon;
  set icon(String? icon) => _$this._icon = icon;

  OffersModelBuilder();

  OffersModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _description = $v.description;
      _icon = $v.icon;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OffersModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OffersModel;
  }

  @override
  void update(void Function(OffersModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OffersModel build() => _build();

  _$OffersModel _build() {
    final _$result = _$v ??
        new _$OffersModel._(
          name: name,
          description: description,
          icon: icon,
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
      (new EducationModelBuilder()..update(updates))._build();

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
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        companyId, r'EducationModel', 'companyId');
  }

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
  ListBuilder<Course> get courses =>
      _$this._courses ??= new ListBuilder<Course>();
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
        throw new BuiltValueNestedFieldError(
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
      (new StudyLeadBuilder()..update(updates))._build();

  _$StudyLead._(
      {required this.name,
      required this.phone,
      required this.companyId,
      required this.courseId})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'StudyLead', 'name');
    BuiltValueNullFieldError.checkNotNull(phone, r'StudyLead', 'phone');
    BuiltValueNullFieldError.checkNotNull(companyId, r'StudyLead', 'companyId');
    BuiltValueNullFieldError.checkNotNull(courseId, r'StudyLead', 'courseId');
  }

  @override
  StudyLead rebuild(void Function(StudyLeadBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StudyLeadBuilder toBuilder() => new StudyLeadBuilder()..replace(this);

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
    ArgumentError.checkNotNull(other, 'other');
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
        new _$StudyLead._(
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
      (new StudyLeadResultBuilder()..update(updates))._build();

  _$StudyLeadResult._({required this.status}) : super._() {
    BuiltValueNullFieldError.checkNotNull(status, r'StudyLeadResult', 'status');
  }

  @override
  StudyLeadResult rebuild(void Function(StudyLeadResultBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StudyLeadResultBuilder toBuilder() =>
      new StudyLeadResultBuilder()..replace(this);

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
    ArgumentError.checkNotNull(other, 'other');
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
        new _$StudyLeadResult._(
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
      (new MedionModelBuilder()..update(updates))._build();

  _$MedionModel._(
      {this.name,
      required this.description,
      required this.about,
      required this.history,
      required this.mission,
      this.licenses})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        description, r'MedionModel', 'description');
    BuiltValueNullFieldError.checkNotNull(about, r'MedionModel', 'about');
    BuiltValueNullFieldError.checkNotNull(history, r'MedionModel', 'history');
    BuiltValueNullFieldError.checkNotNull(mission, r'MedionModel', 'mission');
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
      _licenses = $v.licenses?.toBuilder();
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
      (new OfferModelBuilder()..update(updates))._build();

  _$OfferModel._(
      {this.offerta, this.companyName, this.name, this.description, this.icon})
      : super._();

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

class _$GetReviewModel extends GetReviewModel {
  @override
  final int? id;
  @override
  final String? title;
  @override
  final String? dateTime;
  @override
  final String? location;
  @override
  final String? name;
  @override
  final String? ratings;
  @override
  final String? review;
  @override
  final int? companyId;
  @override
  final int? doctorId;
  @override
  final int? serviceId;
  @override
  final int? partnerId;
  @override
  final bool? isAnonym;
  @override
  final String? address;
  @override
  final String? createDate;
  @override
  final String? status;

  factory _$GetReviewModel([void Function(GetReviewModelBuilder)? updates]) =>
      (new GetReviewModelBuilder()..update(updates))._build();

  _$GetReviewModel._(
      {this.id,
      this.title,
      this.dateTime,
      this.location,
      this.name,
      this.ratings,
      this.review,
      this.companyId,
      this.doctorId,
      this.serviceId,
      this.partnerId,
      this.isAnonym,
      this.address,
      this.createDate,
      this.status})
      : super._();

  @override
  GetReviewModel rebuild(void Function(GetReviewModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetReviewModelBuilder toBuilder() =>
      new GetReviewModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetReviewModel &&
        id == other.id &&
        title == other.title &&
        dateTime == other.dateTime &&
        location == other.location &&
        name == other.name &&
        ratings == other.ratings &&
        review == other.review &&
        companyId == other.companyId &&
        doctorId == other.doctorId &&
        serviceId == other.serviceId &&
        partnerId == other.partnerId &&
        isAnonym == other.isAnonym &&
        address == other.address &&
        createDate == other.createDate &&
        status == other.status;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, dateTime.hashCode);
    _$hash = $jc(_$hash, location.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, ratings.hashCode);
    _$hash = $jc(_$hash, review.hashCode);
    _$hash = $jc(_$hash, companyId.hashCode);
    _$hash = $jc(_$hash, doctorId.hashCode);
    _$hash = $jc(_$hash, serviceId.hashCode);
    _$hash = $jc(_$hash, partnerId.hashCode);
    _$hash = $jc(_$hash, isAnonym.hashCode);
    _$hash = $jc(_$hash, address.hashCode);
    _$hash = $jc(_$hash, createDate.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GetReviewModel')
          ..add('id', id)
          ..add('title', title)
          ..add('dateTime', dateTime)
          ..add('location', location)
          ..add('name', name)
          ..add('ratings', ratings)
          ..add('review', review)
          ..add('companyId', companyId)
          ..add('doctorId', doctorId)
          ..add('serviceId', serviceId)
          ..add('partnerId', partnerId)
          ..add('isAnonym', isAnonym)
          ..add('address', address)
          ..add('createDate', createDate)
          ..add('status', status))
        .toString();
  }
}

class GetReviewModelBuilder
    implements Builder<GetReviewModel, GetReviewModelBuilder> {
  _$GetReviewModel? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _dateTime;
  String? get dateTime => _$this._dateTime;
  set dateTime(String? dateTime) => _$this._dateTime = dateTime;

  String? _location;
  String? get location => _$this._location;
  set location(String? location) => _$this._location = location;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _ratings;
  String? get ratings => _$this._ratings;
  set ratings(String? ratings) => _$this._ratings = ratings;

  String? _review;
  String? get review => _$this._review;
  set review(String? review) => _$this._review = review;

  int? _companyId;
  int? get companyId => _$this._companyId;
  set companyId(int? companyId) => _$this._companyId = companyId;

  int? _doctorId;
  int? get doctorId => _$this._doctorId;
  set doctorId(int? doctorId) => _$this._doctorId = doctorId;

  int? _serviceId;
  int? get serviceId => _$this._serviceId;
  set serviceId(int? serviceId) => _$this._serviceId = serviceId;

  int? _partnerId;
  int? get partnerId => _$this._partnerId;
  set partnerId(int? partnerId) => _$this._partnerId = partnerId;

  bool? _isAnonym;
  bool? get isAnonym => _$this._isAnonym;
  set isAnonym(bool? isAnonym) => _$this._isAnonym = isAnonym;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  String? _createDate;
  String? get createDate => _$this._createDate;
  set createDate(String? createDate) => _$this._createDate = createDate;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  GetReviewModelBuilder();

  GetReviewModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _title = $v.title;
      _dateTime = $v.dateTime;
      _location = $v.location;
      _name = $v.name;
      _ratings = $v.ratings;
      _review = $v.review;
      _companyId = $v.companyId;
      _doctorId = $v.doctorId;
      _serviceId = $v.serviceId;
      _partnerId = $v.partnerId;
      _isAnonym = $v.isAnonym;
      _address = $v.address;
      _createDate = $v.createDate;
      _status = $v.status;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetReviewModel other) {
    ArgumentError.checkNotNull(other, 'other');
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
        new _$GetReviewModel._(
          id: id,
          title: title,
          dateTime: dateTime,
          location: location,
          name: name,
          ratings: ratings,
          review: review,
          companyId: companyId,
          doctorId: doctorId,
          serviceId: serviceId,
          partnerId: partnerId,
          isAnonym: isAnonym,
          address: address,
          createDate: createDate,
          status: status,
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
      (new PostReviewModelBuilder()..update(updates))._build();

  _$PostReviewModel._(
      {this.isAnonym, this.companyId, this.ratings, this.review})
      : super._();

  @override
  PostReviewModel rebuild(void Function(PostReviewModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PostReviewModelBuilder toBuilder() =>
      new PostReviewModelBuilder()..replace(this);

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
    ArgumentError.checkNotNull(other, 'other');
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
        new _$PostReviewModel._(
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
      (new PostReviewResultBuilder()..update(updates))._build();

  _$PostReviewResult._({this.status, this.message}) : super._();

  @override
  PostReviewResult rebuild(void Function(PostReviewResultBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PostReviewResultBuilder toBuilder() =>
      new PostReviewResultBuilder()..replace(this);

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
    ArgumentError.checkNotNull(other, 'other');
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
        new _$PostReviewResult._(
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
      (new PostVisitReviewModelBuilder()..update(updates))._build();

  _$PostVisitReviewModel._({this.ratings, this.review, this.visitId})
      : super._();

  @override
  PostVisitReviewModel rebuild(
          void Function(PostVisitReviewModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PostVisitReviewModelBuilder toBuilder() =>
      new PostVisitReviewModelBuilder()..replace(this);

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
    ArgumentError.checkNotNull(other, 'other');
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
        new _$PostVisitReviewModel._(
          ratings: ratings,
          review: review,
          visitId: visitId,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
