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

abstract class Service implements Built<Service, ServiceBuilder> {
  Service._();

  factory Service([Function(ServiceBuilder b) updates]) = _$Service;

  @BuiltValueField(wireName: 'id')
  int get id;

  @BuiltValueField(wireName: 'name')
  String get name;

  @BuiltValueField(wireName: 'description')
  String? get description;

  @BuiltValueField(wireName: 'doctor_price_start_uzs')
  double get priceUzs;

  @BuiltValueField(wireName: 'doctor_price_start_usd')
  double get priceUsd;

  @BuiltValueField(wireName: 'age')
  String get age;

  String toJson() {
    return json.encode(serializers.serializeWith(Service.serializer, this));
  }

  static Service? fromJson(String jsonString) {
    return serializers.deserializeWith(
        Service.serializer, json.decode(jsonString));
  }

  static Serializer<Service> get serializer => _$serviceSerializer;
}

abstract class Category implements Built<Category, CategoryBuilder> {
  Category._();

  factory Category([Function(CategoryBuilder b) updates]) = _$Category;

  @BuiltValueField(wireName: 'category_name')
  String get name;

  @BuiltValueField(wireName: 'services')
  BuiltList<Service> get services;

  String toJson() {
    return json.encode(serializers.serializeWith(Category.serializer, this));
  }

  static Category? fromJson(String jsonString) {
    return serializers.deserializeWith(
        Category.serializer, json.decode(jsonString));
  }

  static Serializer<Category> get serializer => _$categorySerializer;
}