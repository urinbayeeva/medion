import 'package:built_value/built_value.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:medion/utils/helpers/decode_html.dart';

part 'medical_services.g.dart';

abstract class DiagnosticsModel
    implements Built<DiagnosticsModel, DiagnosticsModelBuilder> {
  @BuiltValueField(wireName: 'title')
  String get title;

  @BuiltValueField(wireName: 'info')
  String get info;

  @BuiltValueField(wireName: 'for_children')
  bool get forChildren;

  @BuiltValueField(wireName: 'link')
  JsonObject get link;

  @BuiltValueField(wireName: 'background_color')
  JsonObject get backgroundColor;

  @BuiltValueField(wireName: 'image')
  String get image;

  @BuiltValueField(wireName: "category_id")
  int? get categoryId;

  DiagnosticsModel._();

  factory DiagnosticsModel([void Function(DiagnosticsModelBuilder) updates]) =
      _$DiagnosticsModel;

  static Serializer<DiagnosticsModel> get serializer =>
      _$diagnosticsModelSerializer;
}

abstract class DiseaseModle
    implements Built<DiseaseModle, DiseaseModleBuilder> {
  DiseaseModle._();

  factory DiseaseModle([void Function(DiseaseModleBuilder) updates]) =
      _$DiseaseModle;

  @BuiltValueField(wireName: 'name')
  String? get title;

  @BuiltValueField(wireName: 'icon')
  String? get icon;

  @BuiltValueField(wireName: 'for_children')
  bool? get forChildren;

  @BuiltValueField(wireName: 'link')
  bool? get link;

  @BuiltValueField(wireName: "category_id")
  int? get categoryId;

  static Serializer<DiseaseModle> get serializer => _$diseaseModleSerializer;
}

abstract class AdModel implements Built<AdModel, AdModelBuilder> {
  AdModel._();

  factory AdModel([void Function(AdModelBuilder) updates]) = _$AdModel;

  @BuiltValueField(wireName: 'title')
  String? get title;

  @BuiltValueField(wireName: 'info')
  String? get info;

  @BuiltValueField(wireName: 'image')
  String? get image;

  @BuiltValueField(wireName: 'important')
  bool? get important;

  @BuiltValueField(wireName: 'link')
  JsonObject? get link;

  @BuiltValueField(wireName: "image_for_mobile_uz")
  String? get imageForMobileUz;

  @BuiltValueField(wireName: "image_for_mobile_en")
  String? get imageForMobileEn;

  @BuiltValueField(wireName: "image_for_mobile_ru")
  String? get imageForMobileRu;

  static Serializer<AdModel> get serializer => _$adModelSerializer;
}
