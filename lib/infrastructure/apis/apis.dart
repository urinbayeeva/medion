import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:http/http.dart' show Client;
import 'package:medion/domain/common/token.dart';
import 'package:medion/domain/models/auth/auth.dart';
import 'package:medion/domain/models/service_model/service_model.dart';
import 'package:medion/domain/serializers/built_value_convertor.dart';
import 'package:medion/domain/success_model/success_model.dart';
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
@pragma('vm:entry-point')
abstract class AuthService extends ChopperService {
  static AuthService create(DBService dbService) =>
      _$AuthService(_Client(Constants.baseUrlP, true, dbService));

  @Post(path: 'phone-number')
  Future<Response<SuccessModel>> phoneNumber({
    @Body() required VerificationSendReq request,
  });

  @Post(path: 'anonymous/user/create')
  Future<Response<FCMTokenModel>> createAnonymousUser({
    @Body() required FCMTokenModel request,
  });

  @Post(path: 'verification-code/verify/')
  Future<Response<LoginRes>> verificationVerify({
    @Body() required VerificationVerifyReq request,
  });

  @Put(path: 'registration/')
  Future<Response<SuccessModel>> registration({
    @Body() required RegisterReq request,
  });

  @Post(path: 'login')
  Future<Response<LoginRes>> signIn({
    @Body() required SignInReq request,
  });

  @Put(path: 'password')
  Future<Response<SuccessModel>> updatePassword({
    @Body() required ResetPasswordReq request,
  });

  @Post(path: 'forgot-password')
  Future<Response<LoginRes>> forgotPassword({
    @Body() required ForgotPasswordReqModel request,
  });

  @Patch(path: 'profile')
  Future<Response<SuccessModel>> updateProfile(
      {@Body() required ProfileModel request,
      @Header('requires-token') String requiresToken = 'true'});

  @Post(path: 'phone-update/')
  Future<Response<SuccessModel>> updatePhone(
      {@Body() required VerificationVerifyReq request,
      @Header('requires-token') String requiresToken = 'true'});

  @Delete(path: 'destroy')
  Future<Response<dynamic>> deleteProfile(
      {@Header('requires-token') String requiresToken = 'true'});

  @Post(path: 'verify/add-phone/')
  Future<Response<SuccessModel>> additionalNumberVerify(
      {@Body() required VerificationVerifyReq request,
      @Header('requires-token') String requiresToken = 'true'});

  @Get(path: 'profile')
  Future<Response<ProfileRes>> getProfile(
      {@Header('requires-token') String requiresToken = 'true'});

  verificationSend({required VerificationSendReq request}) {}
}

@ChopperApi(baseUrl: "/api/")
abstract class MedService extends ChopperService {
  @Get(path: 'medical_services')
  Future<Response<List<ServiceResResult>>> getServiceTypes(
    @Query('id') int? id,
    @Query('name') String? name,
    @Query('icon') String? icon,
  );
}

@ChopperApi(baseUrl: '/business/')
@pragma('vm:entry-point')
abstract class BusinessService extends ChopperService {
  @Post(path: 'login')
  Future<Response<LoginRes>> signIn({@Body() required SignInReq request});

  static BusinessService create(DBService dbService) =>
      _$BusinessService(_Client(Constants.baseUrlP, true, dbService));
}

abstract class ChatRoomService extends ChopperService {
  @Post(path: 'api/upload/firebase/token')
  Future<Response<dynamic>> postFcmToken(
      {@Header('Authorization') required String authorization,
      @Body() required FCMTokenModel request,
      @Header('requires-token') String requiresToken = 'true'});

  // static ChatRoomService create(DBService dbService) =>
  //     _$ChatRoomService(_Client(Constants.baseUrlP, true, dbService));
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
        final result = await AuthRepository.refreshToken(
            dbService.token.refreshToken ?? "");

        Map<String, String>? header;

        result.fold((error) {
          dbService.signOut();
        }, (data) {
          dbService.setToken(
              Token(accessToken: data.access, refreshToken: data.refresh));
          String? newToken = data.access;

          final Map<String, String> updatedHeaders =
              Map<String, String>.of(request.headers);

          newToken = 'Bearer $newToken';
          updatedHeaders.update('Authorization', (String _) => newToken!,
              ifAbsent: () => newToken!);

          header = updatedHeaders;
          return request.copyWith(headers: header);
        });
      } catch (e) {
        LogService.i(e.toString());

        dbService.signOut();
      }
    } else {
      if (response.statusCode >= 400) {
        BackendExceptionForSentry exceptionForSentry =
            BackendExceptionForSentry(response);
        throw exceptionForSentry;
      }
    }
    return null;
  }
}
