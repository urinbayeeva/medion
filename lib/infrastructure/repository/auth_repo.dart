import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:medion/domain/common/failure.dart';
import 'package:medion/domain/common/token.dart';
import 'package:medion/domain/common/token_ext.dart';
import 'package:medion/domain/failurs/auth/auth_failure.dart';
import 'package:medion/domain/failurs/auth/i_auth_facade.dart';
import 'package:medion/domain/models/auth/auth.dart';
import 'package:medion/domain/models/profile/profile_model.dart';
import 'package:medion/domain/models/visit/visit_model.dart';
import 'package:medion/domain/success_model/response_model.dart';
import 'package:medion/domain/success_model/success_model.dart';
import 'package:medion/domain/upload_image/upload_image.dart';
import 'package:medion/infrastructure/apis/apis.dart';
import 'package:medion/infrastructure/services/local_database/db_service.dart';
import 'package:medion/infrastructure/services/log_service.dart';
import 'package:http/http.dart' as http;
import 'package:medion/presentation/component/easy_loading.dart';
import 'package:medion/utils/constants.dart';

class AuthRepository implements IAuthFacade {
  final DBService _dbService;
  final AuthService _authService;
  final PatientService _patientService;
  final RefreshService _refreshService;

  AuthRepository(
    this._dbService,
    this._authService,
    this._patientService,
    this._refreshService,
  );

  Future<Either<ResponseFailure, RefreshTokenResponseModel>> refreshToken(
      String refresh) async {
    try {
      final response = await _refreshService.refreshToken(
        request: RefreshTokenModel((b) => b..token = refresh),
      );

      if (response.isSuccessful) {
        if (response.body != null) {
          LogService.d("Refresh succeeded: ${response.body!.accessToken}");
          return right(response.body!);
        } else {
          LogService.e("Response successful but body is null");
          return left(InvalidCredentials(message: 'Response body is null'));
        }
      } else {
        LogService.e(
            "Refresh failed: ${response.statusCode} - ${response.error}");
        return left(InvalidCredentials(message: 'invalid_credential'.tr()));
      }
    } catch (e, stackTrace) {
      LogService.e("Refresh error: $e\nStackTrace: $stackTrace");
      return left(handleError(e));
    }
  }

  @override
  Option<AuthFailure> checkUser() {
    final Token token = _dbService.token;
    return optionOf(token.hasFailure);
  }

  @override
  Future<Either<ResponseFailure, ResponseModel>> registerUser(
      {required RegisterReq request}) async {
    try {
      final res = await _authService.registerUser(request: request);

      if (res.isSuccessful && res.body != null) {
        bool isNewUser = res.body!.isNewPatient;

        if (!isNewUser &&
            res.body!.accessToken!.isNotEmpty &&
            res.body!.refreshToken!.isNotEmpty) {
          _dbService.setToken(Token(
            accessToken: res.body!.accessToken!,
            refreshToken: res.body!.refreshToken!,
            tokenType: 'Bearer',
          ));

          return right(res.body!);
        } else {
          return right(res.body!);
        }
      } else {
        if (res.body?.message.toLowerCase().contains('incorrect code') ==
            true) {
          return left(InvalidCredentials(message: 'incorrect_sms_code'.tr()));
        }
        return left(InvalidCredentials(message: 'incorrect_sms_code'.tr()));
      }
    } catch (e) {
      LogService.e("Register error: $e");
      // Also handle the case where the error might be in the exception message
      if (e.toString().toLowerCase().contains('incorrect code')) {
        return left(InvalidCredentials(message: 'incorrect_sms_code'.tr()));
      }
      return left(handleError(e));
    }
  }

  @override
  Future<Either<ResponseFailure, SuccessModel>> sendPhoneNumber({
    required PhoneNumberSendReq request,
  }) async {
    try {
      final response = await _authService.phoneNumberSend(request: request);

      LogService.d('Response Status: ${response.statusCode}');
      LogService.d('Response Body: ${response.body}');

      if (response.isSuccessful) {
        final body = response.body;
        if (body != null) {
          return right(body);
        } else {
          return left(
            InvalidCredentials(message: 'Empty response from server'),
          );
        }
      } else {
        String errorMessage;

        if (response.statusCode == 403) {
          errorMessage = 'too_many_attempts'.tr();
        } else {
          errorMessage = response.error?.toString() ?? 'Unknown Error';
        }

        return left(InvalidCredentials(message: errorMessage));
      }
    } catch (e, stackTrace) {
      LogService.e(
        "Error in sendPhoneNumber: ${e.toString()} \nStackTrace: $stackTrace",
      );
      return left(
        InvalidCredentials(message: 'too_many_attempts'.tr()),
      );
    }
  }

