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
  String get lastName;

  @BuiltValueField(wireName: "firstname")
  String get firstName;

  @BuiltValueField(wireName: "patient_id")
  int get patientId;

  @BuiltValueField(wireName: "passport")
  String get passport;

  @BuiltValueField(wireName: "phone")
  String get phone;

  @BuiltValueField(wireName: "date_of_birth")
  String get dateOfBirth;

  @BuiltValueField(wireName: "phone_number")
  String get phoneNumber;

  @BuiltValueField(wireName: "patient_balance")
  int get patientBalance;

  static Serializer<PatientInfo> get serializer => _$patientInfoSerializer;
}
