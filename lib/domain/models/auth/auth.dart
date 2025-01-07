import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'auth.g.dart';

/// Phone Number Request
abstract class PhoneNumberSendReq
    implements Built<PhoneNumberSendReq, PhoneNumberSendReqBuilder> {
  PhoneNumberSendReq._();

  factory PhoneNumberSendReq([Function(PhoneNumberSendReqBuilder b) updates]) =
      _$PhoneNumberSendReq;

  @BuiltValueField(wireName: 'phone_number')
  String get phoneNumber;

  static Serializer<PhoneNumberSendReq> get serializer =>
      _$phoneNumberSendReqSerializer;
}

/// Verification Send Request

abstract class VerificationSendReq
    implements Built<VerificationSendReq, VerificationSendReqBuilder> {
  VerificationSendReq._();

  factory VerificationSendReq(
      [Function(VerificationSendReqBuilder b) updates]) = _$VerificationSendReq;

  @BuiltValueField(wireName: 'phone_number')
  String? get phoneNumber;

  @BuiltValueField(wireName: 'code')
  String? get code;

  static Serializer<VerificationSendReq> get serializer =>
      _$verificationSendReqSerializer;
}

abstract class CreateInfoReq
    implements Built<CreateInfoReq, CreateInfoReqBuilder> {
  CreateInfoReq._();

  factory CreateInfoReq([Function(CreateInfoReqBuilder b) updates]) =
      _$CreateInfoReq;

  @BuiltValueField(wireName: "first_name")
  String? get firstName;

  @BuiltValueField(wireName: "last_name")
  String? get lastName;

    @BuiltValueField(wireName: "middle_name")
  String? get middleName;

    @BuiltValueField(wireName: "phone_number")
  String? get phoneNumber;

    @BuiltValueField(wireName: "date_of_birth")
  String? get dateOfBirth;

    @BuiltValueField(wireName: "gender")
  String? get gender;

    @BuiltValueField(wireName: "passport_serial")
  String? get passportSerial;
  
static Serializer<CreateInfoReq> get serializer => _$createInfoReqSerializer; 

}
