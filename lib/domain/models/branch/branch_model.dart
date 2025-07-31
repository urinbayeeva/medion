import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:chopper/chopper.dart';
import 'package:medion/utils/helpers/decode_html.dart';

part 'branch_model.g.dart';

abstract class BranchModel implements Built<BranchModel, BranchModelBuilder> {
  BranchModel._();

  factory BranchModel([void Function(BranchModelBuilder) updates]) = _$BranchModel;

  @BuiltValueField(wireName: 'id')
  int get id;

  @BuiltValueField(wireName: 'image')
  String? get image;

  @BuiltValueField(wireName: 'name')
  String? get name;

  @BuiltValueField(wireName: 'address')
  String? get address;

  @BuiltValueField(wireName: 'phone')
  String? get phone;

  @BuiltValueField(wireName: 'latitude')
  double get latitude;

  @BuiltValueField(wireName: 'longitude')
  double get longitude;

  @BuiltValueField(wireName: 'work_time')
  String get workTime;

  @BuiltValueField(wireName: 'work_days')
  BuiltList<String>? get workDays;

  @BuiltValueField(wireName: 'description')
  String? get description;

  @BuiltValueField(wireName: 'title')
  String? get title;

  @BuiltValueField(wireName: 'working_all_days')
  bool? get workingAllDays;

  @BuiltValueField(wireName: 'extra_description')
  String? get extraDescription;

  @BuiltValueField(wireName: 'offers')
  BuiltList<OfferModel>? get ourOffer;

  @BuiltValueField(wireName: 'icon')
  String? get icon;

  @BuiltValueField(wireName: 'licenses')
  BuiltList<String>? get licenses;

  static Serializer<BranchModel> get serializer => _$branchModelSerializer;
}

abstract class BranchDetailModel implements Built<BranchDetailModel, BranchDetailModelBuilder> {
  BranchDetailModel._();

  factory BranchDetailModel([void Function(BranchDetailModelBuilder) updates]) = _$BranchDetailModel;

  @BuiltValueField(wireName: 'id')
  int get id;

  @BuiltValueField(wireName: 'name')
  String? get name;

  @BuiltValueField(wireName: 'address')
  String? get address;

  @BuiltValueField(wireName: 'phone')
  String? get phone;

  @BuiltValueField(wireName: 'work_time')
  String? get workTime;

  @BuiltValueField(wireName: 'description')
  String? get description;

  @BuiltValueField(wireName: 'working_all_days')
  bool? get workingAllDays;

  @BuiltValueField(wireName: 'licenses')
  BuiltList<String>? get licenses;

  @BuiltValueField(wireName: 'image')
  BuiltList<String>? get images;

  @BuiltValueField(wireName: 'latitude')
  double get latitude;

  @BuiltValueField(wireName: 'longitude')
  double get longitude;

  @BuiltValueField(wireName: 'video')
  BuiltList<dynamic>? get video;

  @BuiltValueField(wireName: 'work_days')
  BuiltList<String>? get workDays;

  @BuiltValueField(wireName: 'offers')
  BuiltList<OffersModel>? get offers;

  static Serializer<BranchDetailModel> get serializer => _$branchDetailModelSerializer;
}

abstract class OffersModel implements Built<OffersModel, OffersModelBuilder> {
  static Serializer<OffersModel> get serializer => _$offersModelSerializer;

  @BuiltValueField(wireName: 'name')
  String? get name;

  @BuiltValueField(wireName: 'description')
  String? get description;

  @BuiltValueField(wireName: 'icon')
  String? get icon;

  OffersModel._();

  factory OffersModel([void Function(OffersModelBuilder) updates]) = _$OffersModel;
}

abstract class AwardsModel implements Built<AwardsModel, AwardsModelBuilder> {
  static Serializer<AwardsModel> get serializer => _$awardsModelSerializer;

  @BuiltValueField(wireName: 'branch_id')
  int? get branchId;

  @BuiltValueField(wireName: 'id')
  int? get id;

  @BuiltValueField(wireName: 'title')
  String? get title;

