part of 'auth_bloc.dart';

@immutable
@freezed
class AuthState with _$AuthState {
  const AuthState._();

  const factory AuthState({
    @Default(false) bool proceedToHome,
    @Default(false) bool proceedToLogin,
    //
    @Default(false) bool successSendCode,
    @Default(false) bool successVerifyCode,
    @Default(false) bool successUpdatePhone,
    @Default(false) bool successSendUserInfo,
    @Default(false) bool errorSendCode,
    @Default(null) String? phoneNumber,
    @Default(null) PatientInfo? patientInfo,
    @Default(false) bool isFetchingPatientInfo,
    @Default(false) bool errorFetchingPatientInfo,
    @Default(null) String? pickedImagePath,
    @Default(false) bool isLoadingVisits,
    @Default(false) bool errorFetchingVisits,
    @Default([]) List<VisitOrder?> patientVisits,
    @Default(null) PatientDocuments? patientAnalyze,
    @Default(null) bool? isNewPatient,
    @Default(null) String? paymeUrl,
    @Default(null) String? clickUrl,
    @Default(false) bool isFetchingPaymentUrls,
    @Default(false) bool errorFetchingPaymentUrls,
    @Default(null) PaymentResponse? myWallet,
    @Default(null)
    RegistrationResponse? registrationResponse, // Added this line
  }) = _AuthState;
}
