import 'package:dartz/dartz.dart';
import 'package:medion/domain/common/failure.dart';
import 'package:medion/domain/models/auth/auth.dart';
import 'package:medion/domain/models/profile/profile_model.dart';
import 'package:medion/domain/success_model/response_model.dart';
import 'package:medion/domain/success_model/success_model.dart';
import 'package:medion/domain/upload_image/upload_image.dart';

import 'auth_failure.dart';

/// Authentication Facade Interface
abstract class IAuthFacade {
  /// Check if user exists
  Option<AuthFailure> checkUser();

  /// Send verification request
  Future<Either<ResponseFailure, ResponseModel>> registerUser({
    required RegisterReq request,
  });

  /// Send phone number request
  Future<Either<ResponseFailure, SuccessModel>> sendPhoneNumber({
    required PhoneNumberSendReq request,
  });

  /// Send user info
  Future<Either<ResponseFailure, CreatePatientInfoResponse>> sendUserInfo({
    required CreateInfoReq request,
  });

  /// Get patient information
  Future<Either<ResponseFailure, PatientInfo>> getPatientInfo();

  Future<Either<ResponseFailure, VisitModel>> getPatientVisits();

  /// Post patient photo
  Future<Either<ResponseFailure, SuccessModel>> postPatientPhoto({
    required ImageUploadResponseModel image,
  });
}
