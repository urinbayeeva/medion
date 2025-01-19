import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';

part 'response_model.g.dart';

abstract class ResponseModel
    implements Built<ResponseModel, ResponseModelBuilder> {
  ResponseModel._();

  factory ResponseModel([Function(ResponseModelBuilder b) updates]) =
      _$ResponseModel;

  @BuiltValueField(wireName: 'status')
  String get status;

  @BuiltValueField(wireName: 'message')
  String get message;

  @BuiltValueField(wireName: 'is_new_patient')
  bool get isNewPatient;

  @BuiltValueField(wireName: 'access_token')
  BuiltList<String>? get accessToken;

  @BuiltValueField(wireName: 'refresh_token')
  BuiltList<String>? get refreshToken;

  @BuiltValueField(wireName: 'token_type')
  String? get tokenType;

  static Serializer<ResponseModel> get serializer => _$responseModelSerializer;
}
