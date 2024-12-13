import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'service_model.g.dart';

abstract class ServiceResResult
    implements Built<ServiceResResult, ServiceResResultBuilder> {
  ServiceResResult._();

  factory ServiceResResult([updates(ServiceResResultBuilder b)]) =
      _$ServiceResResult;

  @BuiltValueField(wireName: 'id')
  int? get id;

  @BuiltValueField(wireName: 'name')
  String? get name;

  @BuiltValueField(wireName: 'icon')
  String? get icon;

  static Serializer<ServiceResResult> get serializer =>
      _$serviceResResultSerializer;
}
