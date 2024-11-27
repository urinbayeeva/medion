part of 'auth_bloc.dart';

@freezed
abstract class AuthEvent with _$AuthEvent {
  const factory AuthEvent.checkAuth() = _CheckAuth;

  const factory AuthEvent.verificationSend(
      {required VerificationSendReq request}) = _VerificationSend;

  const factory AuthEvent.verificationVerify(
      {required VerificationVerifyReq request}) = _VerificationVerify;

  const factory AuthEvent.additionalNumberVerify(
      {required VerificationVerifyReq request}) = _AdditionalNumberVerify;

  const factory AuthEvent.signIn({required SignInReq request}) = _SignIn;

  const factory AuthEvent.signInBusiness({required SignInReq request}) =
      _SignInBusiness;

  const factory AuthEvent.updatePassword({required ResetPasswordReq request}) =
      _UpdatePassword;

  const factory AuthEvent.forgotPassword(
      {required ForgotPasswordReqModel request}) = _ForgotPassword;

  const factory AuthEvent.updatePhone(
      {required VerificationVerifyReq request}) = _UpdatePhone;
}
