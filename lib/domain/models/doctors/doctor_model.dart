import 'package:built_value/built_value.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:medion/utils/helpers/decode_html.dart';

part 'doctor_model.g.dart';

abstract class DoctorCategory
    implements Built<DoctorCategory, DoctorCategoryBuilder> {
  @BuiltValueField(wireName: "category_name")
  String get categoryName;

  @BuiltValueField(wireName: "doctor_data")
  BuiltList<DoctorData> get doctorData;

  DoctorCategory._();
  factory DoctorCategory([void Function(DoctorCategoryBuilder) updates]) =
      _$DoctorCategory;

  static Serializer<DoctorCategory> get serializer =>
      _$doctorCategorySerializer;
}

abstract class DoctorData implements Built<DoctorData, DoctorDataBuilder> {
  @BuiltValueField(wireName: "id")
  int get id;

  @BuiltValueField(wireName: "name")
  String get name;

  @BuiltValueField(wireName: "info_description")
  JsonObject? get infoDescription;

  @BuiltValueField(wireName: "Work_Mobile")
  JsonObject? get workMobbile;

  @BuiltValueField(wireName: "Work_Phone")
  JsonObject? get workPhone;

  @BuiltValueField(wireName: "gender")
  JsonObject? get gender;

  @BuiltValueField(wireName: "category_ids")
  BuiltList<int> get categoryIds;

  @BuiltValueField(wireName: "specialty")
  JsonObject? get specialty;

  @BuiltValueField(wireName: "image")
  JsonObject? get image;

  @BuiltValueField(wireName: "academic_rank")
  JsonObject? get academicRank;

  @BuiltValueField(wireName: "work_experience")
  JsonObject? get workExperience;

  DoctorData._();
  factory DoctorData([void Function(DoctorDataBuilder) updates]) = _$DoctorData;

  static Serializer<DoctorData> get serializer => _$doctorDataSerializer;
}

abstract class ModelDoctor implements Built<ModelDoctor, ModelDoctorBuilder> {
  static Serializer<ModelDoctor> get serializer => _$modelDoctorSerializer;

  @BuiltValueField(wireName: 'id')
  int get id;

  @BuiltValueField(wireName: 'name')
  String get name;

  @BuiltValueField(wireName: 'short_desc')
  JsonObject? get shortDesc;

  String get decodedDescription => decodeHtml(shortDesc.toString());

  @BuiltValueField(wireName: 'work_schedule')
  WorkSchedule get workSchedule;

  @BuiltValueField(wireName: 'experience')
  BuiltList<Experience> get experience;

  @BuiltValueField(wireName: 'education')
  BuiltList<Education> get education;

  @BuiltValueField(wireName: 'award')
  BuiltList<Award> get award;

  @BuiltValueField(wireName: 'gender')
  JsonObject? get gender;

  @BuiltValueField(wireName: 'job_id')
  String get jobId;

  @BuiltValueField(wireName: 'image')
  String get image;

  @BuiltValueField(wireName: 'price_list')
  BuiltList<PriceItem> get priceList;

  @BuiltValueField(wireName: 'service_price_list')
  String get servicePriceList;

  ModelDoctor._();
  factory ModelDoctor([void Function(ModelDoctorBuilder) updates]) =
      _$ModelDoctor;
}

abstract class WorkSchedule
    implements Built<WorkSchedule, WorkScheduleBuilder> {
  static Serializer<WorkSchedule> get serializer => _$workScheduleSerializer;

  @BuiltValueField(wireName: 'Monday')
  BuiltList<ScheduleItem> get monday;

  @BuiltValueField(wireName: 'Tuesday')
  BuiltList<ScheduleItem> get tuesday;

  @BuiltValueField(wireName: 'Wednesday')
  BuiltList<ScheduleItem> get wednesday;

  @BuiltValueField(wireName: 'Thursday')
  BuiltList<ScheduleItem> get thursday;

  @BuiltValueField(wireName: 'Friday')
  BuiltList<ScheduleItem> get friday;

  @BuiltValueField(wireName: 'Saturday')
  BuiltList<ScheduleItem> get saturday;

  WorkSchedule._();
  factory WorkSchedule([void Function(WorkScheduleBuilder) updates]) =
      _$WorkSchedule;
}

abstract class ScheduleItem
    implements Built<ScheduleItem, ScheduleItemBuilder> {
  static Serializer<ScheduleItem> get serializer => _$scheduleItemSerializer;

  @BuiltValueField(wireName: 'company')
  String get company;

  @BuiltValueField(wireName: 'time')
  String get time;

  ScheduleItem._();
  factory ScheduleItem([void Function(ScheduleItemBuilder) updates]) =
      _$ScheduleItem;
}

abstract class Experience implements Built<Experience, ExperienceBuilder> {
  static Serializer<Experience> get serializer => _$experienceSerializer;

  @BuiltValueField(wireName: 'title')
  String get title;

  @BuiltValueField(wireName: 'date')
  String get date;

  @BuiltValueField(wireName: 'description')
  String get description;

  Experience._();
  factory Experience([void Function(ExperienceBuilder) updates]) = _$Experience;
}

abstract class Education implements Built<Education, EducationBuilder> {
  static Serializer<Education> get serializer => _$educationSerializer;

  @BuiltValueField(wireName: 'title')
  String get title;

  @BuiltValueField(wireName: 'date')
  String get date;

  @BuiltValueField(wireName: 'description')
  String get description;

  Education._();
  factory Education([void Function(EducationBuilder) updates]) = _$Education;
}

abstract class Award implements Built<Award, AwardBuilder> {
  static Serializer<Award> get serializer => _$awardSerializer;

  Award._();
  factory Award([void Function(AwardBuilder) updates]) = _$Award;
}

abstract class PriceItem implements Built<PriceItem, PriceItemBuilder> {
  static Serializer<PriceItem> get serializer => _$priceItemSerializer;

  @BuiltValueField(wireName: 'product_type')
  String get productType;

  @BuiltValueField(wireName: 'categ_id')
  String get categId;

  @BuiltValueField(wireName: 'service_id')
  double get serviceId;

  @BuiltValueField(wireName: 'first_visit_price')
  double get firstVisitPrice;

  @BuiltValueField(wireName: 'revisit_price')
  double get revisitPrice;

  @BuiltValueField(wireName: 'performance_percentage')
  double get performancePercentage;

  @BuiltValueField(wireName: 'per_dividend_refer')
  double get perDividendRefer;

  @BuiltValueField(wireName: 'service_duration')
  double get serviceDuration;

  @BuiltValueField(wireName: 'age')
  String get age;

  PriceItem._();
  factory PriceItem([void Function(PriceItemBuilder) updates]) = _$PriceItem;
}
