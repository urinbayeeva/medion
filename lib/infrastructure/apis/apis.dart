import 'dart:async';
import 'package:built_collection/built_collection.dart';
import 'package:chopper/chopper.dart';
import 'package:http/http.dart' show Client, MultipartFile;
import 'package:medion/domain/common/token.dart';
import 'package:medion/domain/models/auth/auth.dart';
import 'package:medion/domain/models/booking/booking_type_model.dart';
import 'package:medion/domain/models/branch/branch_model.dart';
import 'package:medion/domain/models/doctors/doctor_model.dart';
import 'package:medion/domain/models/map/map_model.dart';
import 'package:medion/domain/models/medical_services/medical_services.dart';
import 'package:medion/domain/models/news_model/news_model.dart';
import 'package:medion/domain/models/payment_model.dart';
import 'package:medion/domain/models/profile/profile_model.dart';
import 'package:medion/domain/models/recruitment/recruitment_model.dart';
import 'package:medion/domain/models/search/search_model.dart';
import 'package:medion/domain/models/third_service_model/third_service_model.dart';
import 'package:medion/domain/models/visit/visit_model.dart';
import 'package:medion/domain/serializers/built_value_convertor.dart';
import 'package:medion/domain/success_model/response_model.dart';
import 'package:medion/domain/success_model/success_model.dart';
import 'package:medion/domain/upload_image/upload_image.dart';
import 'package:medion/infrastructure/apis/interceptors/html_decode_interceptor.dart';
import 'package:medion/infrastructure/apis/interceptors/log_interceptor.dart';
import 'package:medion/infrastructure/apis/interceptors/re_try_interceptor.dart';
import 'package:medion/infrastructure/apis/interceptors/server_crash_interceptor.dart';
import 'package:medion/infrastructure/apis/interceptors/time_out_http_client.dart';
import 'package:medion/infrastructure/core/exceptions.dart';
import 'package:medion/infrastructure/core/interceptors.dart';
import 'package:medion/infrastructure/repository/auth_repo.dart';
import 'package:medion/infrastructure/services/local_database/db_service.dart';
import 'package:medion/infrastructure/services/log_service.dart';
import 'package:medion/presentation/pages/core/my_app.dart';
import 'package:medion/utils/app_config.dart';
import 'package:medion/utils/constants.dart';

import 'interceptors/network_exception_interceptor.dart';
import 'interceptors/token_interceptor.dart';

part 'apis.chopper.dart';

//users
@ChopperApi(baseUrl: '/patient/')
abstract class AuthService extends ChopperService {
  @Post(path: 'phone-number')
  Future<Response<SuccessModel>> phoneNumberSend({
    @Body() required PhoneNumberSendReq request,
  });

  @Post(path: 'registration')
  Future<Response<RegistrationResponse>> registerUser({
    @Body() required RegisterReq request,
  });

  @Post(path: "create")
  Future<Response<CreatePatientInfoResponse>> createUserInfo({
    @Body() required CreateInfoReq request,
  });

  static AuthService create(DBService dbService) => _$AuthService(_Client(Constants.baseUrlP, true, dbService));
}

@ChopperApi(baseUrl: "")
abstract class RefreshService extends ChopperService {
  @Post(path: "refresh")
  Future<Response<RefreshTokenResponseModel>> refreshToken({
    @Body() required RefreshTokenModel request,
  });

  static RefreshService create(DBService dbService) => _$RefreshService(_Client(Constants.baseUrlP, true, dbService));
}

@ChopperApi(baseUrl: "")
abstract class VisitCreateService extends ChopperService {
  @Post(path: "create_visit")
  Future<Response<BuiltList<VisitOrder>>> visitCreate({
    @Body() required VisitRequest request,
    @Header('requires-token') String requiresToken = "true",
  });

  static VisitCreateService create(DBService dbService) =>
      _$VisitCreateService(_Client(Constants.baseUrlP, true, dbService));
}

//Booking
@ChopperApi(baseUrl: "/booking/")
abstract class BookingService extends ChopperService {
  @Get(path: "types")
  Future<Response<BuiltList<BookingTypeModel>>> bookingTypes();

  @Get(path: 'category_services/{service_type_id}')
  Future<Response<BuiltList<Category>>> getServiceId(@Path('service_type_id') int id);

  @Post(path: 'doctors')
  Future<Response<BuiltList<ThirdBookingService>>> fetchDoctors({
    @Header('requires-token') String requiresToken = 'true',
    @Query("days") int? days,
    @Body() required DoctorsRequest request,
  });

