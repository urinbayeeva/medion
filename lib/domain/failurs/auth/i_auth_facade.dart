import 'package:dartz/dartz.dart';
import 'package:medion/domain/common/failure.dart';
import 'package:medion/domain/models/auth/auth.dart';
import 'package:medion/domain/success_model/success_model.dart';

import 'auth_failure.dart';

abstract class IAuthFacade {
  Option<AuthFailure> checkUser();

  Future<Either<ResponseFailure, SuccessModel>> registration({
    required RegisterReq request,
  });

  Future<Either<ResponseFailure, SuccessModel>> verificationSend({
    required VerificationSendReq request,
  });

  Future<Either<ResponseFailure, LoginRes>> verificationVerify({
    required VerificationVerifyReq request,
  });

  Future<Either<ResponseFailure, LoginRes>> signIn({
    required SignInReq request,
  });

  Future<Either<ResponseFailure, SuccessModel>> updatePassword({
    required ResetPasswordReq request,
  });

  Future<Either<ResponseFailure, SuccessModel>> updateProfile(
      {required ProfileModel request});

  Future<Either<ResponseFailure, SuccessModel>> updatePhone(
      {required VerificationVerifyReq request});

  Future<Either<ResponseFailure, SuccessModel>> additionalNumberVerify(
      {required VerificationVerifyReq request});

  Future<Either<ResponseFailure, ProfileRes>> getProfile();
  Future<Either<ResponseFailure, dynamic>> deleteProfile();
  Future<Either<ResponseFailure, LoginRes>> forgotPassword(
      {required ForgotPasswordReqModel request});

  Future<Either<ResponseFailure, FCMTokenModel>> createAnonymousUser();
}
