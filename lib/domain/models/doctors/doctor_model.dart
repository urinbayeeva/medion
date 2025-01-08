import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';

part 'doctor_model.g.dart';


abstract class DoctorCategory implements Built<DoctorCategory, DoctorCategoryBuilder> {
  String get category_name;
  BuiltList<DoctorData> get doctor_data;

  DoctorCategory._();
  factory DoctorCategory([void Function(DoctorCategoryBuilder) updates]) = _$DoctorCategory;

  static Serializer<DoctorCategory> get serializer => _$doctorCategorySerializer;
}

abstract class DoctorData implements Built<DoctorData, DoctorDataBuilder> {
  int get id;
  String get name;
  bool? get info_description;
  bool? get Work_Mobile;
  bool? get Work_Phone;
  String? get gender;
  BuiltList<int> get category_ids;
  String get specialty;
  String? get image;
  String? get academic_rank;
  int get work_experience;

  DoctorData._();
  factory DoctorData([void Function(DoctorDataBuilder) updates]) = _$DoctorData;

  static Serializer<DoctorData> get serializer => _$doctorDataSerializer;
}