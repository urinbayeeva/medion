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
  int get id;
  String get name;
  String? get description;
  double get doctorPriceStartUzs;
  double get doctorPriceStartUsd;
  String get age;

  Service._();
  factory Service([void Function(ServiceBuilder) updates]) = _$Service;

  static Service fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Service.serializer, json)!;
  }

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Service.serializer, this) as Map<String, dynamic>;
  }

  static Serializer<Service> get serializer => _$serviceSerializer;
}

abstract class CategoryServiceIDModel implements Built<CategoryServiceIDModel, CategoryServiceIDModelBuilder> {
  String get category;
  BuiltList<Service> get services;

  CategoryServiceIDModel._();
  factory CategoryServiceIDModel([void Function(CategoryServiceIDModelBuilder) updates]) = _$CategoryServiceIDModel;

  static CategoryServiceIDModel fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(CategoryServiceIDModel.serializer, json)!;
  }

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(CategoryServiceIDModel.serializer, this) as Map<String, dynamic>;
  }

  static Serializer<CategoryServiceIDModel> get serializer => _$categoryServiceIDModelSerializer;
}

