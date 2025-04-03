import 'package:built_value/built_value.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';

part 'map_model.g.dart';

abstract class LocationModel
    implements Built<LocationModel, LocationModelBuilder> {
  @BuiltValueField(wireName: 'position')
  Position get position;

  @BuiltValueField(wireName: 'icon')
  String get icon;

  @BuiltValueField(wireName: 'full_name')
  JsonObject? get fullName;

  @BuiltValueField(wireName: 'address')
  String get address;

  @BuiltValueField(wireName: 'status')
  String get status;

  @BuiltValueField(wireName: 'closingTime')
  String get closingTime;

  @BuiltValueField(wireName: 'images')
  BuiltList<String> get images;

  @BuiltValueField(wireName: 'workHours')
  String get workHours;

  @BuiltValueField(wireName: 'wordDay')
  String get wordDay;

  LocationModel._();
  factory LocationModel([void Function(LocationModelBuilder) updates]) =
      _$LocationModel;
  static Serializer<LocationModel> get serializer => _$locationModelSerializer;
}

abstract class Position implements Built<Position, PositionBuilder> {
  @BuiltValueField(wireName: 'latitude')
  double get latitude;

  @BuiltValueField(wireName: 'longitude')
  double get longitude;

  Position._();
  factory Position([void Function(PositionBuilder) updates]) = _$Position;
  static Serializer<Position> get serializer => _$positionSerializer;
}