  @override
  Future<Either<ResponseFailure, CreatePatientInfoResponse>> sendUserInfo(
      {required CreateInfoReq request}) async {
    try {
      final res = await _authService.createUserInfo(request: request);
      if (res.isSuccessful) {
        _dbService.setToken(Token(
          tokenType: res.body?.tokenType,
          accessToken: res.body?.accesstoken,
          refreshToken: res.body?.refreshtoken,
        ));

        return right(res.body!);
      } else {
        return left(InvalidCredentials(message: 'invalid_credential'.tr()));
      }
    } catch (e) {
      LogService.e(" ----> error on repo  : ${e.toString()}");
      return left(handleError(e));
    }
  }

  @override
  Future<Either<ResponseFailure, PatientInfo>> getPatientInfo() async {
    try {
      final token = _dbService.token.toBearerToken;
      LogService.d("Fetching patient info with token: $token");
      if (token == null) {
        return left(InvalidCredentials(message: 'invalid_credential'.tr()));
      }
      final service = PatientService.create(_dbService);
      final res = await service.getPatientInfo();
      if (res.isSuccessful && res.body != null) {
        LogService.d("Patient info: ${res.body}");
        return right(res.body!);
      } else {
        LogService.e("Server error: ${res.statusCode} - ${res.error}");
        return left(InvalidCredentials(message: 'invalid_credential'.tr()));
      }
    } catch (e) {
      LogService.e("----> error fetching patient info: $e");
      return left(handleError(e));
    }
  }

  @override
  Future<Either<ResponseFailure, List<VisitOrder>>> getPatientVisits() async {
    try {
      final res = await _patientService.getPatientVisitsMobile();

      if (res.isSuccessful && res.body != null) {
        LogService.d('Response Status: ${res.statusCode}');
        LogService.d('Response Body: ${res.body}');
        return right(res.body!.toList());
      } else {
        return left(InvalidCredentials(
          message:
              'Failed to fetch patient visits: ${res.statusCode}, ${res.body.toString()}',
        ));
      }
    } catch (e) {
      LogService.e(" ----> error fetching patient visits: ${e.toString()}");
      return left(handleError(e));
    }
  }

  @override
  Future<Either<ResponseFailure, PatientDocuments>> getPatientAnalyze() async {
    try {
      EasyLoading.show(status: 'Loading...'.tr());

      final res = await _patientService.getPatientAnalyze();

      if (res.isSuccessful && res.body != null) {
        LogService.d('Response Status: ${res.statusCode}');
        LogService.d('Response Body: ${res.body}');
        EasyLoading.dismiss();
        return right(res.body!);
      } else {
        EasyLoading.dismiss();
        return left(InvalidCredentials(
          message:
              'Failed to fetch patient analyze: ${res.statusCode}, ${res.body.toString()}',
        ));
      }
    } catch (e) {
      EasyLoading.dismiss();
      LogService.e(" ----> error fetching patient analyze: ${e.toString()}");
      return left(handleError(e));
    }
  }

  @override
  Future<Either<ResponseFailure, SuccessModel>> postPatientPhoto({
    required ImageUploadResponseModel image,
  }) async {
    try {
      final response = await _patientService.patientImageUpload(
        image:
            ImageUploadResponseModel((b) => b..imageBase64 = image.imageBase64),
      );

      LogService.d('Response Status: ${response.statusCode}');
      LogService.d('Response Body: ${response.body}');

      if (response.isSuccessful && response.body != null) {
        return right(response.body!); // Use response.body directly
      } else {
        return left(InvalidCredentials(message: 'invalid_credential'.tr()));
      }
    } catch (e) {
      LogService.e(" ----> error on repo : ${e.toString()}");
      return left(handleError(e));
    }
  }
}

///
Future<List<dynamic>> fetchServiceData() async {
  final response = await http
      .get(Uri.parse('https://his.uicgroup.tech/apiweb/booking/doctors'));

  if (response.statusCode == 200) {
    // Parse the JSON response
    return json.decode(response.body);
  } else {
    // Throw an error if the request fails
    throw Exception('Failed to load service data');
  }
}
