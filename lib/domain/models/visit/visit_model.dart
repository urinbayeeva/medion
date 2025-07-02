import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:medion/domain/models/profile/profile_model.dart';

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

abstract class PatientAnalyse implements Built<PatientAnalyse, PatientAnalyseBuilder> {
  @BuiltValueField(wireName: 'moves')
  BuiltList<PatientOrder>? get orders;

  @BuiltValueField(wireName: 'visits')
  BuiltList<PatientVisit>? get visits;

  PatientAnalyse._();

  factory PatientAnalyse([void Function(PatientAnalyseBuilder) updates]) = _$PatientAnalyse;

  static Serializer<PatientAnalyse> get serializer => _$patientAnalyseSerializer;
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

  @BuiltValueField(wireName: 'create_date')
  String? get createDate;

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
  @BuiltValueField(wireName: 'state')
  String? get state;

  @BuiltValueField(wireName: 'create_date')
  Object? get createDate;

  @BuiltValueField(wireName: 'location')
  String? get location;

  @BuiltValueField(wireName: 'review')
  String? get review;

  @BuiltValueField(wireName: 'patient_name')
  String? get patientName;

  @BuiltValueField(wireName: 'id')
  int? get id;

  PatientReviewModel._();

  factory PatientReviewModel([void Function(PatientReviewModelBuilder) updates]) = _$PatientReviewModel;

  static Serializer<PatientReviewModel> get serializer => _$patientReviewModelSerializer;
}
