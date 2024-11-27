import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:medion/domain/common/failure.dart';
import 'package:medion/domain/common/token.dart';
import 'package:medion/domain/common/token_ext.dart';
import 'package:medion/domain/failurs/auth/auth_failure.dart';
import 'package:medion/domain/failurs/auth/i_auth_facade.dart';
import 'package:medion/domain/models/auth/auth.dart';
import 'package:medion/domain/success_model/success_model.dart';

import 'package:medion/infrastructure/apis/apis.dart';
import 'package:medion/infrastructure/services/local_database/db_service.dart';
import 'package:medion/infrastructure/services/log_service.dart';
import 'package:medion/utils/constants.dart';

class AuthRepository implements IAuthFacade {
  final DBService _dbService;
  final AuthService _authService;


  AuthRepository(
    this._dbService,
    this._authService,
   
  );

  /// Get user
  @override
  Option<AuthFailure> checkUser() {
    final Token token = _dbService.token;
    return optionOf(token.hasFailure);
  }

  @override
  Future<Either<ResponseFailure, SuccessModel>> registration(
      {required RegisterReq request}) async {
    if (_dbService.token.accessToken == null) {
      return left(const InvalidCredentials(message: 'invalid_credential'));
    }

    try {
      final res = await _authService.registration(
        request: request,
      );
      if (res.isSuccessful) {
        return right(res.body!);
      } else {
        return left(const InvalidCredentials(message: 'invalid_credential'));
      }
    } catch (e) {
      LogService.e(" ----> error on repo  : ${e.toString()}");
      return left(handleError(e));
    }
  }

  @override
  Future<Either<ResponseFailure, SuccessModel>> verificationSend(
      {required VerificationSendReq request}) async {
    try {
      final res = await _authService.verificationSend(request: request);
      if (res.isSuccessful) {
        return right(res.body!);
      } else {
        return left(const InvalidCredentials(message: 'invalid_credential'));
      }
    } catch (e) {
      LogService.e(" ----> error on repo  : ${e.toString()}");
      return left(handleError(e));
    }
  }

  @override
  Future<Either<ResponseFailure, LoginRes>> verificationVerify(
      {required VerificationVerifyReq request}) async {
    try {
      final res = await _authService.verificationVerify(request: request);
      if (res.isSuccessful) {
        _dbService.setToken(Token(
            accessToken: res.body?.access, refreshToken: res.body?.refresh));
        return right(res.body!);
      } else {
        return left(const InvalidCredentials(message: 'invalid_credential'));
      }
    } catch (e) {
      LogService.e(" ----> error on repo  : ${e.toString()}");
      return left(handleError(e));
    }
  }

  @override
  Future<Either<ResponseFailure, LoginRes>> signIn(
      {required SignInReq request}) async {
    try {
      final res = await _authService.signIn(request: request);
      if (res.isSuccessful) {
        _dbService.setToken(Token(
            accessToken: res.body?.access, refreshToken: res.body?.refresh));
        return right(res.body!);
      } else {
        return left(const InvalidCredentials(message: 'invalid_credential'));
      }
    } catch (e) {
      LogService.e(" ----> error on repo  : ${e.toString()}");
      return left(handleError(e));
    }
  }



  @override
  Future<Either<ResponseFailure, SuccessModel>> updatePassword(
      {required ResetPasswordReq request}) async {
    try {
      final res = await _authService.updatePassword(
        request: request,
      );
      if (res.isSuccessful) {
        return right(res.body!);
      } else {
        return left(const InvalidCredentials(message: 'invalid_credential'));
      }
    } catch (e) {
      LogService.e(" ----> error on repo  : ${e.toString()}");
      return left(handleError(e));
    }
  }

  @override
  Future<Either<ResponseFailure, LoginRes>> forgotPassword(
      {required ForgotPasswordReqModel request}) async {
    try {
      final res = await _authService.forgotPassword(
        request: request,
      );
      if (res.isSuccessful) {
        _dbService.setToken(Token(
            accessToken: res.body?.access, refreshToken: res.body?.refresh));
        return right(res.body!);
      } else {
        return left(const InvalidCredentials(message: 'invalid_credential'));
      }
    } catch (e) {
      LogService.e(" ----> error on repo  : ${e.toString()}");
      return left(handleError(e));
    }
  }

