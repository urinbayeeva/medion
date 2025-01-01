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
    final Uri $url = Uri.parse('/patient/phone-number');
    final $body = request;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<SuccessModel, SuccessModel>($request);
  }
}

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$BookingService extends BookingService {
  _$BookingService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = BookingService;

  @override
  Future<Response<BuiltList<BookingTypeModel>>> bookingTypes() {
    final Uri $url = Uri.parse('/booking/types');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<BuiltList<BookingTypeModel>, BookingTypeModel>($request);
  }
}

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$UploadImage extends UploadImage {
  _$UploadImage([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = UploadImage;

  @override
  Future<Response<ImageUploadResponseModel>> imageUpload(
    MultipartFile file, {
    String contentType = 'multipart/form-data',
    String requiresToken = 'true',
  }) {
    final Uri $url = Uri.parse('/upload/');
    final Map<String, String> $headers = {
      'Content-Type': contentType,
      'requires-token': requiresToken,
    };
    final List<PartValue> $parts = <PartValue>[
      PartValueFile<MultipartFile>(
        'file',
        file,
      )
    ];
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      parts: $parts,
      multipart: true,
      headers: $headers,
    );
    return client
        .send<ImageUploadResponseModel, ImageUploadResponseModel>($request);
  }
}
