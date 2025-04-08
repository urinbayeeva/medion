import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';

part 'visit_model.g.dart';

abstract class VisitOrder implements Built<VisitOrder, VisitOrderBuilder> {
  @BuiltValueField(wireName: 'order')
  String get orderNumber;

  @BuiltValueField(wireName: 'order_check_pdf_url')
  String get orderCheckPdfUrl;

  @BuiltValueField(wireName: 'order_visits')
  BuiltList<OrderVisit> get visits;

  VisitOrder._();
  factory VisitOrder([void Function(VisitOrderBuilder) updates]) = _$VisitOrder;
  static Serializer<VisitOrder> get serializer => _$visitOrderSerializer;
}

abstract class OrderVisit implements Built<OrderVisit, OrderVisitBuilder> {
  @BuiltValueField(wireName: 'image')
  String get imageUrl;

  @BuiltValueField(wireName: 'doctor_full_name')
  String get doctorFullName;

  @BuiltValueField(wireName: 'doctor_job_name')
  String get doctorSpecialization;

  @BuiltValueField(wireName: 'category_name')
  String get categoryName;

  @BuiltValueField(wireName: 'service_name')
  String get serviceName;

  @BuiltValueField(wireName: 'visit_date')
  String get visitDate;

  @BuiltValueField(wireName: 'visit_time')
  String get visitTime;

  @BuiltValueField(wireName: 'visit_status')
  String get visitStatus;

  @BuiltValueField(wireName: 'week_index')
  int get weekIndex;

  @BuiltValueField(wireName: 'address')
  String get address;

  @BuiltValueField(wireName: 'payment_method')
  String get paymentMethod;

  @BuiltValueField(wireName: 'payment_status')
  String get paymentStatus;

  @BuiltValueField(wireName: 'longitude')
  double get longitude;

  @BuiltValueField(wireName: 'latitude')
  double get latitude;

  @BuiltValueField(wireName: 'company_name')
  String get companyName;

  OrderVisit._();
  factory OrderVisit([void Function(OrderVisitBuilder) updates]) = _$OrderVisit;
  static Serializer<OrderVisit> get serializer => _$orderVisitSerializer;
}

// If you still need the request models, you can keep them as is:
abstract class VisitRequest
    implements Built<VisitRequest, VisitRequestBuilder> {
  @BuiltValueField(wireName: 'service_id')
  int get serviceId;

  @BuiltValueField(wireName: 'company_id')
  int get companyId;

  @BuiltValueField(wireName: 'doctor_id')
  int get doctorId;

  @BuiltValueField(wireName: 'start_time')
  String get startTime;

  @BuiltValueField(wireName: 'end_time')
  String get endTime;

  @BuiltValueField(wireName: 'date')
  String get date;

  VisitRequest._();
  factory VisitRequest([void Function(VisitRequestBuilder) updates]) =
      _$VisitRequest;
  static Serializer<VisitRequest> get serializer => _$visitRequestSerializer;
}
