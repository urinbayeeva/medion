part of 'auth_bloc.dart';

@freezed
abstract class AuthEvent with _$AuthEvent {
  /// Check user authentication
  const factory AuthEvent.checkAuth() = _CheckAuth;

  /// Send verification request
  const factory AuthEvent.verificationSend({
    required RegisterReq request,
  }) = _VerificationSend;

  /// Send phone number request
  const factory AuthEvent.sendPhoneNumber({
    required PhoneNumberSendReq request,
  }) = _SendPhoneNumber;

  /// Send User Info request
  const factory AuthEvent.sendUserInfo({
    required CreateInfoReq request,
  }) = _SendUserInfo;

  /// Fetch patient information
  const factory AuthEvent.fetchPatientInfo() = _FetchPatientInfo;

  const factory AuthEvent.pickImage(BuildContext context) = _PickImage;

    const factory AuthEvent.fetchPatientVisits() = _FetchPatientVisits;

}
