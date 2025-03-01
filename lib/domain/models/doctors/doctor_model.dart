import 'package:built_value/built_value.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';

part 'doctor_model.g.dart';

abstract class DoctorCategory
    implements Built<DoctorCategory, DoctorCategoryBuilder> {
  @BuiltValueField(wireName: "category_name")
  String get categoryName;

  @BuiltValueField(wireName: "doctor_data")
  BuiltList<DoctorData> get doctorData;

  DoctorCategory._();
  factory DoctorCategory([void Function(DoctorCategoryBuilder) updates]) =
      _$DoctorCategory;

  static Serializer<DoctorCategory> get serializer =>
      _$doctorCategorySerializer;
}

abstract class DoctorData implements Built<DoctorData, DoctorDataBuilder> {
  @BuiltValueField(wireName: "id")
  int get id;

  @BuiltValueField(wireName: "name")
  String get name;

  @BuiltValueField(wireName: "info_description")
  JsonObject? get infoDescription;

  @BuiltValueField(wireName: "Work_Mobile")
  JsonObject? get workMobbile;

  @BuiltValueField(wireName: "Work_Phone")
  JsonObject? get workPhone;

  @BuiltValueField(wireName: "gender")
  JsonObject? get gender;

  @BuiltValueField(wireName: "category_ids")
  BuiltList<int> get categoryIds;

  @BuiltValueField(wireName: "specialty")
  JsonObject?  get specialty;

  @BuiltValueField(wireName: "image")
  JsonObject?  get image;

  @BuiltValueField(wireName: "academic_rank")
  JsonObject?  get academicRank;

  @BuiltValueField(wireName: "work_experience")
  JsonObject?  get workExperience;

  DoctorData._();
  factory DoctorData([void Function(DoctorDataBuilder) updates]) = _$DoctorData;

  static Serializer<DoctorData> get serializer => _$doctorDataSerializer;
}
