import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'success_model.g.dart';

abstract class SuccessModel
    implements Built<SuccessModel, SuccessModelBuilder> {
  SuccessModel._();

  factory SuccessModel([Function(SuccessModelBuilder b) updates]) =
      _$SuccessModel;

  @BuiltValueField(wireName: 'status')
  String? get status;

    @BuiltValueField(wireName: 'message')
  String? get message;

  static Serializer<SuccessModel> get serializer => _$successModelSerializer;
}
