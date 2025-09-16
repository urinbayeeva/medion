import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'response_model.g.dart';

abstract class ResponseModel implements Built<ResponseModel, ResponseModelBuilder> {
  ResponseModel._();

  factory ResponseModel([Function(ResponseModelBuilder b) updates]) = _$ResponseModel;

  @BuiltValueField(wireName: 'status')
  String get status;

  @BuiltValueField(wireName: 'message')
  String get message;

  @BuiltValueField(wireName: 'is_new_patient')
  bool get isNewPatient;

  @BuiltValueField(wireName: 'access_token')
  String? get accessToken;

  @BuiltValueField(wireName: 'refresh_token')
  String? get refreshToken;

  @BuiltValueField(wireName: 'token_type')
  String? get tokenType;

  static Serializer<ResponseModel> get serializer => _$responseModelSerializer;
}

abstract class ServiceResponse implements Built<ServiceResponse, ServiceResponseBuilder> {
  @BuiltValueField(wireName: 'status')
  String get status;

  @BuiltValueField(wireName: 'message')
  String get message;

  ServiceResponse._();

  factory ServiceResponse([void Function(ServiceResponseBuilder) updates]) = _$ServiceResponse;
}
