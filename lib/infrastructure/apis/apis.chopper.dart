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
  Future<Response<ResponseModel>> registerUser({required RegisterReq request}) {
    final Uri $url = Uri.parse('/patient/registration');
    final $body = request;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<ResponseModel, ResponseModel>($request);
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
  Future<Response<BuiltList<VisitResponse>>> visitCreate({
    required VisitRequest request,
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
    return client.send<BuiltList<VisitResponse>, VisitResponse>($request);
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
  Future<Response<BuiltList<ThirdBookingService>>> fetchDoctors(
      DoctorsRequest request) {
    final Uri $url = Uri.parse('/booking/doctors');
    final $body = request;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
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
  Future<Response<BuiltList<DoctorCategory>>> getDoctorsInfo() {
    final Uri $url = Uri.parse('/doctor/doctors_info');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<BuiltList<DoctorCategory>, DoctorCategory>($request);
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
  Future<Response<BuiltList<VisitModel>>> getPatientVisitsMobile(
      {String requiresToken = "true"}) {
    final Uri $url = Uri.parse('/profile/patient_visits_mobile');
    final Map<String, String> $headers = {
      'requires-token': requiresToken,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<BuiltList<VisitModel>, VisitModel>($request);
  }

  @override
  Future<Response<BuiltList<PatientAnalysis>>> getPatientAnalyze(
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
    return client.send<BuiltList<PatientAnalysis>, PatientAnalysis>($request);
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
}
