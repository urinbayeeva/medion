import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';

part 'recruitment_model.g.dart';

abstract class VacancyModel
    implements Built<VacancyModel, VacancyModelBuilder> {
  @BuiltValueField(wireName: "company_name")
  String get companyName;

  @BuiltValueField(wireName: "office_vacancies")
  BuiltList<String> get officeVacancies;

  @BuiltValueField(wireName: "medicine_vacancies")
  BuiltList<String> get medicineVacancies;

  VacancyModel._();
  factory VacancyModel([void Function(VacancyModelBuilder) updates]) =
      _$VacancyModel;
}

abstract class JobApplicationModel
    implements Built<JobApplicationModel, JobApplicationModelBuilder> {
  @BuiltValueField(wireName: "job_id")
  int get jodId;

  @BuiltValueField(wireName: "company_id")
  int get companyId;

  @BuiltValueField(wireName: "firstname")
  String get firstname;

  @BuiltValueField(wireName: "lastname")
  String get lastname;

  @BuiltValueField(wireName: "resume")
  String get resume;

  JobApplicationModel._();

  factory JobApplicationModel(
          [void Function(JobApplicationModelBuilder) updates]) =
      _$JobApplicationModel;
}
