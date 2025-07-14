import 'package:built_value/built_value.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:medion/utils/helpers/decode_html.dart';

part 'doctor_model.g.dart';

abstract class DoctorCategory implements Built<DoctorCategory, DoctorCategoryBuilder> {
  @BuiltValueField(wireName: "doctors")
  BuiltList<DoctorData>? get doctorData;

  DoctorCategory._();

  factory DoctorCategory([void Function(DoctorCategoryBuilder) updates]) = _$DoctorCategory;

  static Serializer<DoctorCategory> get serializer => _$doctorCategorySerializer;
}

abstract class DoctorData implements Built<DoctorData, DoctorDataBuilder> {
  @BuiltValueField(wireName: "id")
  int? get id;

  @BuiltValueField(wireName: "name")
  JsonObject? get name;

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

  @BuiltValueField(wireName: "job_name")
  JsonObject? get specialty;

  @BuiltValueField(wireName: "image")
  JsonObject? get image;

  @BuiltValueField(wireName: "academic_rank")
  JsonObject? get academicRank;

  @BuiltValueField(wireName: "work_experience")
  JsonObject? get workExperience;

  @BuiltValueField(wireName: "has_discount")
  bool? get hasDiscount;

  DoctorData._();

  factory DoctorData([void Function(DoctorDataBuilder) updates]) = _$DoctorData;

  static Serializer<DoctorData> get serializer => _$doctorDataSerializer;
}

abstract class Discount implements Built<Discount, DiscountBuilder> {
  @BuiltValueField(wireName: 'id')
  int? get id;

  @BuiltValueField(wireName: 'title')
  String? get title;

  @BuiltValueField(wireName: 'image')
  String? get image;

  @BuiltValueField(wireName: 'discount_end_date')
  String? get discountEndDate;

  Discount._();

  factory Discount([void Function(DiscountBuilder) updates]) = _$Discount;

  static Serializer<Discount> get serializer => _$discountSerializer;
}

abstract class ModelDoctor implements Built<ModelDoctor, ModelDoctorBuilder> {
  static Serializer<ModelDoctor> get serializer => _$modelDoctorSerializer;

  @BuiltValueField(wireName: 'id')
  int get id;

  @BuiltValueField(wireName: 'experience_year')
  int? get experienceYear;

  @BuiltValueField(wireName: 'is_there_free_time')
  bool? get isThereFreeTime;

  @BuiltValueField(wireName: 'can_patient_accept')
  bool? get canPatientAccept;

  @BuiltValueField(wireName: 'has_discount')
  bool get hasDiscount;

  @BuiltValueField(wireName: 'name')
  String get name;

  @BuiltValueField(wireName: 'background_image_url')
  String get backgroundImageUrl;

  @BuiltValueField(wireName: 'image')
  String get image;

  @BuiltValueField(wireName: 'short_desc')
  JsonObject? get shortDesc;

  String get decodedDescription => decodeHtml(shortDesc.toString());

  @BuiltValueField(wireName: 'work_schedule')
  WorkSchedule get workSchedule;

  @BuiltValueField(wireName: 'experience')
  BuiltList<Experience> get experience;

  @BuiltValueField(wireName: 'articles')
  BuiltList<Articles> get articles;

  @BuiltValueField(wireName: 'gallery_items')
  BuiltList<GalleryItems> get galleryItems;

  @BuiltValueField(wireName: 'specializations')
  BuiltList<String> get specializations;

  @BuiltValueField(wireName: 'education')
  BuiltList<Education> get education;

  @BuiltValueField(wireName: 'discounts')
  BuiltList<Discount> get discount;

  @BuiltValueField(wireName: 'award')
  BuiltList<Award> get award;

  @BuiltValueField(wireName: 'gender')
  JsonObject? get gender;

  @BuiltValueField(wireName: 'job_name')
  String? get jobName;

  @BuiltValueField(wireName: 'job_id')
  String? get jobId;

  @BuiltValueField(wireName: 'price_list')
  BuiltList<PriceItem> get priceList;

  @BuiltValueField(wireName: 'service_price_list')
  JsonObject get servicePriceList;

  @BuiltValueField(wireName: 'academic_rank')
  JsonObject get academicRank;

  @BuiltValueField(wireName: 'reviews')
  BuiltList<DoctorReview> get reviews;

  ModelDoctor._();

  factory ModelDoctor([void Function(ModelDoctorBuilder) updates]) = _$ModelDoctor;
}

abstract class WorkSchedule implements Built<WorkSchedule, WorkScheduleBuilder> {
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

  factory WorkSchedule([void Function(WorkScheduleBuilder) updates]) = _$WorkSchedule;
}

