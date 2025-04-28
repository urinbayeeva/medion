import 'package:built_collection/built_collection.dart';
import 'package:dartz/dartz.dart';
import 'package:medion/domain/common/failure.dart';
import 'package:medion/domain/models/auth/auth.dart';
import 'package:medion/domain/models/profile/profile_model.dart';
import 'package:medion/domain/models/visit/visit_model.dart';
import 'package:medion/domain/success_model/response_model.dart';
import 'package:medion/domain/success_model/success_model.dart';
import 'package:medion/domain/upload_image/upload_image.dart';

import 'auth_failure.dart';

/// Authentication Facade Interface
abstract class IAuthFacade {
  /// Check if user exists
  Option<AuthFailure> checkUser();

  Future<Either<ResponseFailure, ResponseModel>> registerUser({
    required RegisterReq request,
  });

  Future<Either<ResponseFailure, SuccessModel>> sendPhoneNumber({
    required PhoneNumberSendReq request,
  });

  Future<Either<ResponseFailure, CreatePatientInfoResponse>> sendUserInfo({
    required CreateInfoReq request,
  });

  Future<Either<ResponseFailure, PatientInfo>> getPatientInfo();

  Future<Either<ResponseFailure, List<VisitOrder>>> getPatientVisits();

  Future<Either<ResponseFailure, PatientDocuments>> getPatientAnalyze();

  Future<Either<ResponseFailure, SuccessModel>> postPatientPhoto({
    required ImageUploadResponseModel image,
  });
}
