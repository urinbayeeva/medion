import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:medion/domain/success_model/success_model.dart';
import '../models/auth/auth.dart';

part 'serializer.g.dart';

@SerializersFor([
  //Auth
  RegisterReq,
  VerificationSendReq,
  VerificationVerifyReq,
  SignInReq,
  PasswordReq,
  LoginRes,
  SuccessModel,
  CheckAuthModel,
  ResetPasswordReq,
  ProfileModel,
  ProfileRes,
  ForgotPasswordReqModel,
  FCMTokenModel,

])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