abstract class ScheduleItem implements Built<ScheduleItem, ScheduleItemBuilder> {
  static Serializer<ScheduleItem> get serializer => _$scheduleItemSerializer;

  @BuiltValueField(wireName: 'company')
  JsonObject get company;

  @BuiltValueField(wireName: 'time')
  JsonObject get time;

  ScheduleItem._();

  factory ScheduleItem([void Function(ScheduleItemBuilder) updates]) = _$ScheduleItem;
}

abstract class DoctorReview implements Built<DoctorReview, DoctorReviewBuilder> {
  static Serializer<DoctorReview> get serializer => _$doctorReviewSerializer;

  @BuiltValueField(wireName: 'id')
  int get id;

  @BuiltValueField(wireName: 'ratings')
  BuiltList<String> get ratings;

  @BuiltValueField(wireName: 'review')
  String get review;

  @BuiltValueField(wireName: 'company_id')
  int get companyId;

  @BuiltValueField(wireName: 'doctor_id')
  int get doctorId;

  DoctorReview._();

  factory DoctorReview([void Function(DoctorReviewBuilder) updates]) = _$DoctorReview;
}

abstract class GalleryItems implements Built<GalleryItems, GalleryItemsBuilder> {
  static Serializer<GalleryItems> get serializer => _$galleryItemsSerializer;

  @BuiltValueField(wireName: 'id')
  int get id;

  @BuiltValueField(wireName: 'type')
  String get type;

  @BuiltValueField(wireName: 'file_name')
  String get fileName;

  @BuiltValueField(wireName: 'video_image')
  String get videoImage;

  @BuiltValueField(wireName: 'file_url')
  String get fileUrl;

  GalleryItems._();

  factory GalleryItems([void Function(GalleryItemsBuilder) updates]) = _$GalleryItems;
}

abstract class Articles implements Built<Articles, ArticlesBuilder> {
  static Serializer<Articles> get serializer => _$articlesSerializer;

  @BuiltValueField(wireName: 'id')
  int get id;

  @BuiltValueField(wireName: 'type')
  String get type;

  @BuiltValueField(wireName: 'title')
  String get title;

  @BuiltValueField(wireName: 'description')
  String get description;

  @BuiltValueField(wireName: 'primary_image')
  String get primaryImage;

  @BuiltValueField(wireName: 'images')
  BuiltList<String> get images;

  Articles._();

  factory Articles([void Function(ArticlesBuilder) updates]) = _$Articles;
}

abstract class Experience implements Built<Experience, ExperienceBuilder> {
  static Serializer<Experience> get serializer => _$experienceSerializer;

  @BuiltValueField(wireName: 'title')
  JsonObject get title;

  @BuiltValueField(wireName: 'date')
  JsonObject get date;

  @BuiltValueField(wireName: 'description')
  JsonObject get description;

  Experience._();

  factory Experience([void Function(ExperienceBuilder) updates]) = _$Experience;
}

abstract class Education implements Built<Education, EducationBuilder> {
  static Serializer<Education> get serializer => _$educationSerializer;

  @BuiltValueField(wireName: 'title')
  JsonObject get title;

  @BuiltValueField(wireName: 'date')
  JsonObject get date;

  @BuiltValueField(wireName: 'description')
  BuiltList<String> get description;

  Education._();

  factory Education([void Function(EducationBuilder) updates]) = _$Education;
}

abstract class Award implements Built<Award, AwardBuilder> {
  @BuiltValueField(wireName: 'title')
  String? get title;

  @BuiltValueField(wireName: 'date')
  String? get date;

  @BuiltValueField(wireName: 'description')
  BuiltList<String>? get description;

  static Serializer<Award> get serializer => _$awardSerializer;

  Award._();

  factory Award([void Function(AwardBuilder) updates]) = _$Award;
}

abstract class PriceItem implements Built<PriceItem, PriceItemBuilder> {
  static Serializer<PriceItem> get serializer => _$priceItemSerializer;

  @BuiltValueField(wireName: 'product_type')
  JsonObject get productType;

  @BuiltValueField(wireName: 'categ_id')
  String get categId;

  @BuiltValueField(wireName: 'service_id')
  int get serviceId;

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
  JsonObject get age;

  PriceItem._();

  factory PriceItem([void Function(PriceItemBuilder) updates]) = _$PriceItem;
}

abstract class DoctorsJob implements Built<DoctorsJob, DoctorsJobBuilder> {
  DoctorsJob._();

  factory DoctorsJob([void Function(DoctorsJobBuilder) updates]) = _$DoctorsJob;

  @BuiltValueField(wireName: 'name')
  String get name;

  @BuiltValueField(wireName: 'id')
  int get id;

  static Serializer<DoctorsJob> get serializer => _$doctorsJobSerializer;
}
