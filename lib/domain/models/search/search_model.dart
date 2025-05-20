import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';

part 'search_model.g.dart';

abstract class SearchReqModel
    implements Built<SearchReqModel, SearchReqModelBuilder> {
  @BuiltValueField(wireName: "text")
  String? get text;

  SearchReqModel._();
  factory SearchReqModel([void Function(SearchReqModelBuilder) updates]) =
      _$SearchReqModel;

  static Serializer<SearchReqModel> get serializer =>
      _$searchReqModelSerializer;
}

abstract class DoctorSearchText
    implements Built<DoctorSearchText, DoctorSearchTextBuilder> {
  @BuiltValueField(wireName: 'id')
  int? get id;

  @BuiltValueField(wireName: 'name')
  String? get name;

  @BuiltValueField(wireName: 'job')
  String? get job;

  @BuiltValueField(wireName: 'image')
  String? get image;

  DoctorSearchText._();
  factory DoctorSearchText([void Function(DoctorSearchTextBuilder) updates]) =
      _$DoctorSearchText;
  static Serializer<DoctorSearchText> get serializer =>
      _$doctorSearchTextSerializer;
}

abstract class CategorySearchText
    implements Built<CategorySearchText, CategorySearchTextBuilder> {
  @BuiltValueField(wireName: 'id')
  int? get id;

  @BuiltValueField(wireName: 'name')
  String? get name;

  @BuiltValueField(wireName: 'icon')
  String? get icon;

  @BuiltValueField(wireName: 'description')
  String? get description;

  CategorySearchText._();
  factory CategorySearchText(
          [void Function(CategorySearchTextBuilder) updates]) =
      _$CategorySearchText;
  static Serializer<CategorySearchText> get serializer =>
      _$categorySearchTextSerializer;
}

abstract class MedionResponseSearchText
    implements
        Built<MedionResponseSearchText, MedionResponseSearchTextBuilder> {
  @BuiltValueField(wireName: 'doctors')
  BuiltList<DoctorSearchText> get doctors;

  @BuiltValueField(wireName: 'categories')
  BuiltList<CategorySearchText> get categories;

  @BuiltValueField(wireName: 'news')
  BuiltList<dynamic> get news;

  @BuiltValueField(wireName: 'articles')
  BuiltList<dynamic> get articles;

  MedionResponseSearchText._();
  factory MedionResponseSearchText(
          [void Function(MedionResponseSearchTextBuilder) updates]) =
      _$MedionResponseSearchText;
  static Serializer<MedionResponseSearchText> get serializer =>
      _$medionResponseSearchTextSerializer;
}
