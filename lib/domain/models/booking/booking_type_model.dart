import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:medion/domain/serializers/serializer.dart';

part 'booking_type_model.g.dart';

abstract class BookingTypeModel
    implements Built<BookingTypeModel, BookingTypeModelBuilder> {
  int get id;
  String get name;
  String? get icon;

  BookingTypeModel._();
  factory BookingTypeModel([void Function(BookingTypeModelBuilder) updates]) =
      _$BookingTypeModel;

  static Serializer<BookingTypeModel> get serializer =>
      _$bookingTypeModelSerializer;
}

abstract class CategorySeviceModelID
    implements Built<CategorySeviceModelID, CategorySeviceModelIDBuilder> {
  @BuiltValueField(wireName: "id")
  int get id;
  @BuiltValueField(wireName: "name")
  String get name;
  @BuiltValueField(wireName: "description")
  String? get description;
  @BuiltValueField(wireName: "doctor_price_start_uzs")
  int get doctorPriceStartUzs;
  @BuiltValueField(wireName: "doctor_price_start_usd")
  double get doctorPriceStartUsd;
  @BuiltValueField(wireName: "age")
  String get age;

  CategorySeviceModelID._();
  factory CategorySeviceModelID(
          [void Function(CategorySeviceModelIDBuilder) updates]) =
      _$CategorySeviceModelID;

  static Serializer<CategorySeviceModelID> get serializer =>
      _$categorySeviceModelIDSerializer;
}
