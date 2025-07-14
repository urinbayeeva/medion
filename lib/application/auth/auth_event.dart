part of 'auth_bloc.dart';

@freezed
abstract class AuthEvent with _$AuthEvent {
  const factory AuthEvent.checkAuth() = _CheckAuth;

  const factory AuthEvent.refreshToken() = _RefreshToken;

  const factory AuthEvent.verificationSend({required RegisterReq request}) = _VerificationSend;

  const factory AuthEvent.sendPhoneNumber({required PhoneNumberSendReq request}) = _SendPhoneNumber;

  const factory AuthEvent.sendUserInfo({required CreateInfoReq request}) = _SendUserInfo;

  const factory AuthEvent.fetchPatientInfo() = _FetchPatientInfo;

  const factory AuthEvent.pickImage(BuildContext context) = _PickImage;

  const factory AuthEvent.fetchPatientVisits({required String time}) = _FetchPatientVisits;

  const factory AuthEvent.fetchPatientVisitSingle({required int id}) = _FetchPatientSingleVisits;

  const factory AuthEvent.fetchPatientVisitsDetail({required int id}) = _FetchPatientVisitsDetail;

  const factory AuthEvent.fetchPaymentUrls() = _FetchPaymentUrls;

  const factory AuthEvent.fetchPatientAnalyze() = _FetchPatientAnalyze;

  const factory AuthEvent.fetchMyWallet() = _FetchMyWallet;

  const factory AuthEvent.fetchRecommendation() = _FetchRecommendation;

  const factory AuthEvent.fetchRecipes() = _FetchRecipes;

  const factory AuthEvent.cancelVisit({required int id}) = _CancelVisit;
}
