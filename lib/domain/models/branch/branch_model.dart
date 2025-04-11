import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:medion/utils/helpers/decode_html.dart';

part 'branch_model.g.dart';

abstract class BranchModel implements Built<BranchModel, BranchModelBuilder> {
  BranchModel._();

  factory BranchModel([void Function(BranchModelBuilder) updates]) =
      _$BranchModel;

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

  static Serializer<BranchModel> get serializer => _$branchModelSerializer;
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

  factory AwardsModel([void Function(AwardsModelBuilder) updates]) =
      _$AwardsModel;
}

abstract class EducationModel
    implements Built<EducationModel, EducationModelBuilder> {
  static Serializer<EducationModel> get serializer =>
      _$educationModelSerializer;

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
  int? get companyId;

  @BuiltValueField(wireName: 'courses')
  BuiltList<Course>? get courses;

  EducationModel._();

  factory EducationModel([void Function(EducationModelBuilder) updates]) =
      _$EducationModel;
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

abstract class ContentModel
    implements Built<ContentModel, ContentModelBuilder> {
  ContentModel._();

  factory ContentModel([void Function(ContentModelBuilder) updates]) =
      _$ContentModel;

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

  String get decodedTitle => decodeHtml(title);
  String get decodedDescription => decodeHtml(description);

  static Serializer<ContentModel> get serializer => _$contentModelSerializer;
}

abstract class ChildContentModel
    implements Built<ChildContentModel, ChildContentModelBuilder> {
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
  factory ChildContentModel([void Function(ChildContentModelBuilder) updates]) =
      _$ChildContentModel;

  static Serializer<ChildContentModel> get serializer =>
      _$childContentModelSerializer;
}

abstract class MedionModel implements Built<MedionModel, MedionModelBuilder> {
  @BuiltValueField(wireName: 'name')
  String get name;

  @BuiltValueField(wireName: 'description')
  String get description;

  @BuiltValueField(wireName: 'about')
  String get about;

  @BuiltValueField(wireName: 'history')
  String get history;

  @BuiltValueField(wireName: 'mission')
  String get mission;

  @BuiltValueField(wireName: 'licenses')
  BuiltList<String> get licenses;

  MedionModel._();
  factory MedionModel([void Function(MedionModelBuilder) updates]) =
      _$MedionModel;

  static Serializer<MedionModel> get serializer => _$medionModelSerializer;
}
