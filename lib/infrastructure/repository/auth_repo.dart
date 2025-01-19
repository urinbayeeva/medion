import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:device_info_plus/device_info_plus.dart';
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
      // Call the registerUser method from AuthService
      final res = await _authService.registerUser(request: request);

      // Check if the response is successful
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
                tokenType: tokenType));

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
            ..accesstoken = response.data['access_token']
            ..refreshtoken = response.data['refresh_token']
            ..tokenType = response.data['token_type'],
        );
        return right(createInfoReq);
      } else if (response.statusCode == 401) {
        return left(InvalidCredentials(message: 'invalid_credential'.tr()));
      } else {
        return left(Unknown(message: 'unknown_error'.tr()));
      }
    } on DioException catch (e) {
      if (e.response != null && e.response!.statusCode == 401) {
        LogService.e(
            " ----> Unauthorized access: ${e.response!.statusMessage}");
        return left(InvalidCredentials(message: 'invalid_credential'.tr()));
      }
      LogService.e(" ----> DioException: ${e.toString()}");
      return left(Unknown(message: 'unknown_error'.tr()));
    } catch (e) {
      LogService.e(" ----> Unknown exception: ${e.toString()}");
      return left(Unknown(message: 'unknown_error'.tr()));
    }
  }

  /// Get patient information
  @override
  Future<Either<ResponseFailure, PatientInfo>> getPatientInfo({
    required String accessToken,
  }) async {
    try {
      final tokenType = _dbService.token.tokenType;
      final token = _dbService.token.accessToken;

      print("TokenType: $tokenType"); // Debugging: print token type
      print("Token: $token"); // Debugging: print access token

      if (token == null || token.isEmpty) {
        return left(const InvalidCredentials(message: 'Token not found'));
      }
      final authHeader = "Bearer $token";
      print(
          "----------------AUTH HEADER --------------- :${authHeader}"); // Debugging: print the authHeader

      print("Calling getPatientInfo with authHeader: $authHeader");

      // Make the API call to get patient info
      final res = await _patientService.getPatientInfo(authHeader);

      // Check the response status and body
      print("Response Status: ${res.statusCode}");
      print("Response Body: ${res.body}");

      // Check if the response is successful and contains body
      if (res.isSuccessful && res.body != null) {
        print("Patient Info fetched successfully");
        return right(res.body!);
      } else {
        print("Failed to fetch patient info, status code: ${res.statusCode}");
        return left(InvalidCredentials(
            message: 'Failed to fetch patient info: ${res.statusCode}'));
      }
    } catch (e) {
      // Catch any other errors
      LogService.e(" ----> error fetching patient info: ${e.toString()}");
      return left(handleError(e));
    }
  }
}
