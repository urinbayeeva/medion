import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:medion/domain/models/profile/profile_model.dart';
import 'package:medion/domain/serializers/serializer.dart';

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

abstract class VisitRequest implements Built<VisitRequest, VisitRequestBuilder> {
  @BuiltValueField(wireName: 'service_id')
  int get serviceId;

  @BuiltValueField(wireName: 'company_id')
  int get companyId;

  @BuiltValueField(wireName: 'doctor_id')
  int get doctorId;

  @BuiltValueField(wireName: 'order_detail_id')
  int? get orderDetailId;

  @BuiltValueField(wireName: 'start_time')
  String get startTime;

  @BuiltValueField(wireName: 'end_time')
  String get endTime;

  @BuiltValueField(wireName: 'date')
  String get date;

  @BuiltValueField(wireName: 'lang_code')
  String get langCode;

  VisitRequest._();

  factory VisitRequest([void Function(VisitRequestBuilder) updates]) = _$VisitRequest;

  static Serializer<VisitRequest> get serializer => _$visitRequestSerializer;

  String toJson() {
    return json.encode(serializers.serializeWith(VisitRequest.serializer, this));
  }
}

abstract class CreateVisitResponse implements Built<CreateVisitResponse, CreateVisitResponseBuilder> {
  @BuiltValueField(wireName: 'services')
  BuiltList<VisitResponseService> get services;

  @BuiltValueField(wireName: 'payment_urls')
  BuiltList<VisitResponseUrls> get paymentUrls;

  CreateVisitResponse._();

  factory CreateVisitResponse([void Function(CreateVisitResponseBuilder) updates]) = _$CreateVisitResponse;

  static Serializer<CreateVisitResponse> get serializer => _$createVisitResponseSerializer;
}

abstract class VisitResponseService implements Built<VisitResponseService, VisitResponseServiceBuilder> {
  @BuiltValueField(wireName: 'id')
  int get id;

  @BuiltValueField(wireName: 'doctor_id')
  String get doctorId;

  @BuiltValueField(wireName: 'image')
  String get image;

  @BuiltValueField(wireName: 'company_id')
  String get companyId;

  @BuiltValueField(wireName: 'main_service_id')
  String? get mainServiceId;

  @BuiltValueField(wireName: 'product_type')
  String? get productType;

  @BuiltValueField(wireName: 'doctor_first_visit_price_uzs')
  double? get doctorFirstVisitPriceUzs;

  @BuiltValueField(wireName: 'doctor_first_visit_price_uzd')
  double? get doctorFirstVisitPriceUzd;

  @BuiltValueField(wireName: 'doctor_revisit_price_uzs')
  double? get doctorRevisitPriceUzs;

  @BuiltValueField(wireName: 'doctor_revisit_price_uzd')
  double? get doctorRevisitPriceUzd;

  @BuiltValueField(wireName: 'date')
  String? get date;

  @BuiltValueField(wireName: 'start_time')
  String? get startTime;

  VisitResponseService._();

  factory VisitResponseService([void Function(VisitResponseServiceBuilder) updates]) = _$VisitResponseService;

  static Serializer<VisitResponseService> get serializer => _$visitResponseServiceSerializer;
}

abstract class VisitResponseUrls implements Built<VisitResponseUrls, VisitResponseUrlsBuilder> {
  @BuiltValueField(wireName: 'type')
  String get type;

  @BuiltValueField(wireName: 'url')
  String get url;

  VisitResponseUrls._();

  factory VisitResponseUrls([void Function(VisitResponseUrlsBuilder) updates]) = _$VisitResponseUrls;

  static Serializer<VisitResponseUrls> get serializer => _$visitResponseUrlsSerializer;
}

abstract class PatientAnalyse implements Built<PatientAnalyse, PatientAnalyseBuilder> {
  @BuiltValueField(wireName: 'moves')
  BuiltList<PatientOrder>? get orders;

  @BuiltValueField(wireName: 'visits')
  BuiltList<PatientVisit>? get visits;

  PatientAnalyse._();

  factory PatientAnalyse([void Function(PatientAnalyseBuilder) updates]) = _$PatientAnalyse;

  static Serializer<PatientAnalyse> get serializer => _$patientAnalyseSerializer;
}

abstract class CancelVisitBody implements Built<CancelVisitBody, CancelVisitBodyBuilder> {
  @BuiltValueField(wireName: 'visit_id')
  int get visitId;

  CancelVisitBody._();

  factory CancelVisitBody([void Function(CancelVisitBodyBuilder) updates]) = _$CancelVisitBody;

  static Serializer<CancelVisitBody> get serializer => _$cancelVisitBodySerializer;
}

abstract class CancelVisitResult implements Built<CancelVisitResult, CancelVisitResultBuilder> {
  @BuiltValueField(wireName: 'status')
  String? get status;

