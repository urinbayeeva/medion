import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
part 'profile_model.g.dart';

abstract class PatientInfo implements Built<PatientInfo, PatientInfoBuilder> {
  PatientInfo._();

  factory PatientInfo([void Function(PatientInfoBuilder) updates]) =
      _$PatientInfo;

  @BuiltValueField(wireName: "image")
  String? get image;

  @BuiltValueField(wireName: "lastname")
  String? get lastName;

  @BuiltValueField(wireName: "firstname")
  String? get firstName;

  @BuiltValueField(wireName: "patient_id")
  int? get patientId;

  @BuiltValueField(wireName: "passport")
  String? get passport;

  @BuiltValueField(wireName: "phone")
  String? get phone;

  @BuiltValueField(wireName: "date_of_birth")
  String? get dateOfBirth;

  @BuiltValueField(wireName: "phone_number")
  String? get phoneNumber;

  @BuiltValueField(wireName: "patient_balance")
  double? get patientBalance;

  static Serializer<PatientInfo> get serializer => _$patientInfoSerializer;
}

abstract class VisitModel implements Built<VisitModel, VisitModelBuilder> {
  @BuiltValueField(wireName: 'image')
  String get image;

  @BuiltValueField(wireName: 'doctor_full_name')
  String get doctorFullName;

  @BuiltValueField(wireName: 'doctor_job_name')
  String get doctorJobName;

  @BuiltValueField(wireName: 'category_name')
  String get categoryName;

  @BuiltValueField(wireName: 'service_name')
  String get serviceName;

  @BuiltValueField(wireName: 'visit_date')
  String get visitDate;

  @BuiltValueField(wireName: 'visit_time')
  String get visitTime;

  @BuiltValueField(wireName: 'visit_status')
  String get visitStatus;

  @BuiltValueField(wireName: 'week_index')
  int get weekIndex;

  VisitModel._();
  factory VisitModel([void Function(VisitModelBuilder) updates]) = _$VisitModel;

  static Serializer<VisitModel> get serializer => _$visitModelSerializer;
}
