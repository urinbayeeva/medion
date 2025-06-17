import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';

part 'recruitment_model.g.dart';

// ----------------------------
// VacancyModel
// ----------------------------

abstract class VacancyModel implements Built<VacancyModel, VacancyModelBuilder> {
  @BuiltValueField(wireName: "company_name")
  String get companyName;

  @BuiltValueField(wireName: "office_vacancies")
  BuiltList<VacancyDetailModel> get officeVacancies;

  @BuiltValueField(wireName: "medicine_vacancies")
  BuiltList<VacancyDetailModel> get medicineVacancies;

  @BuiltValueField(wireName: "requirements")
  BuiltList<RequirementsModel> get requirements;

  VacancyModel._();

  factory VacancyModel([void Function(VacancyModelBuilder) updates]) = _$VacancyModel;

  static Serializer<VacancyModel> get serializer => _$vacancyModelSerializer;
}

// ----------------------------
// VacancyDetailModel
// ----------------------------

abstract class VacancyDetailModel implements Built<VacancyDetailModel, VacancyDetailModelBuilder> {
  @BuiltValueField(wireName: "id")
  int get id;

  @BuiltValueField(wireName: "company_id")
  int get companyId;

  @BuiltValueField(wireName: "name")
  String get name;

  @BuiltValueField(wireName: "description")
  String get description;

  VacancyDetailModel._();

  factory VacancyDetailModel([void Function(VacancyDetailModelBuilder) updates]) = _$VacancyDetailModel;

  static Serializer<VacancyDetailModel> get serializer => _$vacancyDetailModelSerializer;
}

// ----------------------------
// RequirementsModel
// ----------------------------

abstract class RequirementsModel implements Built<RequirementsModel, RequirementsModelBuilder> {
  @BuiltValueField(wireName: "title")
  String get title;

  @BuiltValueField(wireName: "icon")
  String get icon;

  RequirementsModel._();

  factory RequirementsModel([void Function(RequirementsModelBuilder) updates]) = _$RequirementsModel;

  static Serializer<RequirementsModel> get serializer => _$requirementsModelSerializer;
}

// ----------------------------
// JobApplicationModel
// ----------------------------

abstract class JobApplicationModel implements Built<JobApplicationModel, JobApplicationModelBuilder> {
  @BuiltValueField(wireName: "company_id")
  int get companyId;

  @BuiltValueField(wireName: "id")
  int get id;

  @BuiltValueField(wireName: "required_experience_year")
  int get requiredExperienceYear;

  @BuiltValueField(wireName: "latitude")
  double get latitude;

  @BuiltValueField(wireName: "longitude")
  double get longitude;

  @BuiltValueField(wireName: "salary")
  double get salary;

  @BuiltValueField(wireName: "requirements")
  String get requirements;

  @BuiltValueField(wireName: "our_offer")
  String get ourOffer;

  @BuiltValueField(wireName: "currency")
  String get currency;

  @BuiltValueField(wireName: "responsibilities")
  String get responsibilities;

  @BuiltValueField(wireName: "work_type")
  String get workType;

  @BuiltValueField(wireName: "name")
  String get name;

  @BuiltValueField(wireName: "phone")
  String get phone;

  @BuiltValueField(wireName: "email")
  String get email;

  @BuiltValueField(wireName: "skills")
  BuiltList<String> get skills;

  JobApplicationModel._();

  factory JobApplicationModel([void Function(JobApplicationModelBuilder) updates]) = _$JobApplicationModel;

  static Serializer<JobApplicationModel> get serializer => _$jobApplicationModelSerializer;
}

abstract class UploadVacancyModel implements Built<UploadVacancyModel, UploadVacancyModelBuilder> {
  @BuiltValueField(wireName: 'job_id')
  int get id;

  @BuiltValueField(wireName: 'company_id')
  int get companyId;

  @BuiltValueField(wireName: 'firstname')
  String get name;

  @BuiltValueField(wireName: 'lastname')
  String get lastName;

  @BuiltValueField(wireName: 'resume')
  String get resume;

  UploadVacancyModel._();

  factory UploadVacancyModel([void Function(UploadVacancyModelBuilder) updates]) = _$UploadVacancyModel;

  static Serializer<UploadVacancyModel> get serializer => _$uploadVacancyModelSerializer;
}

abstract class ResultVacancyModel implements Built<ResultVacancyModel, ResultVacancyModelBuilder> {
  @BuiltValueField(wireName: 'status')
  String get status;

  @BuiltValueField(wireName: 'message')
  String get message;

  ResultVacancyModel._();

  factory ResultVacancyModel([void Function(ResultVacancyModelBuilder) updates]) = _$ResultVacancyModel;

  static Serializer<ResultVacancyModel> get serializer => _$resultVacancyModelSerializer;
}
