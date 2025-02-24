import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

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
  String? get workDays;

  @BuiltValueField(wireName: 'description')
  String? get description;

  static Serializer<BranchModel> get serializer => _$branchModelSerializer;
}

abstract class AwardsModel implements Built<AwardsModel, AwardsModelBuilder> {
  // Serializers for JSON serialization/deserialization
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