  @Get(path: "categories")
  Future<Response<BuiltList<HomepageBookingCategory>>> getHomePageBookingCategory();

  @Get(path: 'category_doctors_services/{category_id}')
  Future<Response<MedicalModel>> getHomePageBookingDoctors(@Path('category_id') int id);

  @Post(path: "doctor/day")
  static BookingService create(DBService dbService) => _$BookingService(_Client(Constants.baseUrlP, true, dbService));

  @Get(path: 'services_by_doctor/{doctor_id }')
  Future<Response<MedicalServiceCategory>> getHomePageBookingDoctorsByID(@Path('doctor_id ') int id);

//MedicalServiceCategory
}

//Home Page
@ChopperApi(baseUrl: "/home/")
abstract class HomePageService extends ChopperService {
  @Get(path: "news")
  Future<Response<BuiltList<News>>> getNews();

  @Get(path: "medical_services")
  Future<Response<BuiltList<DiagnosticsModel>>> getMedicalServices();

  @Get(path: "diseases")
  Future<Response<BuiltList<DiseaseModle>>> getDisease();

  @Get(path: "advertisements")
  Future<Response<BuiltList<AdModel>>> getAds();

  @Get(path: "company_location")
  Future<Response<BuiltList<LocationModel>>> getCompanyLocatiom();

  static HomePageService create(DBService dbService) => _$HomePageService(_Client(Constants.baseUrlP, true, dbService));
}

//Doctors

@ChopperApi(baseUrl: "/doctor/")
abstract class DoctorService extends ChopperService {
  @Get(path: 'doctors_info')
  Future<Response<DoctorCategory>> getDoctorsInfo();

  @Get(path: 'detail-info/{doctor_id}')
  Future<Response<ModelDoctor>> getDoctorDetailInfo(@Path('doctor_id') int id);

  @Get(path: 'doctor-jobs')
  Future<Response<BuiltList<DoctorsJob>>> getDoctorsJob();

  static DoctorService create(DBService dbService) => _$DoctorService(_Client(Constants.baseUrlP, true, dbService));
}

// main
@ChopperApi(baseUrl: '/upload/')
@pragma('vm:entry-point')
abstract class UploadImage extends ChopperService {
  @Post(path: '')
  @multipart
  Future<Response<ImageUploadResponseModel>> imageUpload(@PartFile('file') MultipartFile file,
      {@Header('Content-Type') String contentType = 'multipart/form-data',
      @Header('requires-token') String requiresToken = 'true'});

  static UploadImage create(DBService dbService) => _$UploadImage(_Client("", true, dbService, timeout: 300));
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
  Future<Response<BuiltList<VisitOrder>>> getPatientVisitsMobile({
    @Header('requires-token') String requiresToken = "true",
  });

  @Get(path: "patient_analysis_mobile")
  Future<Response<PatientDocuments>> getPatientAnalyze({
    @Header('requires-token') String requiresToken = "true",
  });

  @Get(path: "my_wallet")
  Future<Response<PaymentResponse>> getMyWallet({
    @Header('requires-token') String requiresToken = "true",
  });

  static PatientService create(DBService dbService) => _$PatientService(_Client(Constants.baseUrlP, true, dbService));
}

@ChopperApi(baseUrl: "/branch")
abstract class BranchService extends ChopperService {
  @Get(path: "/about-branches")
  Future<Response<BuiltList<BranchModel>>> getBranchInfo();

  @Get(path: "/awards")
  Future<Response<BuiltList<AwardsModel>>> getAwards();

  @Get(path: "/detail/{branch_id}")
  Future<Response<BranchDetailModel>> getBranchDetail(@Path('branch_id') int id);

  static BranchService create(DBService dbService) => _$BranchService(_Client(Constants.baseUrlP, true, dbService));
}

@ChopperApi(baseUrl: "")
abstract class SearchService extends ChopperService {
  @Post(path: "/his-web-search")
  Future<Response<MedionResponseSearchText>> getBranchInfo(@Body() SearchReqModel request);

  static SearchService create(DBService dbService) => _$SearchService(_Client(Constants.baseUrlP, true, dbService));
}

@ChopperApi(baseUrl: "")
abstract class StudyService extends ChopperService {
  @Get(path: "/study")
  Future<Response<EducationModel>> getStudy();

  static StudyService create(DBService dbService) => _$StudyService(_Client(Constants.baseUrlP, true, dbService));
}