  @BuiltValueField(wireName: 'description')
  String? get description;

  @BuiltValueField(wireName: 'image')
  String? get image;

  String get decodedTitle => decodeHtml(title);

  String get decodedDescription => decodeHtml(description);

  AwardsModel._();

  factory AwardsModel([void Function(AwardsModelBuilder) updates]) = _$AwardsModel;
}

abstract class EducationModel implements Built<EducationModel, EducationModelBuilder> {
  static Serializer<EducationModel> get serializer => _$educationModelSerializer;

  @BuiltValueField(wireName: 'name')
  String? get name;

  @BuiltValueField(wireName: 'description')
  String? get description;

  @BuiltValueField(wireName: 'mission')
  String? get mission;

  @BuiltValueField(wireName: 'values')
  String? get values;

  @BuiltValueField(wireName: 'goals')
  String? get goals;

  @BuiltValueField(wireName: 'audience')
  String? get audience;

  @BuiltValueField(wireName: 'why_us')
  String? get whyUs;

  @BuiltValueField(wireName: 'company_id')
  int get companyId;

  @BuiltValueField(wireName: 'courses')
  BuiltList<Course>? get courses;

  @BuiltValueField(wireName: 'banner_link')
  String? get bannerLink;

  @BuiltValueField(wireName: 'banner_image')
  String? get bannerImage;

  @BuiltValueField(wireName: 'mission_title')
  String? get missionTitle;

  @BuiltValueField(wireName: 'mission_icon')
  String? get missionIcon;

  @BuiltValueField(wireName: 'values_title')
  String? get valuesTitle;

  @BuiltValueField(wireName: 'values_icon')
  String? get valuesIcon;

  @BuiltValueField(wireName: 'goals_title')
  String? get goalsTitle;

  @BuiltValueField(wireName: 'goals_icon')
  String? get goalsIcon;

  @BuiltValueField(wireName: 'audience_title')
  String? get audienceTitle;

  @BuiltValueField(wireName: 'audience_icon')
  String? get audienceIcon;

  @BuiltValueField(wireName: 'why_us_title')
  String? get whyUsTitle;

  @BuiltValueField(wireName: 'why_us_icon')
  String? get whyUsIcon;

  String get decodedDescription => decodeHtml(description);

  String get decodedAudience => decodeHtml(audience);

  String get decodedValues => decodeHtml(values);

  String get decodedGoals => decodeHtml(goals);

  String get decodedWhyUs => decodeHtml(whyUs);

  String get decodedMission => decodeHtml(mission);

  EducationModel._();

  factory EducationModel([void Function(EducationModelBuilder) updates]) = _$EducationModel;
}

abstract class StudyLead implements Built<StudyLead, StudyLeadBuilder> {
  static Serializer<StudyLead> get serializer => _$studyLeadSerializer;

  @BuiltValueField(wireName: 'full_name')
  String get name;

  @BuiltValueField(wireName: 'phone')
  String get phone;

  @BuiltValueField(wireName: 'company_id')
  int get companyId;

  @BuiltValueField(wireName: 'course_id')
  int get courseId;

  StudyLead._();

  factory StudyLead([void Function(StudyLeadBuilder) updates]) = _$StudyLead;
}

abstract class StudyLeadResult implements Built<StudyLeadResult, StudyLeadResultBuilder> {
  static Serializer<StudyLeadResult> get serializer => _$studyLeadResultSerializer;

  @BuiltValueField(wireName: 'status')
  String get status;

  StudyLeadResult._();

  factory StudyLeadResult([void Function(StudyLeadResultBuilder) updates]) = _$StudyLeadResult;
}

abstract class Course implements Built<Course, CourseBuilder> {
  static Serializer<Course> get serializer => _$courseSerializer;

  @BuiltValueField(wireName: 'id')
  int? get id;

  @BuiltValueField(wireName: 'name')
  String? get name;

  @BuiltValueField(wireName: 'description')
  String? get description;

  @BuiltValueField(wireName: 'image')
  String? get image;

  Course._();

