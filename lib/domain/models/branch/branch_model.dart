import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'branch_model.g.dart';

abstract class BranchModel implements Built<BranchModel, BranchModelBuilder> {
  BranchModel._();
  
  factory BranchModel([void Function(BranchModelBuilder) updates]) = _$BranchModel;

  @BuiltValueField(wireName: 'id')
  int get id;

  @BuiltValueField(wireName: 'image')
  String? get image;

  @BuiltValueField(wireName: 'name')
  String? get name;

  @BuiltValueField(wireName: 'address')
  String? get address;

  @BuiltValueField(wireName: 'phone')
  String? get phone;

  @BuiltValueField(wireName: 'latitude')
  double get latitude;

  @BuiltValueField(wireName: 'longitude')
  double get longitude;

  @BuiltValueField(wireName: 'work_time')
  String get workTime;

  @BuiltValueField(wireName: 'work_days')
  String? get workDays;

  @BuiltValueField(wireName: 'description')
  String? get description;

  static Serializer<BranchModel> get serializer => _$branchModelSerializer;
}