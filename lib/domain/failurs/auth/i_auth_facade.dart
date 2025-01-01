import 'package:dartz/dartz.dart';
import 'package:medion/domain/common/failure.dart';
import 'package:medion/domain/models/auth/auth.dart';
import 'package:medion/domain/success_model/success_model.dart';

import 'auth_failure.dart';

/// Authentication Facade Interface
abstract class IAuthFacade {
  /// Check if user exists
  Option<AuthFailure> checkUser();

  /// Send verification request
  Future<Either<ResponseFailure, SuccessModel>> verificationSend({
    required VerificationSendReq request,
  });

  /// Send phone number request
  Future<Either<ResponseFailure, SuccessModel>> sendPhoneNumber({
    required PhoneNumberSendReq request,
  });
}
