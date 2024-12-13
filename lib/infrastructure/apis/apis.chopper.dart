// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apis.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$AuthService extends AuthService {
  _$AuthService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = AuthService;

  @override
  Future<Response<SuccessModel>> verificationSend(
      {required VerificationSendReq request}) {
    final Uri $url = Uri.parse('/api/code');
    final $body = request;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<SuccessModel, SuccessModel>($request);
  }

  @override
  Future<Response<FCMTokenModel>> createAnonymousUser(
      {required FCMTokenModel request}) {
    final Uri $url = Uri.parse('/api/anonymous/user/create');
    final $body = request;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<FCMTokenModel, FCMTokenModel>($request);
  }

  @override
  Future<Response<LoginRes>> verificationVerify(
      {required VerificationVerifyReq request}) {
    final Uri $url = Uri.parse('/api/verification-code/verify/');
    final $body = request;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<LoginRes, LoginRes>($request);
  }

  @override
  Future<Response<SuccessModel>> registration({required RegisterReq request}) {
    final Uri $url = Uri.parse('/api/registration/');
    final $body = request;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<SuccessModel, SuccessModel>($request);
  }

  @override
  Future<Response<LoginRes>> signIn({required SignInReq request}) {
    final Uri $url = Uri.parse('/api/login');
    final $body = request;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<LoginRes, LoginRes>($request);
  }

  @override
  Future<Response<SuccessModel>> updatePassword(
      {required ResetPasswordReq request}) {
    final Uri $url = Uri.parse('/api/password');
    final $body = request;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<SuccessModel, SuccessModel>($request);
  }

  @override
  Future<Response<LoginRes>> forgotPassword(
      {required ForgotPasswordReqModel request}) {
    final Uri $url = Uri.parse('/api/forgot-password');
    final $body = request;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<LoginRes, LoginRes>($request);
  }

  @override
  Future<Response<SuccessModel>> updateProfile({
    required ProfileModel request,
    String requiresToken = 'true',
  }) {
    final Uri $url = Uri.parse('/api/profile');
    final Map<String, String> $headers = {
      'requires-token': requiresToken,
    };
    final $body = request;
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<SuccessModel, SuccessModel>($request);
  }

  @override
  Future<Response<SuccessModel>> updatePhone({
    required VerificationVerifyReq request,
    String requiresToken = 'true',
  }) {
    final Uri $url = Uri.parse('/api/phone-update/');
    final Map<String, String> $headers = {
      'requires-token': requiresToken,
    };
    final $body = request;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<SuccessModel, SuccessModel>($request);
  }

  @override
  Future<Response<dynamic>> deleteProfile({String requiresToken = 'true'}) {
    final Uri $url = Uri.parse('/api/destroy');
    final Map<String, String> $headers = {
      'requires-token': requiresToken,
    };
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<SuccessModel>> additionalNumberVerify({
    required VerificationVerifyReq request,
    String requiresToken = 'true',
  }) {
    final Uri $url = Uri.parse('/api/verify/add-phone/');
    final Map<String, String> $headers = {
      'requires-token': requiresToken,
    };
    final $body = request;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<SuccessModel, SuccessModel>($request);
  }

  @override
  Future<Response<ProfileRes>> getProfile({String requiresToken = 'true'}) {
    final Uri $url = Uri.parse('/api/profile');
    final Map<String, String> $headers = {
      'requires-token': requiresToken,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<ProfileRes, ProfileRes>($request);
  }
}

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$MedService extends MedService {
  _$MedService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = MedService;

  @override
  Future<Response<List<ServiceResResult>>> getServiceTypes(
    int? id,
    String? name,
    String? icon,
  ) {
    final Uri $url = Uri.parse('/api/service_types');
    final Map<String, dynamic> $params = <String, dynamic>{
      'id': id,
      'name': name,
      'icon': icon,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<List<ServiceResResult>, ServiceResResult>($request);
  }
}

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$BusinessService extends BusinessService {
  _$BusinessService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = BusinessService;

  @override
  Future<Response<LoginRes>> signIn({required SignInReq request}) {
    final Uri $url = Uri.parse('/business/login');
    final $body = request;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<LoginRes, LoginRes>($request);
  }
}
