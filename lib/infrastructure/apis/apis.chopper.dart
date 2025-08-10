// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apis.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$AuthService extends AuthService {
  _$AuthService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = AuthService;

  @override
  Future<Response<SuccessModel>> phoneNumberSend(
      {required PhoneNumberSendReq request}) {
    final Uri $url = Uri.parse('/patient/phone-number');
    final $body = request;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<SuccessModel, SuccessModel>($request);
  }

  @override
  Future<Response<RegistrationResponse>> registerUser(
      {required RegisterReq request}) {
    final Uri $url = Uri.parse('/patient/registration');
    final $body = request;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<RegistrationResponse, RegistrationResponse>($request);
  }

  @override
  Future<Response<CreatePatientInfoResponse>> createUserInfo(
      {required CreateInfoReq request}) {
    final Uri $url = Uri.parse('/patient/create');
    final $body = request;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client
        .send<CreatePatientInfoResponse, CreatePatientInfoResponse>($request);
  }
}

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$RefreshService extends RefreshService {
  _$RefreshService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = RefreshService;

  @override
  Future<Response<RefreshTokenResponseModel>> refreshToken(
      {required RefreshTokenModel request}) {
    final Uri $url = Uri.parse('refresh');
    final $body = request;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client
        .send<RefreshTokenResponseModel, RefreshTokenResponseModel>($request);
  }

  @override
  Future<Response<CancelVisitResult>> cancelVisit({
    String requiresToken = "true",
    required CancelVisitBody cancelBody,
  }) {
    final Uri $url = Uri.parse('cancel-visit');
    final Map<String, String> $headers = {
      'requires-token': requiresToken,
    };
    final $body = cancelBody;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<CancelVisitResult, CancelVisitResult>($request);
  }
}

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$VisitCreateService extends VisitCreateService {
  _$VisitCreateService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = VisitCreateService;

  @override
  Future<Response<CreateVisitResponse>> visitCreate({
    required BuiltList<VisitRequest> request,
    String requiresToken = "true",
  }) {
    final Uri $url = Uri.parse('create_visit');
    final Map<String, String> $headers = {
      'requires-token': requiresToken,
    };
    final $body = request;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<CreateVisitResponse, CreateVisitResponse>($request);
  }
}

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$BookingService extends BookingService {
  _$BookingService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = BookingService;

  @override
  Future<Response<BuiltList<BookingTypeModel>>> bookingTypes() {
    final Uri $url = Uri.parse('/booking/types');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<BuiltList<BookingTypeModel>, BookingTypeModel>($request);
  }

  @override
  Future<Response<BuiltList<Category>>> getServiceId(int id) {
    final Uri $url = Uri.parse('/booking/category_services/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<BuiltList<Category>, Category>($request);
  }

  @override
  Future<Response<BuiltList<ThirdBookingService>>> fetchDoctors({
    String requiresToken = 'true',
    int? days,
    required DoctorsRequest request,
  }) {
    final Uri $url = Uri.parse('/booking/doctor-time-slots-mobile');
    final Map<String, dynamic> $params = <String, dynamic>{'days': days};
    final Map<String, String> $headers = {
      'requires-token': requiresToken,
    };
    final $body = request;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      parameters: $params,
      headers: $headers,
    );
    return client
        .send<BuiltList<ThirdBookingService>, ThirdBookingService>($request);
  }

  @override
  Future<Response<BuiltList<HomepageBookingCategory>>>
      getHomePageBookingCategory() {
    final Uri $url = Uri.parse('/booking/categories');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<BuiltList<HomepageBookingCategory>,
        HomepageBookingCategory>($request);
  }

  @override
  Future<Response<MedicalModel>> getHomePageBookingDoctors(int id) {
    final Uri $url = Uri.parse('/booking/category_doctors_services/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<MedicalModel, MedicalModel>($request);
  }

  @override
  Future<Response<void>> getDoctorDays() {
    final Uri $url = Uri.parse('/booking/doctor/day');
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
    );
    return client.send<void, void>($request);
  }

  @override
  Future<Response<MedicalServiceCategory>> getHomePageBookingDoctorsByID(
      int id) {
    final Uri $url = Uri.parse('/booking/services_by_doctor/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client
        .send<MedicalServiceCategory, MedicalServiceCategory>($request);
  }
}

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$HomePageService extends HomePageService {
  _$HomePageService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = HomePageService;

  @override
  Future<Response<BuiltList<News>>> getNews() {
    final Uri $url = Uri.parse('/home/news');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<BuiltList<News>, News>($request);
  }

  @override
  Future<Response<BuiltList<DiagnosticsModel>>> getMedicalServices() {
    final Uri $url = Uri.parse('/home/medical_services');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<BuiltList<DiagnosticsModel>, DiagnosticsModel>($request);
  }

  @override
  Future<Response<BuiltList<DiseaseModle>>> getDisease() {
    final Uri $url = Uri.parse('/home/diseases');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<BuiltList<DiseaseModle>, DiseaseModle>($request);
  }

  @override
  Future<Response<BuiltList<AdModel>>> getAds() {
    final Uri $url = Uri.parse('/home/advertisements');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<BuiltList<AdModel>, AdModel>($request);
  }

  @override
  Future<Response<BuiltList<LocationModel>>> getCompanyLocatiom() {
    final Uri $url = Uri.parse('/home/company_location');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<BuiltList<LocationModel>, LocationModel>($request);
  }
}

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$DoctorService extends DoctorService {
  _$DoctorService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = DoctorService;

  @override
  Future<Response<DoctorCategory>> getDoctorsInfo() {
    final Uri $url = Uri.parse('/doctor/doctors_info');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<DoctorCategory, DoctorCategory>($request);
  }

  @override
  Future<Response<ModelDoctor>> getDoctorDetailInfo(int id) {
    final Uri $url = Uri.parse('/doctor/detail-info/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<ModelDoctor, ModelDoctor>($request);
  }

  @override
  Future<Response<BuiltList<DoctorsJob>>> getDoctorsJob() {
    final Uri $url = Uri.parse('/doctor/doctor-jobs');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<BuiltList<DoctorsJob>, DoctorsJob>($request);
  }
}

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$UploadImage extends UploadImage {
  _$UploadImage([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = UploadImage;

  @override
  Future<Response<ImageUploadResponseModel>> imageUpload(
    MultipartFile file, {
    String contentType = 'multipart/form-data',
    String requiresToken = 'true',
  }) {
    final Uri $url = Uri.parse('/upload/');
    final Map<String, String> $headers = {
      'Content-Type': contentType,
      'requires-token': requiresToken,
    };
    final List<PartValue> $parts = <PartValue>[
      PartValueFile<MultipartFile>(
        'file',
        file,
      )
    ];
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      parts: $parts,
      multipart: true,
      headers: $headers,
    );
    return client
        .send<ImageUploadResponseModel, ImageUploadResponseModel>($request);
  }
}

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$PatientService extends PatientService {
  _$PatientService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = PatientService;

  @override
  Future<Response<PatientInfo>> getPatientInfo(
      {String requiresToken = "true"}) {
    final Uri $url = Uri.parse('/profile/patient_info');
    final Map<String, String> $headers = {
      'requires-token': requiresToken,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<PatientInfo, PatientInfo>($request);
  }

  @override
  Future<Response<SuccessModel>> patientImageUpload(
      {required ImageUploadResponseModel image}) {
    final Uri $url = Uri.parse('/profile/patient_image');
    final $body = image;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<SuccessModel, SuccessModel>($request);
  }

  @override
  Future<Response<PatientAnalyse>> getPatientVisitsMobile({
    String requiresToken = "true",
    String? time,
  }) {
    final Uri $url = Uri.parse('/profile/patient_visits_mobile');
    final Map<String, dynamic> $params = <String, dynamic>{'date': time};
    final Map<String, String> $headers = {
      'requires-token': requiresToken,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client.send<PatientAnalyse, PatientAnalyse>($request);
  }

  @override
  Future<Response<PatientVisitSingleModel>> getPatientVisitSingle({
    String requiresToken = "true",
    required int visitId,
  }) {
    final Uri $url = Uri.parse('/profile/patient_visit_detail/${visitId}');
    final Map<String, String> $headers = {
      'requires-token': requiresToken,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client
        .send<PatientVisitSingleModel, PatientVisitSingleModel>($request);
  }

  @override
  Future<Response<PatientDocuments>> getPatientAnalyze(
      {String requiresToken = "true"}) {
    final Uri $url = Uri.parse('/profile/patient_analysis_mobile');
    final Map<String, String> $headers = {
      'requires-token': requiresToken,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<PatientDocuments, PatientDocuments>($request);
  }

  @override
  Future<Response<PaymentResponse>> getMyWallet(
      {String requiresToken = "true"}) {
    final Uri $url = Uri.parse('/profile/my_wallet');
    final Map<String, String> $headers = {
      'requires-token': requiresToken,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<PaymentResponse, PaymentResponse>($request);
  }

  @override
  Future<Response<BuiltList<Recommendation>>> recommendation(
      {String requiresToken = "true"}) {
    final Uri $url = Uri.parse('/profile/recommendations');
    final Map<String, String> $headers = {
      'requires-token': requiresToken,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<BuiltList<Recommendation>, Recommendation>($request);
  }

  @override
  Future<Response<BuiltList<RecipeModel>>> recipes(
      {String requiresToken = "true"}) {
    final Uri $url = Uri.parse('/profile/patient_prescription');
    final Map<String, String> $headers = {
      'requires-token': requiresToken,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<BuiltList<RecipeModel>, RecipeModel>($request);
  }
}

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$BranchService extends BranchService {
  _$BranchService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = BranchService;

  @override
  Future<Response<BuiltList<BranchModel>>> getBranchInfo() {
    final Uri $url = Uri.parse('/branch/about-branches');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<BuiltList<BranchModel>, BranchModel>($request);
  }

  @override
  Future<Response<BuiltList<AwardsModel>>> getAwards() {
    final Uri $url = Uri.parse('/branch/awards');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<BuiltList<AwardsModel>, AwardsModel>($request);
  }

  @override
  Future<Response<BranchDetailModel>> getBranchDetail(int id) {
    final Uri $url = Uri.parse('/branch/detail/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<BranchDetailModel, BranchDetailModel>($request);
  }
}

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$SearchService extends SearchService {
  _$SearchService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = SearchService;

  @override
  Future<Response<MedionResponseSearchText>> getBranchInfo(
      SearchReqModel request) {
    final Uri $url = Uri.parse('/his-web-search');
    final $body = request;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client
        .send<MedionResponseSearchText, MedionResponseSearchText>($request);
  }
}

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$NotificationService extends NotificationService {
  _$NotificationService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = NotificationService;

  @override
  Future<Response<BuiltList<NotificationModel>>> getNotifications({
    String? type,
    String requiresToken = "true",
  }) {
    final Uri $url = Uri.parse('/notifications');
    final Map<String, dynamic> $params = <String, dynamic>{'type': type};
    final Map<String, String> $headers = {
      'requires-token': requiresToken,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client
        .send<BuiltList<NotificationModel>, NotificationModel>($request);
  }

  @override
  Future<Response<NotificationModel>> getNotificationSingle({
    String? type,
    int? pk,
    String requiresToken = "true",
  }) {
    final Uri $url = Uri.parse('/notifications');
    final Map<String, dynamic> $params = <String, dynamic>{
      'type': type,
      'pk': pk,
    };
    final Map<String, String> $headers = {
      'requires-token': requiresToken,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client.send<NotificationModel, NotificationModel>($request);
  }

  @override
  Future<Response<NotificationSendReview>> postNotificationReview({
    required PostVisitReviewModel visitReview,
    String requiresToken = "true",
  }) {
    final Uri $url = Uri.parse('/send-review-visit');
    final Map<String, String> $headers = {
      'requires-token': requiresToken,
    };
    final $body = visitReview;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client
        .send<NotificationSendReview, NotificationSendReview>($request);
  }

  @override
  Future<Response<NotificationModel>> readNotification({
    int? notificationId,
    String requiresToken = "true",
  }) {
    final Uri $url = Uri.parse('/notifications/read');
    final Map<String, dynamic> $params = <String, dynamic>{
      'notification_id': notificationId
    };
    final Map<String, String> $headers = {
      'requires-token': requiresToken,
    };
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client.send<NotificationModel, NotificationModel>($request);
  }

  @override
  Future<Response<void>> setFcmToken({
    required SetFcmTokenBody fcm,
    String requiresToken = "true",
  }) {
    final Uri $url = Uri.parse('https://his.uicgroup.tech/firebase/token');
    final Map<String, String> $headers = {
      'requires-token': requiresToken,
    };
    final $body = fcm;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<void, void>($request);
  }
}

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$StudyService extends StudyService {
  _$StudyService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = StudyService;

  @override
  Future<Response<EducationModel>> getStudy() {
    final Uri $url = Uri.parse('/study');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<EducationModel, EducationModel>($request);
  }

  @override
  Future<Response<StudyLeadResult>> studyLead({required StudyLead report}) {
    final Uri $url = Uri.parse('/study-lead');
    final $body = report;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<StudyLeadResult, StudyLeadResult>($request);
  }

  @override
  Future<Response<BuiltList<GetReviewModel>>> getReviews(
      {String requiresToken = "true"}) {
    final Uri $url = Uri.parse('/company/get-reviews');
    final Map<String, String> $headers = {
      'requires-token': requiresToken,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<BuiltList<GetReviewModel>, GetReviewModel>($request);
  }

  @override
  Future<Response<PostReviewResult>> postReviews({
    required PostReviewModel review,
    String requiresToken = "true",
  }) {
    final Uri $url = Uri.parse('/company/send-review');
    final Map<String, String> $headers = {
      'requires-token': requiresToken,
    };
    final $body = review;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<PostReviewResult, PostReviewResult>($request);
  }
}

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$HelpCallService extends HelpCallService {
  _$HelpCallService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = HelpCallService;

  @override
  Future<Response<ServiceResponse>> serviceReqCall(
      {required ServiceRequest request}) {
    final Uri $url = Uri.parse('/help/call');
    final $body = request;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<ServiceResponse, ServiceResponse>($request);
  }
}

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$CompanyService extends CompanyService {
  _$CompanyService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = CompanyService;

  @override
  Future<Response<MedionModel>> getMedionActivity() {
    final Uri $url = Uri.parse('/company/activity');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<MedionModel, MedionModel>($request);
  }

  @override
  Future<Response<OfferModel>> getOfferta() {
    final Uri $url = Uri.parse('/company/offerta');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<OfferModel, OfferModel>($request);
  }

  @override
  Future<Response<PrivacyModel>> getPrivacy() {
    final Uri $url = Uri.parse('/company/privacy');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<PrivacyModel, PrivacyModel>($request);
  }

  @override
  Future<Response<BuiltList<Team>>> getTeam() {
    final Uri $url = Uri.parse('/company/team');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<BuiltList<Team>, Team>($request);
  }
}

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$ContentService extends ContentService {
  _$ContentService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = ContentService;

  @override
  Future<Response<BuiltList<ContentModel>>> getContentType(String type) {
    final Uri $url = Uri.parse('/content/${type}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<BuiltList<ContentModel>, ContentModel>($request);
  }

  @override
  Future<Response<ContentModel>> getSingleContent({
    required String type,
    required int pk,
  }) {
    final Uri $url = Uri.parse('/content/${type}');
    final Map<String, dynamic> $params = <String, dynamic>{'pk': pk};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<ContentModel, ContentModel>($request);
  }
}

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$RecruitmentService extends RecruitmentService {
  _$RecruitmentService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = RecruitmentService;

  @override
  Future<Response<VacancyModel>> getVacancies() {
    final Uri $url = Uri.parse('recruitment/vacancies');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<VacancyModel, VacancyModel>($request);
  }

  @override
  Future<Response<JobApplicationModel>> getVacancySingle({int? id}) {
    final Uri $url = Uri.parse('recruitment/vacancies');
    final Map<String, dynamic> $params = <String, dynamic>{'vacancy_id': id};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<JobApplicationModel, JobApplicationModel>($request);
  }

  @override
  Future<Response<ResultVacancyModel>> uploadVacancy(
      {required UploadVacancyModel vacancy}) {
    final Uri $url = Uri.parse('recruitment/apply');
    final $body = vacancy;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<ResultVacancyModel, ResultVacancyModel>($request);
  }
}
