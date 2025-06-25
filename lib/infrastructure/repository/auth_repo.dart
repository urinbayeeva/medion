import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:http/http.dart' as http;
import 'package:medion/domain/common/failure.dart';
import 'package:medion/domain/common/token.dart';
import 'package:medion/domain/common/token_ext.dart';
import 'package:medion/domain/failurs/auth/auth_failure.dart';
import 'package:medion/domain/failurs/auth/i_auth_facade.dart';
import 'package:medion/domain/models/auth/auth.dart';
import 'package:medion/domain/models/payment_model.dart';
import 'package:medion/domain/models/profile/profile_model.dart';
import 'package:medion/domain/models/visit/visit_model.dart';
import 'package:medion/domain/success_model/success_model.dart';
import 'package:medion/domain/upload_image/upload_image.dart';
import 'package:medion/infrastructure/apis/apis.dart';
import 'package:medion/infrastructure/services/local_database/db_service.dart';
import 'package:medion/infrastructure/services/log_service.dart';
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

  Future<Either<ResponseFailure, RefreshTokenResponseModel>> refreshToken(String refresh) async {
    Response<RefreshTokenResponseModel>? response;

    try {
      response = await _refreshService.refreshToken(request: RefreshTokenModel((b) => b..token = refresh));

      LogService.d('Response Status: ${response.statusCode}');
      LogService.d('Response Body: ${response.body}');

      if (response.isSuccessful && response.body != null) {
        return right(response.body!);
      } else {
        return left(InvalidCredentials(message: 'invalid_credential'.tr()));
      }
    } catch (e, stack) {
      LogService.e('❌ Exception: ${e.toString()}');
      if (response != null) {
        LogService.e('❌ Error Response Status: ${response.statusCode}');
        LogService.e('❌ Error Response Body: ${response.body}');
      }
      return left(handleError(e));
    }
  }

  @override
  Option<AuthFailure> checkUser() {
    final Token token = _dbService.token;
    return optionOf(token.hasFailure);
  }

  @override
  Future<Either<ResponseFailure, RegistrationResponse>> registerUser({required RegisterReq request}) async {
    try {
      final res = await _authService.registerUser(request: request);

      if (res.isSuccessful && res.body != null) {
        final response = res.body!;

        // Handle token storage based on multi_user status
        if (!response.multiUser) {
          // Single user case - store tokens directly from response
          if (response.accessToken != null && response.refreshToken != null) {
            _dbService.setToken(Token(
              accessToken: response.accessToken!,
              refreshToken: response.refreshToken!,
              tokenType: response.tokenType ?? 'Bearer',
            ));
          }
        } else {
          // Multi-user case - store tokens from the first user (or implement your selection logic)
          if (response.users.isNotEmpty) {
            final firstUser = response.users.first;
            _dbService.setToken(Token(
              accessToken: firstUser.accessToken,
              refreshToken: firstUser.refreshToken,
              tokenType: firstUser.tokenType,
            ));
          }
        }

        return right(response);
      } else {
        // Handle specific error messages
        final errorMessage = res.body?.message ?? 'registration_failed'.tr();

        if (errorMessage.toLowerCase().contains('incorrect code')) {
          return left(InvalidCredentials(message: 'incorrect_sms_code'.tr()));
        }

        return left(InvalidCredentials(message: errorMessage));
      }
    } catch (e) {
      LogService.e("Register error: $e");

      // Handle specific exception cases
      if (e.toString().toLowerCase().contains('incorrect code')) {
        return left(InvalidCredentials(message: 'incorrect_sms_code'.tr()));
      }

      return left(InvalidCredentials(message: 'network_error'.tr()));
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
    } catch (e) {
      LogService.e("Error in sendPhoneNumber: ${e.toString()} \nStackTrace:");
      return left(
        InvalidCredentials(message: 'too_many_attempts'.tr()),
      );
    }
  }

  @override
  Future<Either<ResponseFailure, CreatePatientInfoResponse>> sendUserInfo({required CreateInfoReq request}) async {
    Response<CreatePatientInfoResponse>? response;

    try {
      response = await _authService.createUserInfo(request: request);

      LogService.d('Response Status: ${response.statusCode}');
      LogService.d('Response Body: ${response.body}');

      if (response.isSuccessful && response.body != null) {
        return right(response.body!);
      } else {
        return left(InvalidCredentials(message: 'invalid_credential'.tr()));
      }
    } catch (e) {
      LogService.e('❌ Exception: ${e.toString()}');
      if (response != null) {
        LogService.e('❌ Error Response Status: ${response.statusCode}');
        LogService.e('❌ Error Response Body: ${response.body}');
        LogService.e('❌ Error Response Error: ${response.error}');
      }
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
          message: 'Failed to fetch patient visits: ${res.statusCode}, ${res.body.toString()}',
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
          message: 'Failed to fetch patient analyze: ${res.statusCode}, ${res.body.toString()}',
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
        image: ImageUploadResponseModel((b) => b..imageBase64 = image.imageBase64),
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

  @override
  Future<Either<ResponseFailure, PaymentResponse>> getMyWallet() async {
    try {
      final response = await _patientService.getMyWallet();

      LogService.d('Wallet Response Status: ${response.statusCode}');
      LogService.d('Wallet Response Body: ${response.body}');

      if (response.isSuccessful && response.body != null) {
        return right(response.body!);
      } else {
        final errorMsg = response.error?.toString() ?? 'wallet_fetch_failed'.tr();
        return left(InvalidCredentials(message: errorMsg));
      }
    } catch (e) {
      LogService.e("getMyWallet() error: $e\nStackTrace:");
      return left(handleError(e));
    }
  }

  ///
  Future<List<dynamic>> fetchServiceData() async {
    final response = await http.get(Uri.parse('${Constants.baseUrlP}/booking/doctors'));

    if (response.statusCode == 200) {
      // Parse the JSON response
      return json.decode(response.body);
    } else {
      // Throw an error if the request fails
      throw Exception('Failed to load service data');
    }
  }
}
