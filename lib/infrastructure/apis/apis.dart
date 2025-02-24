import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:chopper/chopper.dart';
import 'package:http/http.dart' show Client, MultipartFile;
import 'package:medion/domain/common/token.dart';
import 'package:medion/domain/models/auth/auth.dart';
import 'package:medion/domain/models/booking/booking_type_model.dart';
import 'package:medion/domain/models/branch/branch_model.dart';
import 'package:medion/domain/models/doctors/doctor_model.dart';
import 'package:medion/domain/models/medical_services/medical_services.dart';
import 'package:medion/domain/models/news_model/news_model.dart';
import 'package:medion/domain/models/profile/profile_model.dart';
import 'package:medion/domain/models/third_service_model/third_service_model.dart';
import 'package:medion/domain/serializers/built_value_convertor.dart';
import 'package:medion/domain/success_model/response_model.dart';
import 'package:medion/domain/success_model/success_model.dart';
import 'package:medion/domain/upload_image/upload_image.dart';
import 'package:medion/infrastructure/core/exceptions.dart';
import 'package:medion/infrastructure/core/interceptors.dart';
import 'package:medion/infrastructure/repository/auth_repo.dart';
import 'package:medion/infrastructure/services/local_database/db_service.dart';
import 'package:medion/infrastructure/services/log_service.dart';
import 'package:medion/presentation/pages/core/my_app.dart';
import 'package:medion/utils/app_config.dart';
import 'package:medion/utils/constants.dart';

part 'apis.chopper.dart';

//users
@ChopperApi(baseUrl: '/patient/')
abstract class AuthService extends ChopperService {
  @Post(path: 'phone-number')
  Future<Response<SuccessModel>> phoneNumberSend({
    @Body() required PhoneNumberSendReq request,
  });

  @Post(path: 'registration')
  Future<Response<ResponseModel>> registerUser({
    @Body() required RegisterReq request,
  });

  @Post(path: "create")
  Future<Response<CreatePatientInfoResponse>> createUserInfo({
    @Body() required CreateInfoReq request,
  });

  // @Post(path: "refresh")
  // Future<Response<CreatePatientInfoResponse>> refreshToken({
  //   @Body() required RefreshTokenModel request,
  // });

  static AuthService create(DBService dbService) =>
      _$AuthService(_Client(Constants.baseUrlP, true, dbService));
}

//Booking
@ChopperApi(baseUrl: "/booking/")
abstract class BookingService extends ChopperService {
  @Get(path: "types")
  Future<Response<BuiltList<BookingTypeModel>>> bookingTypes();

  @Get(path: 'category_services/{service_type_id}')
  Future<Response<BuiltList<Category>>> getServiceId(
      @Path('service_type_id') int id);

  @Post(path: 'doctors')
  Future<Response<BuiltList<ThirdBookingService>>> fetchDoctors(
      @Body() DoctorsRequest request);

  @Get(path: "categories")
  Future<Response<BuiltList<HomepageBookingCategory>>>
      getHomePageBookingCategory();

  @Get(path: 'category_doctors_services/{category_id}')
  Future<Response<MedicalModel>> getHomePageBookingDoctors(
      @Path('category_id') int id);

  @Post(path: "doctor/day")
  static BookingService create(DBService dbService) =>
      _$BookingService(_Client(Constants.baseUrlP, true, dbService));
}

//Home Page
@ChopperApi(baseUrl: "/home/")
abstract class HomePageService extends ChopperService {
  @Get(path: "news")
  Future<Response<BuiltList<News>>> getNews();

  @Get(path: "medical_services")
  Future<Response<BuiltList<MedicalServices>>> getMedicalServices();

  @Get(path: "diseases")
  Future<Response<BuiltList<DiseaseModle>>> getDisease();

  @Get(path: "advertisements")
  Future<Response<BuiltList<AdModel>>> getAds();

  static HomePageService create(DBService dbService) =>
      _$HomePageService(_Client(Constants.baseUrlP, true, dbService));
}

//Doctors

@ChopperApi(baseUrl: "/doctor/")
abstract class DoctorService extends ChopperService {
  @Get(path: 'doctors_info')
  Future<Response<BuiltList<DoctorCategory>>> getDoctorsInfo();

  static DoctorService create(DBService dbService) =>
      _$DoctorService(_Client(Constants.baseUrlP, true, dbService));
}

