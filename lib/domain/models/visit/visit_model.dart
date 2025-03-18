import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';

part 'visit_model.g.dart';

abstract class VisitResponse implements Built<VisitResponse, VisitResponseBuilder> {
  @BuiltValueField(wireName: 'services')
  BuiltList<VisitService> get services;

  @BuiltValueField(wireName: 'payme_url')
  String? get paymeUrl;

  @BuiltValueField(wireName: 'click_url')
  String? get clickUrl;

  @BuiltValueField(wireName: 'multicard_url')
  String? get multicardUrl;

  VisitResponse._();
  factory VisitResponse([void Function(VisitResponseBuilder) updates]) = _$VisitResponse;
  static Serializer<VisitResponse> get serializer => _$visitResponseSerializer;
}

abstract class VisitService implements Built<VisitService, VisitServiceBuilder> {
  @BuiltValueField(wireName: 'id')
  int get id;

  @BuiltValueField(wireName: 'doctor_id')
  String get doctorId;

  @BuiltValueField(wireName: 'image')
  String get image;

  @BuiltValueField(wireName: 'company_id')
  String get companyId;

  @BuiltValueField(wireName: 'main_service_id')
  String get mainServiceId;

  @BuiltValueField(wireName: 'product_type')
  String get productType;

  @BuiltValueField(wireName: 'doctor_first_visit_price_uzs')
  int get doctorFirstVisitPriceUzs;

  @BuiltValueField(wireName: 'doctor_first_visit_price_uzd')
  int get doctorFirstVisitPriceUzd;

  @BuiltValueField(wireName: 'doctor_revisit_price_uzs')
  int get doctorRevisitPriceUzs;

  @BuiltValueField(wireName: 'doctor_revisit_price_uzd')
  int get doctorRevisitPriceUzd;

  @BuiltValueField(wireName: 'date')
  String get date;

  @BuiltValueField(wireName: 'start_time')
  String get startTime;

  VisitService._();
  factory VisitService([void Function(VisitServiceBuilder) updates]) = _$VisitService;
  static Serializer<VisitService> get serializer => _$visitServiceSerializer;
}

abstract class VisitRequest implements Built<VisitRequest, VisitRequestBuilder> {
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
  factory VisitRequest([void Function(VisitRequestBuilder) updates]) = _$VisitRequest;
  static Serializer<VisitRequest> get serializer => _$visitRequestSerializer;
}
