import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'service_model.g.dart';

abstract class ServiceResResult
    implements Built<ServiceResResult, ServiceResResultBuilder> {
  ServiceResResult._();

  factory ServiceResResult([updates(ServiceResResultBuilder b)]) =
      _$ServiceResResult;

  @BuiltValueField(wireName: 'title')
  String? get title;

    @BuiltValueField(wireName: 'info')
  String? get info;

    @BuiltValueField(wireName: 'forChildren')
  bool? get forChildren;

    @BuiltValueField(wireName: 'link')
  bool? get link;


    @BuiltValueField(wireName: 'color')
  String? get color;

 
  static Serializer<ServiceResResult> get serializer =>
      _$serviceResResultSerializer;
}