// main
@ChopperApi(baseUrl: '/upload/')
@pragma('vm:entry-point')
abstract class UploadImage extends ChopperService {
  @Post(path: '')
  @multipart
  Future<Response<ImageUploadResponseModel>> imageUpload(
      @PartFile('file') MultipartFile file,
      {@Header('Content-Type') String contentType = 'multipart/form-data',
      @Header('requires-token') String requiresToken = 'true'});

  static UploadImage create(DBService dbService) =>
      _$UploadImage(_Client("", true, dbService, timeout: 300));
}

@ChopperApi(baseUrl: "/profile")
abstract class PatientService extends ChopperService {
  @Get(path: "/patient_info")
  Future<Response<PatientInfo>> getPatientInfo({
    @Header('requires-token') String requiresToken = "true",
  });

  @Post(path: "patient_image")
  Future<Response<SuccessModel>> patientImageUpload({
    @Body() required ImageUploadResponseModel image,
  });

  @Get(path: "patient_visits_mobile")
  Future<Response<VisitModel>> getPatientVisitsMobile({
    @Header('requires-token') String requiresToken = "true",
  });

  static PatientService create(DBService dbService) =>
      _$PatientService(_Client(Constants.baseUrlP, true, dbService));
}

@ChopperApi(baseUrl: "/branch")
abstract class BranchService extends ChopperService {
  @Get(path: "/about-branches")
  Future<Response<BuiltList<BranchModel>>> getBranchInfo();

  @Get(path: "/awards")
  Future<Response<BuiltList<AwardsModel>>> getAwards();

  static BranchService create(DBService dbService) =>
      _$BranchService(_Client(Constants.baseUrlP, true, dbService));
}

@ChopperApi(baseUrl: "")
abstract class StudyService extends ChopperService {
  @Get(path: "/study")
  Future<Response<EducationModel>> getStudy();

  static StudyService create(DBService dbService) =>
      _$StudyService(_Client(Constants.baseUrlP, true, dbService));
}

base class _Client extends ChopperClient {
  _Client(String baseUrl, bool useInterceptors, DBService dbService,
      {int timeout = 20})
      : super(
            client: TimeoutHttpClient(Client(),
                timeout: Duration(seconds: timeout)),
            baseUrl: Uri.parse(baseUrl),
            interceptors: useInterceptors
                ? [
                    CoreInterceptor(dbService),
                    if (AppConfig.shared.flavor == Flavor.dev)
                      aliceChopperAdapter,
                    HttpLoggingInterceptor(),
                    CurlInterceptor(),
                    NetworkInterceptor(),
                    RetryInterceptor(
                        maxRetries: 3, retryDelay: const Duration(seconds: 2)),
                    BackendInterceptor(),
                  ]
                : const [],
            converter: BuiltValueConverter(),
            errorConverter: ErrorMyConverter(),
            authenticator: MyAuthenticator(dbService));
}

class MyAuthenticator extends Authenticator {
  final DBService dbService;

  MyAuthenticator(this.dbService);
  @override
  FutureOr<Request?> authenticate(Request request, Response response,
      [Request? originalRequest]) async {
    if (response.statusCode == 401) {
      try {
        final refreshToken = dbService.token.refreshToken;
        LogService.d("Attempting refresh with token: $refreshToken");

        if (refreshToken == null || refreshToken.isEmpty) {
          LogService.w("No valid refresh token available");
          // dbService.signOut();
          return null;
        }

        final result = await AuthRepository.refreshToken(refreshToken);

        Map<String, String>? header;

        result.fold(
          (error) {
            LogService.e("Refresh failed: ${error.message}");
            // dbService.signOut();
          },
          (data) {
            LogService.d("Refresh succeeded: access=${data.accesstoken}");
            dbService.setToken(Token(
              accessToken: data.accesstoken,
              refreshToken: data.refreshtoken,
              tokenType: 'Bearer',
            ));

            final updatedHeaders = Map<String, String>.of(request.headers);
            final newToken = 'Bearer ${data.accesstoken}';
            updatedHeaders['Authorization'] = newToken;
            header = updatedHeaders;
          },
        );

        if (header != null) {
          LogService.d("Returning request with new headers: $header");
          return request.copyWith(headers: header);
        }
      } catch (e) {
        LogService.e("Refresh exception: $e");
        // dbService.signOut();
      }
    } else if (response.statusCode >= 400) {
      LogService.e("Non-401 error: ${response.statusCode}");
      throw BackendExceptionForSentry(response);
    }

    return null;
  }
}
