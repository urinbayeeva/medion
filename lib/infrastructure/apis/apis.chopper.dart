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
  Future<Response<BuiltList<ServiceModel>>> getDoctorsTime({
    required GiveSelectedId request,
    required int days,
  }) {
    final Uri $url = Uri.parse('/booking/doctors');
    final Map<String, dynamic> $params = <String, dynamic>{'days': days};
    final $body = request;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      parameters: $params,
    );
    return client.send<BuiltList<ServiceModel>, ServiceModel>($request);
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
  Future<Response<BuiltList<MedicalServices>>> getMedicalServices() {
    final Uri $url = Uri.parse('/home/medical_services');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<BuiltList<MedicalServices>, MedicalServices>($request);
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
  Future<Response<List<DoctorCategory>>> getDoctorsInfo() {
    final Uri $url = Uri.parse('/doctor/doctors_info');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<DoctorCategory>, DoctorCategory>($request);
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
  Future<Response<PatientInfo>> getPatientInfo(String authorization) {
    final Uri $url = Uri.parse('/profile/patient_info');
    final Map<String, String> $headers = {
      'Authorization': authorization,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<PatientInfo, PatientInfo>($request);
  }
}
