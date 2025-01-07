part of 'auth_bloc.dart';

@freezed
abstract class AuthEvent with _$AuthEvent {
  /// Check user authentication
  const factory AuthEvent.checkAuth() = _CheckAuth;

  /// Send verification request
  const factory AuthEvent.verificationSend({
    required VerificationSendReq request,
  }) = _VerificationSend;

  /// Send phone number request
  const factory AuthEvent.sendPhoneNumber({
    required PhoneNumberSendReq request,
  }) = _SendPhoneNumber;

  // Send User Info reques
  const factory AuthEvent.sendUserInfo({
    required CreateInfoReq request,
  }) = _SendUserInfo;
}
