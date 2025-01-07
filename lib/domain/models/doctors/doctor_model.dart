import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';

part 'doctor_model.g.dart';

abstract class Doctor implements Built<Doctor, DoctorBuilder> {
  Doctor._();
  factory Doctor([void Function(DoctorBuilder) updates]) = _$Doctor;

  @BuiltValueField(wireName: 'id')
  int get id;

  @BuiltValueField(wireName: 'name')
  String get name;

  @BuiltValueField(wireName: 'info_description')
  bool? get infoDdescription;

  @BuiltValueField(wireName: 'Work_Mobile')
  bool? get workMobile;

    @BuiltValueField(wireName: 'Work_Phone')
  bool? get workHome;

    @BuiltValueField(wireName: 'gender')
  bool? get gender;

  @BuiltValueField(wireName: 'category_ids')
  BuiltList<String> get categoryIds;

    @BuiltValueField(wireName: 'specialty')
  String get specialty;

    @BuiltValueField(wireName: 'image')
  String? get image;

    @BuiltValueField(wireName: 'academic_rank')
  String get academicRank;

    @BuiltValueField(wireName: 'work_experience')
  int get workExperience;

  static Serializer<Doctor> get serializer => _$doctorSerializer;
}

abstract class DoctorCategory
    implements Built<DoctorCategory, DoctorCategoryBuilder> {
  DoctorCategory._();
  factory DoctorCategory([void Function(DoctorCategoryBuilder) updates]) =
      _$DoctorCategory;

  String get category_name;
  BuiltList<Doctor> get doctor_data;

  static Serializer<DoctorCategory> get serializer =>
      _$doctorCategorySerializer;
}
