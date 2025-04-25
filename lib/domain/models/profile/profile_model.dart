import 'package:built_collection/built_collection.dart';
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

  @BuiltValueField(wireName: "patient_debit")
  double? get patientDebit;

  @BuiltValueField(wireName: "patient_deposit")
  double? get patientDeposit;

  static Serializer<PatientInfo> get serializer => _$patientInfoSerializer;
}

abstract class VisitModel implements Built<VisitModel, VisitModelBuilder> {
  @BuiltValueField(wireName: 'image')
  String? get image;

  @BuiltValueField(wireName: 'doctor_full_name')
  String? get doctorFullName;

  @BuiltValueField(wireName: 'doctor_job_name')
  String? get doctorJobName;

  @BuiltValueField(wireName: 'category_name')
  String? get categoryName;

  @BuiltValueField(wireName: 'service_name')
  String? get serviceName;

  @BuiltValueField(wireName: 'visit_date')
  String? get visitDate;

  @BuiltValueField(wireName: 'visit_time')
  String? get visitTime;

  @BuiltValueField(wireName: 'visit_status')
  String? get visitStatus;

  @BuiltValueField(wireName: 'week_index')
  int? get weekIndex;

  @BuiltValueField(wireName: 'address')
  String? get address;

  @BuiltValueField(wireName: 'payment_method')
  String? get paymentMethod;

  @BuiltValueField(wireName: 'payment_status')
  String? get paymentStatus;

  @BuiltValueField(wireName: 'longitude')
  double? get longitude;

  @BuiltValueField(wireName: 'latitude')
  double? get latitude;

  VisitModel._();
  factory VisitModel([void Function(VisitModelBuilder) updates]) = _$VisitModel;

  static Serializer<VisitModel> get serializer => _$visitModelSerializer;
}

abstract class PatientDocuments
    implements Built<PatientDocuments, PatientDocumentsBuilder> {
  @BuiltValueField(wireName: 'emr_docs_lis')
  BuiltList<PatientAnalysis> get lisDocuments;

  @BuiltValueField(wireName: 'emr_docs_fis')
  BuiltList<PatientAnalysis> get fisDocuments;

  @BuiltValueField(wireName: 'emr_docs_ris')
  BuiltList<PatientAnalysis> get risDocuments;

  @BuiltValueField(wireName: 'emr_docs_consultation')
  BuiltList<PatientAnalysis> get consultationDocuments;

  PatientDocuments._();
  factory PatientDocuments([void Function(PatientDocumentsBuilder) updates]) =
      _$PatientDocuments;

  static Serializer<PatientDocuments> get serializer =>
      _$patientDocumentsSerializer;
}

abstract class PatientAnalysis
    implements Built<PatientAnalysis, PatientAnalysisBuilder> {
  @BuiltValueField(wireName: 'document_name')
  String? get documentName;

  @BuiltValueField(wireName: 'date')
  String? get date;

  @BuiltValueField(wireName: 'document_url')
  String? get documentUrl;

  PatientAnalysis._();
  factory PatientAnalysis([void Function(PatientAnalysisBuilder) updates]) =
      _$PatientAnalysis;

  static Serializer<PatientAnalysis> get serializer =>
      _$patientAnalysisSerializer;
}