  factory Course([void Function(CourseBuilder) updates]) = _$Course;
}

abstract class ContentModel implements Built<ContentModel, ContentModelBuilder> {
  ContentModel._();

  factory ContentModel([void Function(ContentModelBuilder) updates]) = _$ContentModel;

  @BuiltValueField(wireName: 'type')
  String get type;

  @BuiltValueField(wireName: 'id')
  int get id;

  @BuiltValueField(wireName: 'create_date')
  String get createDate;

  @BuiltValueField(wireName: 'title')
  String get title;

  @BuiltValueField(wireName: 'description')
  String get description;

  @BuiltValueField(wireName: 'link')
  JsonObject get link;

  @BuiltValueField(wireName: 'primary_image')
  String get primaryImage;

  @BuiltValueField(wireName: 'images')
  BuiltList<String> get images;

  @BuiltValueField(wireName: 'children')
  BuiltList<ChildContentModel> get children;

  @BuiltValueField(wireName: 'discount_condition')
  JsonObject? get discountCondition;

  @BuiltValueField(wireName: 'discount_location')
  JsonObject? get discountLocation;

  @BuiltValueField(wireName: 'discount_start_date')
  JsonObject? get discountStartDate;

  @BuiltValueField(wireName: 'discount_end_date')
  JsonObject? get discountEndDate;

  @BuiltValueField(wireName: 'phone_number')
  JsonObject? get phoneNumber;

  @BuiltValueField(wireName: 'phone_number_short')
  JsonObject? get phoneNumberShort;

  @BuiltValueField(wireName: 'category_id')
  int? get categoryId;

  @BuiltValueField(wireName: 'banners')
  BuiltList<BannerModel> get banners;

  String get decodedTitle => decodeHtml(title);

  String get decodedDescription => decodeHtml(description);

  static Serializer<ContentModel> get serializer => _$contentModelSerializer;
}

abstract class BannerModel implements Built<BannerModel, BannerModelBuilder> {
  @BuiltValueField(wireName: 'name')
  String get name;

  @BuiltValueField(wireName: 'image')
  String get image;

  @BuiltValueField(wireName: 'image_mobile')
  String get imageMobile;

  @BuiltValueField(wireName: 'link')
  String get link;

  @BuiltValueField(wireName: 'button_text')
  String get buttonText;

  @BuiltValueField(wireName: 'horizontal')
  bool get horizontal;

  BannerModel._();

  factory BannerModel([void Function(BannerModelBuilder) updates]) = _$BannerModel;

  static Serializer<BannerModel> get serializer => _$bannerModelSerializer;
}

abstract class ChildContentModel implements Built<ChildContentModel, ChildContentModelBuilder> {
  @BuiltValueField(wireName: 'id')
  int get id;

  @BuiltValueField(wireName: 'title')
  String get title;

  @BuiltValueField(wireName: 'description')
  String get description;

  @BuiltValueField(wireName: 'primary_image')
  String get primaryImage;

  @BuiltValueField(wireName: 'create_date')
  String get createDate;

  // Add decoded getters
  String get decodedTitle => decodeHtml(title);

  String get decodedDescription => decodeHtml(description);

  ChildContentModel._();

  factory ChildContentModel([void Function(ChildContentModelBuilder) updates]) = _$ChildContentModel;

  static Serializer<ChildContentModel> get serializer => _$childContentModelSerializer;
}

abstract class MedionModel implements Built<MedionModel, MedionModelBuilder> {
  @BuiltValueField(wireName: 'name')
  String? get name;

  @BuiltValueField(wireName: 'description')
  String get description;

  @BuiltValueField(wireName: 'about')
  String get about;

  @BuiltValueField(wireName: 'history')
  String get history;

  @BuiltValueField(wireName: 'mission')
  String get mission;

  @BuiltValueField(wireName: 'licenses')
  BuiltList<String>? get licenses;

  MedionModel._();

  factory MedionModel([void Function(MedionModelBuilder) updates]) = _$MedionModel;

  static Serializer<MedionModel> get serializer => _$medionModelSerializer;
}

