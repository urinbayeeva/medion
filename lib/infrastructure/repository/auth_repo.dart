import 'dart:convert';

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
import 'package:medion/domain/success_model/response_model.dart';
import 'package:medion/domain/success_model/success_model.dart';
import 'package:medion/domain/upload_image/upload_image.dart';
import 'package:medion/infrastructure/apis/apis.dart';
import 'package:medion/infrastructure/services/local_database/db_service.dart';
import 'package:medion/infrastructure/services/log_service.dart';
import 'package:http/http.dart' as http;
import 'package:medion/utils/constants.dart';

class AuthRepository implements IAuthFacade {
  final DBService _dbService;
  final AuthService _authService;
  final PatientService _patientService;

  AuthRepository(
    this._dbService,
    this._authService,
    this._patientService,
  );

  /// Get user
  @override
  Option<AuthFailure> checkUser() {
    final Token token = _dbService.token;
    return optionOf(token.hasFailure);
  }

  /// Send verification code
  @override
  Future<Either<ResponseFailure, ResponseModel>> registerUser(
      {required RegisterReq request}) async {
    try {
      final res = await _authService.registerUser(request: request);

      if (res.isSuccessful && res.body != null) {
        bool isNewUser = res.body!.isNewPatient;

        if (isNewUser) {
          return right(res.body!);
        } else {
          if (res.body!.accessToken!.isNotEmpty &&
              res.body!.refreshToken!.isNotEmpty) {
            final accessToken = res.body!.accessToken![0];
            final refreshToken = res.body!.refreshToken![0];
            final tokenType = res.body!.tokenType!;

            await _dbService.setToken(Token(
              accessToken: accessToken,
              refreshToken: refreshToken,
            ));

            LogService.d("Access Token: $accessToken");
            LogService.d("Refresh Token: $refreshToken");

            return right(res.body!);
          } else {
            return left(InvalidCredentials(message: 'invalid_credential'.tr()));
          }
        }
      } else {
        return left(InvalidCredentials(message: 'invalid_credential'.tr()));
      }
    } catch (e) {
      LogService.e(" ----> error on repo  : ${e.toString()}");
      return left(handleError(e));
    }
  }

  /// Send phone number
  @override
  Future<Either<ResponseFailure, SuccessModel>> sendPhoneNumber({
    required PhoneNumberSendReq request,
  }) async {
    try {
      const String url =
          'https://his.uicgroup.tech/apiweb/patient/phone-number';

      // Request Headers
      final headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

      // Request Body
      final body = jsonEncode({
        'phone_number': request.phoneNumber,
      });

      // Make POST request
      LogService.d('Sending request to $url with body: $body');
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: body,
      );

      // Debug Logs
      LogService.d('Response Status: ${response.statusCode}');
      LogService.d('Response Body: ${response.body}');

      // Handle HTTP response
      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);

        if (responseData['status'] == 'success') {
          final successModel = SuccessModel(
              (b) => b..detail = responseData['message'] ?? 'Success');
          return right(successModel);
        } else {
          final errorMsg = responseData['message'] ?? 'Unknown error';
          return left(InvalidCredentials(message: errorMsg));
        }
      } else {
        return left(InvalidCredentials(
            message: 'Server Error: ${response.statusCode}'.tr()));
      }
    } catch (e) {
      // Handle unexpected exceptions
      LogService.e(" ----> error on phone number repo: ${e.toString()}");
      return left(InvalidCredentials(message: 'Unknown Error'.tr()));
    }
  }

  @override
  Future<Either<ResponseFailure, CreatePatientInfoResponse>> sendUserInfo(
      {required CreateInfoReq request}) async {
    try {
      final res = await _authService.createUserInfo(request: request);
      if (res.isSuccessful) {
        _dbService.setToken(Token(
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

  static Future<Either<ResponseFailure, CreatePatientInfoResponse>>
      refreshToken(String refreshToken) async {
    try {
      final response = await Dio().post(
        "${Constants.baseUrlP}/refresh/",
        data: {'refresh': refreshToken},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final createInfoReq = CreatePatientInfoResponse(
          (b) => b
            ..accesstoken = (response.data['access_token'] as List)
                .first // 
            ..refreshtoken = (response.data['refresh_token'] as List).first
            ..tokenType = response.data['token_type'],
        );

        LogService.d(
            "✅ Token refreshed successfully: ${createInfoReq.accesstoken}");
        return right(createInfoReq);
      } else if (response.statusCode == 401) {
        return left(InvalidCredentials(message: 'invalid_credential'.tr()));
      } else {
        return left(Unknown(message: 'unknown_error'.tr()));
      }
    } on DioException catch (e) {
      if (e.response != null && e.response!.statusCode == 401) {
        LogService.e("❌ Unauthorized access: ${e.response!.statusMessage}");
        return left(InvalidCredentials(message: 'invalid_credential'.tr()));
      }
      LogService.e("❌ DioException: ${e.toString()}");
      return left(Unknown(message: 'unknown_error'.tr()));
    } catch (e) {
      LogService.e("❌ Unknown exception: ${e.toString()}");
      return left(Unknown(message: 'unknown_error'.tr()));
    }
  }

  @override
  Future<Either<ResponseFailure, PatientInfo>> getPatientInfo() async {
    if (_dbService.token.accessToken == null) {
      return left(InvalidCredentials(message: 'invalid_credential'.tr()));
    }

    try {
      final res = await _patientService.getPatientInfo(requiresToken: "true");

      if (res.isSuccessful) {
        LogService.d('Response Status: ${res.statusCode}');
        LogService.d('Response Status: ${res.statusCode}');
        return right(res.body!);
      } else {
        LogService.d('Response Status: ${res.statusCode}');
        LogService.d('Response Status: ${res.statusCode}');

        return left(InvalidCredentials(message: 'invalid_credential'.tr()));
      }
    } catch (e) {
      LogService.e(" ----> error fetching patient info: ${e.toString()}");
      return left(handleError(e));
    }
  }

  @override
  Future<Either<ResponseFailure, VisitModel>> getPatientVisits() async {
    try {
      final res = await _patientService.getPatientVisitsMobile();

      if (res.isSuccessful && res.body != null) {
        LogService.d('Response Status: ${res.statusCode}');
        LogService.d('Response Body: ${res.body}');
        return right(res.body!);
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
  Future<Either<ResponseFailure, SuccessModel>> postPatientPhoto({
    required ImageUploadResponseModel image,
  }) async {
    try {
      final response = await _patientService.patientImageUpload(
        image: ImageUploadResponseModel((b) =>
            b..imageBase64 = image.imageBase64), // Pass required fields here
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
