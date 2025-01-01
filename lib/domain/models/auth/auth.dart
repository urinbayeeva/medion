import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'auth.g.dart';

/// Phone Number Request
abstract class PhoneNumberSendReq
    implements Built<PhoneNumberSendReq, PhoneNumberSendReqBuilder> {
  PhoneNumberSendReq._();

  factory PhoneNumberSendReq(
          [Function(PhoneNumberSendReqBuilder b) updates]) =
      _$PhoneNumberSendReq;

  @BuiltValueField(wireName: 'phone_number')
  String? get phoneNumber;

  // @BuiltValueField(wireName: 'code')
  // String? get code;

  static Serializer<PhoneNumberSendReq> get serializer => _$phoneNumberSendReqSerializer;
}

/// Verification Send Request

abstract class VerificationSendReq
    implements Built<VerificationSendReq, VerificationSendReqBuilder> {
  VerificationSendReq._();

  factory VerificationSendReq(
          [Function(VerificationSendReqBuilder b) updates]) =
      _$VerificationSendReq;

  @BuiltValueField(wireName: 'phone_number')
  String? get phoneNumber;

  @BuiltValueField(wireName: 'code')
  String? get code;

  static Serializer<VerificationSendReq> get serializer =>
      _$verificationSendReqSerializer;
}