abstract class OfferModel implements Built<OfferModel, OfferModelBuilder> {
  @BuiltValueField(wireName: "offerta")
  String? get offerta;

  @BuiltValueField(wireName: "company_name")
  String? get companyName;

  @BuiltValueField(wireName: "name")
  String? get name;

  @BuiltValueField(wireName: "description")
  String? get description;

  @BuiltValueField(wireName: "icon")
  String? get icon;

  OfferModel._();

  factory OfferModel([void Function(OfferModelBuilder) updates]) = _$OfferModel;

  static Serializer<OfferModel> get serializer => _$offerModelSerializer;
}

abstract class PrivacyModel implements Built<PrivacyModel, PrivacyModelBuilder> {
  @BuiltValueField(wireName: "privacy")
  String? get privacy;

  @BuiltValueField(wireName: "company_name")
  String get companyName;

  PrivacyModel._();

  factory PrivacyModel([void Function(PrivacyModelBuilder) updates]) = _$PrivacyModel;
}

abstract class GetReviewModel implements Built<GetReviewModel, GetReviewModelBuilder> {
  @BuiltValueField(wireName: "id")
  int? get id;

  @BuiltValueField(wireName: "title")
  String? get title;

  @BuiltValueField(wireName: "create_date")
  String? get dateTime;

  @BuiltValueField(wireName: "address")
  String? get location;

  @BuiltValueField(wireName: "name")
  String? get name;

  @BuiltValueField(wireName: "ratings")
  String? get ratings;

  @BuiltValueField(wireName: "review")
  String? get review;

  @BuiltValueField(wireName: "company_id")
  int? get companyId;

  @BuiltValueField(wireName: "doctor_id")
  int? get doctorId;

  @BuiltValueField(wireName: "service_id")
  int? get serviceId;

  @BuiltValueField(wireName: "partner_id")
  int? get partnerId;

  @BuiltValueField(wireName: "is_anonym")
  bool? get isAnonym;

  @BuiltValueField(wireName: "address")
  String? get address;

  @BuiltValueField(wireName: "create_date")
  String? get createDate;

  @BuiltValueField(wireName: "status")
  String? get status;

  GetReviewModel._();

  factory GetReviewModel([void Function(GetReviewModelBuilder) updates]) = _$GetReviewModel;

  static Serializer<GetReviewModel> get serializer => _$getReviewModelSerializer;
}

abstract class PostReviewModel implements Built<PostReviewModel, PostReviewModelBuilder> {
  @BuiltValueField(wireName: "is_anonym")
  bool? get isAnonym;

  @BuiltValueField(wireName: "company_id")
  int? get companyId;

  @BuiltValueField(wireName: "ratings")
  String? get ratings;

  @BuiltValueField(wireName: "review")
  String? get review;

  PostReviewModel._();

  factory PostReviewModel([void Function(PostReviewModelBuilder) updates]) = _$PostReviewModel;

  static Serializer<PostReviewModel> get serializer => _$postReviewModelSerializer;
}

abstract class PostReviewResult implements Built<PostReviewResult, PostReviewResultBuilder> {
  @BuiltValueField(wireName: "status")
  String? get status;

  @BuiltValueField(wireName: "message")
  String? get message;

  PostReviewResult._();

  factory PostReviewResult([void Function(PostReviewResultBuilder) updates]) = _$PostReviewResult;

  static Serializer<PostReviewResult> get serializer => _$postReviewResultSerializer;
}

abstract class PostVisitReviewModel implements Built<PostVisitReviewModel, PostVisitReviewModelBuilder> {
  @BuiltValueField(wireName: "ratings")
  String? get ratings;

  @BuiltValueField(wireName: "review")
  String? get review;

  @BuiltValueField(wireName: "visit_id")
  int? get visitId;

  PostVisitReviewModel._();

  factory PostVisitReviewModel([void Function(PostVisitReviewModelBuilder) updates]) = _$PostVisitReviewModel;

  static Serializer<PostVisitReviewModel> get serializer => _$postVisitReviewModelSerializer;
}
