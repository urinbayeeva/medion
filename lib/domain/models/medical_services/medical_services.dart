import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:medion/domain/serializers/serializer.dart';

part 'medical_services.g.dart';

abstract class MedicalServices
    implements Built<MedicalServices, MedicalServicesBuilder> {
  MedicalServices._();

  factory MedicalServices([void Function(MedicalServicesBuilder) updates]) =
      _$MedicalServices;

  @BuiltValueField(wireName: 'title')
  String? get title;

  @BuiltValueField(wireName: 'info')
  String? get info;

  @BuiltValueField(wireName: 'for_children')
  bool? get forChildren;

  @BuiltValueField(wireName: 'link')
  bool? get link; // Typo: `bool?` emas, bu ehtimol `String?` bo‘lishi kerak.

  @BuiltValueField(wireName: 'background_color')
  String? get backgroundColor;

  @BuiltValueField(wireName: 'image')
  String? get image;

  static Serializer<MedicalServices> get serializer =>
      _$medicalServicesSerializer;
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

  static Serializer<DiseaseModle> get serializer => _$diseaseModleSerializer;
}



abstract class AdModel
    implements Built<AdModel, AdModelBuilder> {
  AdModel._();

  factory AdModel([void Function(AdModelBuilder) updates]) =
      _$AdModel;

  @BuiltValueField(wireName: 'title')
  String? get title;

  @BuiltValueField(wireName: 'info')
  String? get info;

  @BuiltValueField(wireName: 'image')
  String? get image;

  @BuiltValueField(wireName: 'important')
  bool? get important;

    @BuiltValueField(wireName: 'link')
  bool? get link;

  static Serializer<AdModel> get serializer => _$adModelSerializer;
}