  @BuiltValueField(wireName: 'message')
  String? get message;

  @BuiltValueField(wireName: 'visit_id')
  int? get visitId;

  CancelVisitResult._();

  factory CancelVisitResult([void Function(CancelVisitResultBuilder) updates]) = _$CancelVisitResult;

  static Serializer<CancelVisitResult> get serializer => _$cancelVisitResultSerializer;
}

abstract class PatientOrder implements Built<PatientOrder, PatientOrderBuilder> {
  @BuiltValueField(wireName: 'sale_order_name')
  String? get saleOrderName;

  @BuiltValueField(wireName: 'sale_order_check_pdf_url')
  String? get saleOrderCheckPdfUrl;

  @BuiltValueField(wireName: 'sale_order_payment_status')
  String? get saleOrderPaymentStatus;

  @BuiltValueField(wireName: 'sale_order_lines')
  BuiltList<SaleOrderLine> get saleOrderLines;

  @BuiltValueField(wireName: 'sale_order_payment_urls')
  BuiltList<PaymentUrlModels>? get saleOrderPaymentUrls;

  @BuiltValueField(wireName: 'sale_order_price')
  double? get saleOrderPrice;

  PatientOrder._();

  factory PatientOrder([void Function(PatientOrderBuilder) updates]) = _$PatientOrder;

  static Serializer<PatientOrder> get serializer => _$patientOrderSerializer;
}

abstract class PaymentUrlModels implements Built<PaymentUrlModels, PaymentUrlModelsBuilder> {
  @BuiltValueField(wireName: 'payme_url')
  String? get payUrl;

  @BuiltValueField(wireName: 'click_url')
  String? get clickUrl;

  @BuiltValueField(wireName: 'multicard_url')
  String? get mCardUrl;

  PaymentUrlModels._();

  factory PaymentUrlModels([void Function(PaymentUrlModelsBuilder) updates]) = _$PaymentUrlModels;

  static Serializer<PaymentUrlModels> get serializer => _$paymentUrlModelsSerializer;
}

abstract class PatientVisit implements Built<PatientVisit, PatientVisitBuilder> {
  @BuiltValueField(wireName: 'id')
  int? get id;

  @BuiltValueField(wireName: 'image')
  String? get image;

  @BuiltValueField(wireName: 'doctor_full_name')
  String? get doctorFullName;

  @BuiltValueField(wireName: 'doctor_job_name')
  String? get doctorJobName;

  @BuiltValueField(wireName: 'company_name')
  String? get companyName;

  @BuiltValueField(wireName: 'service_name')
  String? get serviceName;

  @BuiltValueField(wireName: 'service_type')
  String? get serviceType;

  @BuiltValueField(wireName: 'category_name')
  String? get categoryName;

  @BuiltValueField(wireName: 'visit_date')
  String? get visitDate;

  @BuiltValueField(wireName: 'visit_time')
  String? get visitTime;

  @BuiltValueField(wireName: 'visit_status')
  String? get visitStatus;

  @BuiltValueField(wireName: 'payment_status')
  String? get paymentStatus;

  @BuiltValueField(wireName: 'address')
  String? get address;

  @BuiltValueField(wireName: 'payment_method')
  String? get paymentMethod;

  @BuiltValueField(wireName: 'sale_order_lines')
  BuiltList<PatientAnalysis> get saleOrderLines;

  @BuiltValueField(wireName: 'sale_order_payment_urls')
  BuiltList<PatientAnalysis> get saleOrderPaymentUrls;

  @BuiltValueField(wireName: 'week_index')
  int? get weekIndex;

  @BuiltValueField(wireName: 'price')
  double? get price;

  @BuiltValueField(wireName: 'longitude')
  double? get longitude;

  @BuiltValueField(wireName: 'latitude')
  double? get latitude;

  PatientVisit._();

  factory PatientVisit([void Function(PatientVisitBuilder) updates]) = _$PatientVisit;

  static Serializer<PatientVisit> get serializer => _$patientVisitSerializer;
}

abstract class SaleOrderLine implements Built<SaleOrderLine, SaleOrderLineBuilder> {
  @BuiltValueField(wireName: 'service')
  String? get service;

  @BuiltValueField(wireName: 'service_type')
  String? get serviceType;

  @BuiltValueField(wireName: 'create_date')
  String? get createDate;

  @BuiltValueField(wireName: 'patient_status')
  String? get patientStatus;

  @BuiltValueField(wireName: 'payment_status')
  String? get paymentStatus;

  @BuiltValueField(wireName: 'doctor_full_name')
  String? get doctorFullName;

  @BuiltValueField(wireName: 'is_done')
  bool? get isDone;

  SaleOrderLine._();

  factory SaleOrderLine([void Function(SaleOrderLineBuilder) updates]) = _$SaleOrderLine;