  @override
  Future<Either<ResponseFailure, SuccessModel>> updatePhone(
      {required VerificationVerifyReq request}) async {
    try {
      final res = await _authService.updatePhone(
        request: request,
      );
      if (res.isSuccessful) {
        return right(res.body!);
      } else {
        return left(const InvalidCredentials(message: 'invalid_credential'));
      }
    } catch (e) {
      LogService.e(" ----> error on repo  : ${e.toString()}");
      return left(handleError(e));
    }
  }

  @override
  Future<Either<ResponseFailure, SuccessModel>> additionalNumberVerify(
      {required VerificationVerifyReq request}) async {
    try {
      final res = await _authService.additionalNumberVerify(request: request);
      if (res.isSuccessful) {
        return right(res.body!);
      } else {
        return left(const InvalidCredentials(message: 'invalid_credential'));
      }
    } catch (e) {
      LogService.e(" ----> error on repo  : ${e.toString()}");
      return left(handleError(e));
    }
  }


  @override
  Future<Either<ResponseFailure, ProfileRes>> getProfile() async {
    if (_dbService.token.accessToken == null) {
      return left(const InvalidCredentials(message: 'invalid_credential'));
    }
    try {
      final business = (_dbService.getBool(key: DBService.business) ?? false);
      final res = await _authService.getProfile();
      if (res.isSuccessful) {
       
        return right(res.body!);
      } else {
        return left(const InvalidCredentials(message: 'invalid_credential'));
      }
    } catch (e) {
      LogService.e(" ----> error on repo  : ${e.toString()}");
      return left(handleError(e));
    }
  }

  @override
  Future<Either<ResponseFailure, dynamic>> deleteProfile() async {
    if (_dbService.token.accessToken == null) {
      return left(const InvalidCredentials(message: 'invalid_credential'));
    }
    try {
      final res = await _authService.deleteProfile();

      if (res.isSuccessful) {
        return right(res.body!);
      } else {
        return left(const InvalidCredentials(message: 'invalid_credential'));
      }
    } catch (e) {
      LogService.e(" ----> error on repo  : ${e.toString()}");
      return left(handleError(e));
    }
  }

  @override
  Future<Either<ResponseFailure, SuccessModel>> updateProfile(
      {required ProfileModel request}) async {
    if (_dbService.token.accessToken == null) {
      return left(const InvalidCredentials(message: 'invalid_credential'));
    }

    try {
      final res = await _authService.updateProfile(
        request: request,
      );
      if (res.isSuccessful) {
        return right(res.body!);
      } else {
        return left(const InvalidCredentials(message: 'invalid_credential'));
      }
    } catch (e) {
      LogService.e(" ----> error on repo  : ${e.toString()}");
      return left(handleError(e));
    }
  }

 


  Future<String> getDeviceModel() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        return androidInfo.id;
      } else if (Platform.isIOS) {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        return iosInfo.identifierForVendor ?? "";
      } else {
        return "";
      }
    } catch (e) {
      LogService.e("$e");
      return "";
    }
  }


  static Future<Either<ResponseFailure, LoginRes>> refreshToken(
      String refresh) async {
    try {
      final response = await Dio().post(
        "${Constants.baseUrlP}/token/refresh/",
        data: {'refresh': refresh},
      );

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return right(LoginRes(
          (b) => b
            ..refresh = response.data['refresh']
            ..access = response.data['access'],
        ));
      } else {
        return left(InvalidCredentials(message: 'invalid_credential'));
      }
    } catch (e) {
      LogService.e(" ----> error on repo  : ${e.toString()}");
      return left(handleError(e));
    }
  }



  @override
  Future<Either<ResponseFailure, FCMTokenModel>> createAnonymousUser() async {
    if (_dbService.token.accessToken == null) {
      try {
        String deviceId = await getDeviceModel();
        FCMTokenModel model = FCMTokenModel((p0) => p0..deviceId = deviceId);
        final res = await _authService.createAnonymousUser(request: model);
        if (res.isSuccessful) {
          await _dbService.setUid(res.body?.uuid);
          return right(res.body!);
        } else {
          return left(const InvalidCredentials(message: 'invalid_credential'));
        }
      } catch (e) {
        LogService.e(" ----> error on repo  : ${e.toString()}");
        return left(handleError(e));
      }
    } else {
      return left(const InvalidCredentials(message: 'invalid_credential'));
    }
  }


}
