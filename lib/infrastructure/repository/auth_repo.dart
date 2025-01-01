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
import 'package:medion/domain/success_model/success_model.dart';
import 'package:medion/infrastructure/apis/apis.dart';
import 'package:medion/infrastructure/services/local_database/db_service.dart';
import 'package:medion/infrastructure/services/log_service.dart';
import 'package:http/http.dart' as http;

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

  /// Send verification code
  @override
  Future<Either<ResponseFailure, SuccessModel>> verificationSend(
      {required VerificationSendReq request}) async {
    try {
      final res = await _authService.verificationSend(request: request);
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

  /// Send phone number
  @override
Future<Either<ResponseFailure, SuccessModel>> sendPhoneNumber({
  required PhoneNumberSendReq request,
}) async {
  try {
    // Define API URL
    final String url = 'https://his.uicgroup.tech/apiweb/patient/phone-number';

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

      // Handle success
      if (responseData['status'] == 'success') {
        // Parse the success model
        final successModel = SuccessModel((b) => b
          ..detail = responseData['message'] ?? 'Success'); // Nullable message
        return right(successModel);
      } else {
        // Handle API error message
        final errorMsg = responseData['message'] ?? 'Unknown error';
        return left(InvalidCredentials(message: errorMsg));
      }
    } else {
      // Handle server errors
      return left(InvalidCredentials(
          message: 'Server Error: ${response.statusCode}'.tr()));
    }
  } catch (e) {
    // Handle unexpected exceptions
    LogService.e(" ----> error on phone number repo: ${e.toString()}");
    return left(InvalidCredentials(message: 'Unknown Error'.tr()));
  }
}

}