  static Serializer<SaleOrderLine> get serializer => _$saleOrderLineSerializer;
}

abstract class PatientVisitModel implements Built<PatientVisitModel, PatientVisitModelBuilder> {
  @BuiltValueField(wireName: 'service_id')
  String? get serviceId;

  @BuiltValueField(wireName: 'doctor_full_name')
  String? get doctorFullName;

  @BuiltValueField(wireName: 'doctor_job_name')
  String? get doctorJobName;

  @BuiltValueField(wireName: 'service_name')
  String? get serviceName;

  @BuiltValueField(wireName: 'visit_date')
  String? get visitDate;

  @BuiltValueField(wireName: 'visit_time')
  String? get visitTime;

  @BuiltValueField(wireName: 'visit_status')
  String? get visitStatus;

  @BuiltValueField(wireName: 'payment_status')
  String? get paymentStatus;

  PatientVisitModel._();

  factory PatientVisitModel([void Function(PatientVisitModelBuilder) updates]) = _$PatientVisitModel;

  static Serializer<PatientVisitModel> get serializer => _$patientVisitModelSerializer;
}

abstract class VisitSingleResultModel implements Built<VisitSingleResultModel, VisitSingleResultModelBuilder> {
  @BuiltValueField(wireName: 'title')
  String? get title;

  @BuiltValueField(wireName: 'url')
  String? get url;

  @BuiltValueField(wireName: 'date')
  String? get date;

  VisitSingleResultModel._();

  factory VisitSingleResultModel([void Function(VisitSingleResultModelBuilder) updates]) = _$VisitSingleResultModel;

  static Serializer<VisitSingleResultModel> get serializer => _$visitSingleResultModelSerializer;
}

abstract class PatientVisitSingleModel implements Built<PatientVisitSingleModel, PatientVisitSingleModelBuilder> {
  @BuiltValueField(wireName: 'id')
  int? get id;

  @BuiltValueField(wireName: 'image')
  String? get image;

  @BuiltValueField(wireName: 'doctor_full_name')
  String? get doctorFullName;

  @BuiltValueField(wireName: 'doctor_job_name')
  String? get doctorJobName;

  @BuiltValueField(wireName: 'category_name')
  String? get categoryName;

  @BuiltValueField(wireName: 'service_type')
  String? get serviceType;

  @BuiltValueField(wireName: 'service_name')
  String? get serviceName;

  @BuiltValueField(wireName: 'visit_date')
  String? get visitDate;

  @BuiltValueField(wireName: 'visit_time')
  String? get visitTime;

  @BuiltValueField(wireName: 'visit_status')
  String? get visitStatus;

  @BuiltValueField(wireName: 'week_index')
  int? get weekIndex;

  @BuiltValueField(wireName: 'address')
  String? get address;

  @BuiltValueField(wireName: 'payment_method')
  String? get paymentMethod;

  @BuiltValueField(wireName: 'payment_status')
  String? get paymentStatus;

  @BuiltValueField(wireName: 'longitude')
  double? get longitude;

  @BuiltValueField(wireName: 'latitude')
  double? get latitude;

  @BuiltValueField(wireName: 'company_name')
  String? get companyName;

  @BuiltValueField(wireName: 'price')
  double? get price;

  @BuiltValueField(wireName: 'employer_pays')
  String? get employerPays;

  @BuiltValueField(wireName: 'sale_order_lines')
  BuiltList<PatientAnalysis>? get saleOrderLines;

  @BuiltValueField(wireName: 'results')
  BuiltList<PatientAnalysis>? get results;

  @BuiltValueField(wireName: 'review')
  PatientReviewModel? get review;

  PatientVisitSingleModel._();

  factory PatientVisitSingleModel([void Function(PatientVisitSingleModelBuilder) updates]) = _$PatientVisitSingleModel;

  static Serializer<PatientVisitSingleModel> get serializer => _$patientVisitSingleModelSerializer;
}

abstract class PatientReviewModel implements Built<PatientReviewModel, PatientReviewModelBuilder> {
  @BuiltValueField(wireName: 'name')
  String? get name;

  @BuiltValueField(wireName: 'status')
  String? get status;

  @BuiltValueField(wireName: 'create_date')
  String? get createDate;

  @BuiltValueField(wireName: 'location')
  String? get location;

  @BuiltValueField(wireName: 'review')
  String? get review;

  @BuiltValueField(wireName: 'patient_name')
  String? get patientName;

  @BuiltValueField(wireName: 'ratings')
  String? get ratings;

  @BuiltValueField(wireName: 'id')
  int? get id;

  PatientReviewModel._();

  factory PatientReviewModel([void Function(PatientReviewModelBuilder) updates]) = _$PatientReviewModel;

  static Serializer<PatientReviewModel> get serializer => _$patientReviewModelSerializer;
}
