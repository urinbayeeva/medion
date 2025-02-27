import 'package:built_collection/built_collection.dart';
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

abstract class RegisterReq implements Built<RegisterReq, RegisterReqBuilder> {
  RegisterReq._();

  factory RegisterReq([Function(RegisterReqBuilder b) updates]) = _$RegisterReq;

  @BuiltValueField(wireName: 'phone_number')
  String? get phoneNumber;

  @BuiltValueField(wireName: 'code')
  String? get code;

  static Serializer<RegisterReq> get serializer => _$registerReqSerializer;
}

abstract class RegistrationResponse
    implements Built<RegistrationResponse, RegistrationResponseBuilder> {
  RegistrationResponse._();

  factory RegistrationResponse(
          [void Function(RegistrationResponseBuilder) updates]) =
      _$RegistrationResponse;

  @BuiltValueField(wireName: 'is_new_patient')
  bool get isNewPatient;

  @BuiltValueField(wireName: 'access_token')
  BuiltList<String>? get accessToken;

  @BuiltValueField(wireName: 'refresh_token')
  BuiltList<String>? get refreshToken;

  @BuiltValueField(wireName: 'token_type')
  String? get tokenType;

  static Serializer<RegistrationResponse> get serializer =>
      _$registrationResponseSerializer;
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

abstract class CreatePatientInfoResponse
    implements
        Built<CreatePatientInfoResponse, CreatePatientInfoResponseBuilder> {
  @BuiltValueField(wireName: "access_token")
  String? get accesstoken;

  @BuiltValueField(wireName: "refresh_token")
  String? get refreshtoken;

  @BuiltValueField(wireName: "token_type")
  String? get tokenType;

  CreatePatientInfoResponse._();
  factory CreatePatientInfoResponse(
          [void Function(CreatePatientInfoResponseBuilder) updates]) =
      _$CreatePatientInfoResponse;

  static Serializer<CreatePatientInfoResponse> get serializer =>
      _$createPatientInfoResponseSerializer;
}

abstract class RefreshTokenModel
    implements Built<RefreshTokenModel, RefreshTokenModelBuilder> {
  RefreshTokenModel._();

  factory RefreshTokenModel([void Function(RefreshTokenModelBuilder) updates]) =
      _$RefreshTokenModel;

  @BuiltValueField(wireName: 'token')
  String? get token;

  static Serializer<RefreshTokenModel> get serializer =>
      _$refreshTokenModelSerializer;
}


abstract class RefreshTokenResponseModel
    implements Built<RefreshTokenResponseModel, RefreshTokenResponseModelBuilder> {
  RefreshTokenResponseModel._();

  factory RefreshTokenResponseModel(
      [void Function(RefreshTokenResponseModelBuilder) updates]) =
      _$RefreshTokenResponseModel;

  @BuiltValueField(wireName: 'access_token')
  String get accessToken;

  @BuiltValueField(wireName: 'token_type')
  String get tokenType;

  static Serializer<RefreshTokenResponseModel> get serializer =>
      _$refreshTokenResponseModelSerializer;
}

abstract class RefreshTokenResponse implements Built<RefreshTokenResponse, RefreshTokenResponseBuilder> {
  String? get access_token; // Match JSON key exactly
  String? get token_type;

  RefreshTokenResponse._();
  factory RefreshTokenResponse([void Function(RefreshTokenResponseBuilder) updates]) = _$RefreshTokenResponse;
  static Serializer<RefreshTokenResponse> get serializer => _$refreshTokenResponseSerializer;
}