@ChopperApi(baseUrl: "")
abstract class HelpCallService extends ChopperService {
  @Post(path: "/help/call")
  Future<Response<ServiceResponse>> serviceReqCall({@Body() required ServiceRequest request});

  static StudyService create(DBService dbService) => _$StudyService(_Client(Constants.baseUrlP, true, dbService));
}

@ChopperApi(baseUrl: "/company/")
abstract class CompanyService extends ChopperService {
  @Get(path: "activity")
  Future<Response<MedionModel>> getMedionActivity();

  @Get(path: "offerta")
  Future<Response<OfferModel>> getOfferta();

  @Get(path: "privacy")
  Future<Response<PrivacyModel>> getPrivacy();

  @Get(path: "team")
  Future<Response<Map<String, dynamic>>> getTeam();

  static CompanyService create(DBService dbService) => _$CompanyService(_Client(Constants.baseUrlP, true, dbService));
}

@ChopperApi(baseUrl: "")
abstract class ContentService extends ChopperService {
  @Get(path: "/content/{type}")
  Future<Response<BuiltList<ContentModel>>> getContentType(@Path('type') String type);

  static ContentService create(DBService dbService) => _$ContentService(_Client(Constants.baseUrlP, true, dbService));
}

@ChopperApi(baseUrl: "recruitment")
abstract class RecruitmentService extends ChopperService {
  @Get(path: "/vacancies")
  Future<Response<VacancyModel>> getVacancies();

  @Get(path: "/vacancies")
  Future<Response<JobApplicationModel>> getVacancySingle({@Query('vacancy_id') int? id});

  @Post(path: "/apply")
  Future<Response<ResultVacancyModel>> uploadVacancy({@Body() required UploadVacancyModel vacancy});

  static RecruitmentService create(DBService dbService) =>
      _$RecruitmentService(_Client(Constants.baseUrlP, true, dbService));
}

base class _Client extends ChopperClient {
  _Client(String baseUrl, bool useInterceptors, DBService dbService, {int timeout = 5})
      : super(
          client: TimeoutHttpClient(Client(), timeout: Duration(seconds: timeout)),
          baseUrl: Uri.parse(baseUrl),
          interceptors: useInterceptors
              ? [
                  CoreInterceptor(dbService, alice.getNavigatorKey()!),
                  if (AppConfig.shared.flavor == Flavor.dev) ...[],
                  HtmlDecodeInterceptor(),
                  CurlInterceptor(),
                  NetworkInterceptor(),
                  RetryInterceptor(maxRetries: 5, retryDelay: const Duration(seconds: 1)),
                  BackendInterceptor(),
                  const LogInterceptor(),
                ]
              : [const LogInterceptor()],
          converter: BuiltValueConverter(),
          errorConverter: ErrorMyConverter(),
          authenticator: MyAuthenticator(dbService),
        );
}

class MyAuthenticator extends Authenticator {
  final DBService dbService;

  MyAuthenticator(this.dbService);

  @override
  FutureOr<Request?> authenticate(Request request, Response response, [Request? originalRequest]) async {
    if (response.statusCode == 401) {
      final refreshToken = dbService.token.refreshToken;
      LogService.d("Attempting refresh with token: $refreshToken");

      if (refreshToken == null || refreshToken.isEmpty) {
        LogService.w("No valid refresh token");
        await dbService.signOut();
        return null;
      }

      final authRepo = AuthRepository(
        dbService,
        AuthService.create(dbService),
        PatientService.create(dbService),
        RefreshService.create(dbService),
      );
      final result = await authRepo.refreshToken(refreshToken);

      print("REFRESH TOKEN AUTH$refreshToken");

      return result.fold(
        (failure) {
          LogService.e("Refresh failed: $failure \n ${failure.message}");
          dbService.signOut();
          return null;
        },
        (data) {
          LogService.d("Refresh succeeded: access=${data.accessToken}");
          dbService.setToken(Token(
            accessToken: data.accessToken,
            refreshToken: refreshToken,
            tokenType: data.tokenType,
          ));

          final updatedHeaders = Map<String, String>.of(request.headers);
          updatedHeaders['Authorization'] = '${data.tokenType} ${data.accessToken}';
          return request.copyWith(headers: updatedHeaders);
        },
      );
    } else if (response.statusCode >= 400) {
      LogService.e("Non-401 error: ${response.statusCode}");
      throw BackendExceptionForSentry(response);
    }
    return null;
  }
}
