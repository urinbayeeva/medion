import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

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
