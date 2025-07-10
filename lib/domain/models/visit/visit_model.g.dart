// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visit_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<VisitOrder> _$visitOrderSerializer = new _$VisitOrderSerializer();
Serializer<OrderVisit> _$orderVisitSerializer = new _$OrderVisitSerializer();
Serializer<VisitRequest> _$visitRequestSerializer =
    new _$VisitRequestSerializer();
Serializer<PatientAnalyse> _$patientAnalyseSerializer =
    new _$PatientAnalyseSerializer();
Serializer<PatientOrder> _$patientOrderSerializer =
    new _$PatientOrderSerializer();
Serializer<PaymentUrlModels> _$paymentUrlModelsSerializer =
    new _$PaymentUrlModelsSerializer();
Serializer<PatientVisit> _$patientVisitSerializer =
    new _$PatientVisitSerializer();
Serializer<SaleOrderLine> _$saleOrderLineSerializer =
    new _$SaleOrderLineSerializer();
Serializer<PatientVisitModel> _$patientVisitModelSerializer =
    new _$PatientVisitModelSerializer();
Serializer<VisitSingleResultModel> _$visitSingleResultModelSerializer =
    new _$VisitSingleResultModelSerializer();
Serializer<PatientVisitSingleModel> _$patientVisitSingleModelSerializer =
    new _$PatientVisitSingleModelSerializer();
Serializer<PatientReviewModel> _$patientReviewModelSerializer =
    new _$PatientReviewModelSerializer();

class _$VisitOrderSerializer implements StructuredSerializer<VisitOrder> {
  @override
  final Iterable<Type> types = const [VisitOrder, _$VisitOrder];
  @override
  final String wireName = 'VisitOrder';

  @override
  Iterable<Object?> serialize(Serializers serializers, VisitOrder object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'order',
      serializers.serialize(object.orderNumber,
          specifiedType: const FullType(String)),
      'order_check_pdf_url',
      serializers.serialize(object.orderCheckPdfUrl,
          specifiedType: const FullType(String)),
      'order_visits',
      serializers.serialize(object.visits,
          specifiedType:
              const FullType(BuiltList, const [const FullType(OrderVisit)])),
    ];

    return result;
  }

  @override
  VisitOrder deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new VisitOrderBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'order':
          result.orderNumber = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'order_check_pdf_url':
          result.orderCheckPdfUrl = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'order_visits':
          result.visits.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(OrderVisit)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$OrderVisitSerializer implements StructuredSerializer<OrderVisit> {
  @override
  final Iterable<Type> types = const [OrderVisit, _$OrderVisit];
  @override
  final String wireName = 'OrderVisit';

  @override
  Iterable<Object?> serialize(Serializers serializers, OrderVisit object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'image',
      serializers.serialize(object.imageUrl,
          specifiedType: const FullType(String)),
      'doctor_full_name',
      serializers.serialize(object.doctorFullName,
          specifiedType: const FullType(String)),
      'doctor_job_name',
      serializers.serialize(object.doctorSpecialization,
          specifiedType: const FullType(String)),
      'category_name',
      serializers.serialize(object.categoryName,
          specifiedType: const FullType(String)),
      'service_name',
      serializers.serialize(object.serviceName,
          specifiedType: const FullType(String)),
      'visit_date',
      serializers.serialize(object.visitDate,
          specifiedType: const FullType(String)),
      'visit_time',
      serializers.serialize(object.visitTime,
          specifiedType: const FullType(String)),
      'visit_status',
      serializers.serialize(object.visitStatus,
          specifiedType: const FullType(String)),
      'week_index',
      serializers.serialize(object.weekIndex,
          specifiedType: const FullType(int)),
      'address',
      serializers.serialize(object.address,
          specifiedType: const FullType(String)),
      'payment_method',
      serializers.serialize(object.paymentMethod,
          specifiedType: const FullType(String)),
      'payment_status',
      serializers.serialize(object.paymentStatus,
          specifiedType: const FullType(String)),
      'longitude',
      serializers.serialize(object.longitude,
          specifiedType: const FullType(double)),
      'latitude',
      serializers.serialize(object.latitude,
          specifiedType: const FullType(double)),
      'company_name',
      serializers.serialize(object.companyName,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  OrderVisit deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OrderVisitBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'image':
          result.imageUrl = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'doctor_full_name':
          result.doctorFullName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'doctor_job_name':
          result.doctorSpecialization = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'category_name':
          result.categoryName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'service_name':
          result.serviceName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'visit_date':
          result.visitDate = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'visit_time':
          result.visitTime = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'visit_status':
          result.visitStatus = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'week_index':
          result.weekIndex = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'payment_method':
          result.paymentMethod = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'payment_status':
          result.paymentStatus = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'longitude':
          result.longitude = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'latitude':
          result.latitude = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'company_name':
          result.companyName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$VisitRequestSerializer implements StructuredSerializer<VisitRequest> {
  @override
  final Iterable<Type> types = const [VisitRequest, _$VisitRequest];
  @override
  final String wireName = 'VisitRequest';

  @override
  Iterable<Object?> serialize(Serializers serializers, VisitRequest object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'service_id',
      serializers.serialize(object.serviceId,
          specifiedType: const FullType(int)),
      'company_id',
      serializers.serialize(object.companyId,
          specifiedType: const FullType(int)),
      'doctor_id',
      serializers.serialize(object.doctorId,
          specifiedType: const FullType(int)),
      'start_time',
      serializers.serialize(object.startTime,
          specifiedType: const FullType(String)),
      'end_time',
      serializers.serialize(object.endTime,
          specifiedType: const FullType(String)),
      'date',
      serializers.serialize(object.date, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  VisitRequest deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new VisitRequestBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'service_id':
          result.serviceId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'company_id':
          result.companyId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'doctor_id':
          result.doctorId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'start_time':
          result.startTime = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'end_time':
          result.endTime = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$PatientAnalyseSerializer
    implements StructuredSerializer<PatientAnalyse> {
  @override
  final Iterable<Type> types = const [PatientAnalyse, _$PatientAnalyse];
  @override
  final String wireName = 'PatientAnalyse';

  @override
  Iterable<Object?> serialize(Serializers serializers, PatientAnalyse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.orders;
    if (value != null) {
      result
        ..add('moves')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(PatientOrder)])));
    }
    value = object.visits;
    if (value != null) {
      result
        ..add('visits')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(PatientVisit)])));
    }
    return result;
  }

  @override
  PatientAnalyse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PatientAnalyseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'moves':
          result.orders.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(PatientOrder)]))!
              as BuiltList<Object?>);
          break;
        case 'visits':
          result.visits.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(PatientVisit)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$PatientOrderSerializer implements StructuredSerializer<PatientOrder> {
  @override
  final Iterable<Type> types = const [PatientOrder, _$PatientOrder];
  @override
  final String wireName = 'PatientOrder';

  @override
  Iterable<Object?> serialize(Serializers serializers, PatientOrder object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'sale_order_lines',
      serializers.serialize(object.saleOrderLines,
          specifiedType:
              const FullType(BuiltList, const [const FullType(SaleOrderLine)])),
    ];
    Object? value;
    value = object.saleOrderName;
    if (value != null) {
      result
        ..add('sale_order_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.saleOrderCheckPdfUrl;
    if (value != null) {
      result
        ..add('sale_order_check_pdf_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.saleOrderPaymentStatus;
    if (value != null) {
      result
        ..add('sale_order_payment_status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.saleOrderPaymentUrls;
    if (value != null) {
      result
        ..add('sale_order_payment_urls')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(PaymentUrlModels)])));
    }
    value = object.saleOrderPrice;
    if (value != null) {
      result
        ..add('sale_order_price')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  PatientOrder deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PatientOrderBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'sale_order_name':
          result.saleOrderName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'sale_order_check_pdf_url':
          result.saleOrderCheckPdfUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'sale_order_payment_status':
          result.saleOrderPaymentStatus = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'sale_order_lines':
          result.saleOrderLines.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(SaleOrderLine)]))!
              as BuiltList<Object?>);
          break;
        case 'sale_order_payment_urls':
          result.saleOrderPaymentUrls.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(PaymentUrlModels)]))!
              as BuiltList<Object?>);
          break;
        case 'sale_order_price':
          result.saleOrderPrice = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
      }
    }

    return result.build();
  }
}

class _$PaymentUrlModelsSerializer
    implements StructuredSerializer<PaymentUrlModels> {
  @override
  final Iterable<Type> types = const [PaymentUrlModels, _$PaymentUrlModels];
  @override
  final String wireName = 'PaymentUrlModels';

  @override
  Iterable<Object?> serialize(Serializers serializers, PaymentUrlModels object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.payUrl;
    if (value != null) {
      result
        ..add('payme_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.clickUrl;
    if (value != null) {
      result
        ..add('click_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.mCardUrl;
    if (value != null) {
      result
        ..add('multicard_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  PaymentUrlModels deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PaymentUrlModelsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'payme_url':
          result.payUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'click_url':
          result.clickUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'multicard_url':
          result.mCardUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$PatientVisitSerializer implements StructuredSerializer<PatientVisit> {
  @override
  final Iterable<Type> types = const [PatientVisit, _$PatientVisit];
  @override
  final String wireName = 'PatientVisit';

  @override
  Iterable<Object?> serialize(Serializers serializers, PatientVisit object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'sale_order_lines',
      serializers.serialize(object.saleOrderLines,
          specifiedType: const FullType(
              BuiltList, const [const FullType(PatientAnalysis)])),
      'sale_order_payment_urls',
      serializers.serialize(object.saleOrderPaymentUrls,
          specifiedType: const FullType(
              BuiltList, const [const FullType(PatientAnalysis)])),
    ];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.doctorFullName;
    if (value != null) {
      result
        ..add('doctor_full_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.doctorJobName;
    if (value != null) {
      result
        ..add('doctor_job_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.companyName;
    if (value != null) {
      result
        ..add('company_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.serviceName;
    if (value != null) {
      result
        ..add('service_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.serviceType;
    if (value != null) {
      result
        ..add('service_type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.categoryName;
    if (value != null) {
      result
        ..add('category_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.visitDate;
    if (value != null) {
      result
        ..add('visit_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.visitTime;
    if (value != null) {
      result
        ..add('visit_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.visitStatus;
    if (value != null) {
      result
        ..add('visit_status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.paymentStatus;
    if (value != null) {
      result
        ..add('payment_status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.address;
    if (value != null) {
      result
        ..add('address')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.paymentMethod;
    if (value != null) {
      result
        ..add('payment_method')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.weekIndex;
    if (value != null) {
      result
        ..add('week_index')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.price;
    if (value != null) {
      result
        ..add('price')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.longitude;
    if (value != null) {
      result
        ..add('longitude')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.latitude;
    if (value != null) {
      result
        ..add('latitude')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  PatientVisit deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PatientVisitBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'doctor_full_name':
          result.doctorFullName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'doctor_job_name':
          result.doctorJobName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'company_name':
          result.companyName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'service_name':
          result.serviceName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'service_type':
          result.serviceType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'category_name':
          result.categoryName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'visit_date':
          result.visitDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'visit_time':
          result.visitTime = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'visit_status':
          result.visitStatus = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'payment_status':
          result.paymentStatus = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'payment_method':
          result.paymentMethod = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'sale_order_lines':
          result.saleOrderLines.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(PatientAnalysis)]))!
              as BuiltList<Object?>);
          break;
        case 'sale_order_payment_urls':
          result.saleOrderPaymentUrls.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(PatientAnalysis)]))!
              as BuiltList<Object?>);
          break;
        case 'week_index':
          result.weekIndex = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'longitude':
          result.longitude = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'latitude':
          result.latitude = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
      }
    }

    return result.build();
  }
}

class _$SaleOrderLineSerializer implements StructuredSerializer<SaleOrderLine> {
  @override
  final Iterable<Type> types = const [SaleOrderLine, _$SaleOrderLine];
  @override
  final String wireName = 'SaleOrderLine';

  @override
  Iterable<Object?> serialize(Serializers serializers, SaleOrderLine object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.service;
    if (value != null) {
      result
        ..add('service')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.serviceType;
    if (value != null) {
      result
        ..add('service_type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createDate;
    if (value != null) {
      result
        ..add('create_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.patientStatus;
    if (value != null) {
      result
        ..add('patient_status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.paymentStatus;
    if (value != null) {
      result
        ..add('payment_status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.doctorFullName;
    if (value != null) {
      result
        ..add('doctor_full_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isDone;
    if (value != null) {
      result
        ..add('is_done')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  SaleOrderLine deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SaleOrderLineBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'service':
          result.service = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'service_type':
          result.serviceType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'create_date':
          result.createDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'patient_status':
          result.patientStatus = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'payment_status':
          result.paymentStatus = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'doctor_full_name':
          result.doctorFullName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'is_done':
          result.isDone = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
      }
    }

    return result.build();
  }
}

class _$PatientVisitModelSerializer
    implements StructuredSerializer<PatientVisitModel> {
  @override
  final Iterable<Type> types = const [PatientVisitModel, _$PatientVisitModel];
  @override
  final String wireName = 'PatientVisitModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, PatientVisitModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.serviceId;
    if (value != null) {
      result
        ..add('service_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.doctorFullName;
    if (value != null) {
      result
        ..add('doctor_full_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.doctorJobName;
    if (value != null) {
      result
        ..add('doctor_job_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.serviceName;
    if (value != null) {
      result
        ..add('service_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.visitDate;
    if (value != null) {
      result
        ..add('visit_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.visitTime;
    if (value != null) {
      result
        ..add('visit_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.visitStatus;
    if (value != null) {
      result
        ..add('visit_status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.paymentStatus;
    if (value != null) {
      result
        ..add('payment_status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  PatientVisitModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PatientVisitModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'service_id':
          result.serviceId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'doctor_full_name':
          result.doctorFullName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'doctor_job_name':
          result.doctorJobName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'service_name':
          result.serviceName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'visit_date':
          result.visitDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'visit_time':
          result.visitTime = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'visit_status':
          result.visitStatus = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'payment_status':
          result.paymentStatus = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$VisitSingleResultModelSerializer
    implements StructuredSerializer<VisitSingleResultModel> {
  @override
  final Iterable<Type> types = const [
    VisitSingleResultModel,
    _$VisitSingleResultModel
  ];
  @override
  final String wireName = 'VisitSingleResultModel';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, VisitSingleResultModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.url;
    if (value != null) {
      result
        ..add('url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.date;
    if (value != null) {
      result
        ..add('date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  VisitSingleResultModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new VisitSingleResultModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$PatientVisitSingleModelSerializer
    implements StructuredSerializer<PatientVisitSingleModel> {
  @override
  final Iterable<Type> types = const [
    PatientVisitSingleModel,
    _$PatientVisitSingleModel
  ];
  @override
  final String wireName = 'PatientVisitSingleModel';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, PatientVisitSingleModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.doctorFullName;
    if (value != null) {
      result
        ..add('doctor_full_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.doctorJobName;
    if (value != null) {
      result
        ..add('doctor_job_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.categoryName;
    if (value != null) {
      result
        ..add('category_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.serviceType;
    if (value != null) {
      result
        ..add('service_type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.serviceName;
    if (value != null) {
      result
        ..add('service_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.visitDate;
    if (value != null) {
      result
        ..add('visit_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.visitTime;
    if (value != null) {
      result
        ..add('visit_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.visitStatus;
    if (value != null) {
      result
        ..add('visit_status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.weekIndex;
    if (value != null) {
      result
        ..add('week_index')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.address;
    if (value != null) {
      result
        ..add('address')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.paymentMethod;
    if (value != null) {
      result
        ..add('payment_method')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.paymentStatus;
    if (value != null) {
      result
        ..add('payment_status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.longitude;
    if (value != null) {
      result
        ..add('longitude')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.latitude;
    if (value != null) {
      result
        ..add('latitude')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.companyName;
    if (value != null) {
      result
        ..add('company_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.price;
    if (value != null) {
      result
        ..add('price')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.employerPays;
    if (value != null) {
      result
        ..add('employer_pays')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.saleOrderLines;
    if (value != null) {
      result
        ..add('sale_order_lines')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(PatientAnalysis)])));
    }
    value = object.results;
    if (value != null) {
      result
        ..add('results')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(PatientAnalysis)])));
    }
    value = object.review;
    if (value != null) {
      result
        ..add('review')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(PatientReviewModel)));
    }
    return result;
  }

  @override
  PatientVisitSingleModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PatientVisitSingleModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'doctor_full_name':
          result.doctorFullName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'doctor_job_name':
          result.doctorJobName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'category_name':
          result.categoryName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'service_type':
          result.serviceType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'service_name':
          result.serviceName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'visit_date':
          result.visitDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'visit_time':
          result.visitTime = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'visit_status':
          result.visitStatus = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'week_index':
          result.weekIndex = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'payment_method':
          result.paymentMethod = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'payment_status':
          result.paymentStatus = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'longitude':
          result.longitude = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'latitude':
          result.latitude = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'company_name':
          result.companyName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'employer_pays':
          result.employerPays = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'sale_order_lines':
          result.saleOrderLines.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(PatientAnalysis)]))!
              as BuiltList<Object?>);
          break;
        case 'results':
          result.results.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(PatientAnalysis)]))!
              as BuiltList<Object?>);
          break;
        case 'review':
          result.review.replace(serializers.deserialize(value,
                  specifiedType: const FullType(PatientReviewModel))!
              as PatientReviewModel);
          break;
      }
    }

    return result.build();
  }
}

class _$PatientReviewModelSerializer
    implements StructuredSerializer<PatientReviewModel> {
  @override
  final Iterable<Type> types = const [PatientReviewModel, _$PatientReviewModel];
  @override
  final String wireName = 'PatientReviewModel';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, PatientReviewModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.state;
    if (value != null) {
      result
        ..add('state')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createDate;
    if (value != null) {
      result
        ..add('create_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(Object)));
    }
    value = object.location;
    if (value != null) {
      result
        ..add('location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.review;
    if (value != null) {
      result
        ..add('review')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.patientName;
    if (value != null) {
      result
        ..add('patient_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  PatientReviewModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PatientReviewModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'state':
          result.state = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'create_date':
          result.createDate = serializers.deserialize(value,
              specifiedType: const FullType(Object));
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'review':
          result.review = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'patient_name':
          result.patientName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$VisitOrder extends VisitOrder {
  @override
  final String orderNumber;
  @override
  final String orderCheckPdfUrl;
  @override
  final BuiltList<OrderVisit> visits;

  factory _$VisitOrder([void Function(VisitOrderBuilder)? updates]) =>
      (new VisitOrderBuilder()..update(updates))._build();

  _$VisitOrder._(
      {required this.orderNumber,
      required this.orderCheckPdfUrl,
      required this.visits})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        orderNumber, r'VisitOrder', 'orderNumber');
    BuiltValueNullFieldError.checkNotNull(
        orderCheckPdfUrl, r'VisitOrder', 'orderCheckPdfUrl');
    BuiltValueNullFieldError.checkNotNull(visits, r'VisitOrder', 'visits');
  }

  @override
  VisitOrder rebuild(void Function(VisitOrderBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VisitOrderBuilder toBuilder() => new VisitOrderBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VisitOrder &&
        orderNumber == other.orderNumber &&
        orderCheckPdfUrl == other.orderCheckPdfUrl &&
        visits == other.visits;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, orderNumber.hashCode);
    _$hash = $jc(_$hash, orderCheckPdfUrl.hashCode);
    _$hash = $jc(_$hash, visits.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'VisitOrder')
          ..add('orderNumber', orderNumber)
          ..add('orderCheckPdfUrl', orderCheckPdfUrl)
          ..add('visits', visits))
        .toString();
  }
}

class VisitOrderBuilder implements Builder<VisitOrder, VisitOrderBuilder> {
  _$VisitOrder? _$v;

  String? _orderNumber;
  String? get orderNumber => _$this._orderNumber;
  set orderNumber(String? orderNumber) => _$this._orderNumber = orderNumber;

  String? _orderCheckPdfUrl;
  String? get orderCheckPdfUrl => _$this._orderCheckPdfUrl;
  set orderCheckPdfUrl(String? orderCheckPdfUrl) =>
      _$this._orderCheckPdfUrl = orderCheckPdfUrl;

  ListBuilder<OrderVisit>? _visits;
  ListBuilder<OrderVisit> get visits =>
      _$this._visits ??= new ListBuilder<OrderVisit>();
  set visits(ListBuilder<OrderVisit>? visits) => _$this._visits = visits;

  VisitOrderBuilder();

  VisitOrderBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _orderNumber = $v.orderNumber;
      _orderCheckPdfUrl = $v.orderCheckPdfUrl;
      _visits = $v.visits.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VisitOrder other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$VisitOrder;
  }

  @override
  void update(void Function(VisitOrderBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  VisitOrder build() => _build();

  _$VisitOrder _build() {
    _$VisitOrder _$result;
    try {
      _$result = _$v ??
          new _$VisitOrder._(
            orderNumber: BuiltValueNullFieldError.checkNotNull(
                orderNumber, r'VisitOrder', 'orderNumber'),
            orderCheckPdfUrl: BuiltValueNullFieldError.checkNotNull(
                orderCheckPdfUrl, r'VisitOrder', 'orderCheckPdfUrl'),
            visits: visits.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'visits';
        visits.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'VisitOrder', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$OrderVisit extends OrderVisit {
  @override
  final String imageUrl;
  @override
  final String doctorFullName;
  @override
  final String doctorSpecialization;
  @override
  final String categoryName;
  @override
  final String serviceName;
  @override
  final String visitDate;
  @override
  final String visitTime;
  @override
  final String visitStatus;
  @override
  final int weekIndex;
  @override
  final String address;
  @override
  final String paymentMethod;
  @override
  final String paymentStatus;
  @override
  final double longitude;
  @override
  final double latitude;
  @override
  final String companyName;

  factory _$OrderVisit([void Function(OrderVisitBuilder)? updates]) =>
      (new OrderVisitBuilder()..update(updates))._build();

  _$OrderVisit._(
      {required this.imageUrl,
      required this.doctorFullName,
      required this.doctorSpecialization,
      required this.categoryName,
      required this.serviceName,
      required this.visitDate,
      required this.visitTime,
      required this.visitStatus,
      required this.weekIndex,
      required this.address,
      required this.paymentMethod,
      required this.paymentStatus,
      required this.longitude,
      required this.latitude,
      required this.companyName})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(imageUrl, r'OrderVisit', 'imageUrl');
    BuiltValueNullFieldError.checkNotNull(
        doctorFullName, r'OrderVisit', 'doctorFullName');
    BuiltValueNullFieldError.checkNotNull(
        doctorSpecialization, r'OrderVisit', 'doctorSpecialization');
    BuiltValueNullFieldError.checkNotNull(
        categoryName, r'OrderVisit', 'categoryName');
    BuiltValueNullFieldError.checkNotNull(
        serviceName, r'OrderVisit', 'serviceName');
    BuiltValueNullFieldError.checkNotNull(
        visitDate, r'OrderVisit', 'visitDate');
    BuiltValueNullFieldError.checkNotNull(
        visitTime, r'OrderVisit', 'visitTime');
    BuiltValueNullFieldError.checkNotNull(
        visitStatus, r'OrderVisit', 'visitStatus');
    BuiltValueNullFieldError.checkNotNull(
        weekIndex, r'OrderVisit', 'weekIndex');
    BuiltValueNullFieldError.checkNotNull(address, r'OrderVisit', 'address');
    BuiltValueNullFieldError.checkNotNull(
        paymentMethod, r'OrderVisit', 'paymentMethod');
    BuiltValueNullFieldError.checkNotNull(
        paymentStatus, r'OrderVisit', 'paymentStatus');
    BuiltValueNullFieldError.checkNotNull(
        longitude, r'OrderVisit', 'longitude');
    BuiltValueNullFieldError.checkNotNull(latitude, r'OrderVisit', 'latitude');
    BuiltValueNullFieldError.checkNotNull(
        companyName, r'OrderVisit', 'companyName');
  }

  @override
  OrderVisit rebuild(void Function(OrderVisitBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrderVisitBuilder toBuilder() => new OrderVisitBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OrderVisit &&
        imageUrl == other.imageUrl &&
        doctorFullName == other.doctorFullName &&
        doctorSpecialization == other.doctorSpecialization &&
        categoryName == other.categoryName &&
        serviceName == other.serviceName &&
        visitDate == other.visitDate &&
        visitTime == other.visitTime &&
        visitStatus == other.visitStatus &&
        weekIndex == other.weekIndex &&
        address == other.address &&
        paymentMethod == other.paymentMethod &&
        paymentStatus == other.paymentStatus &&
        longitude == other.longitude &&
        latitude == other.latitude &&
        companyName == other.companyName;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, imageUrl.hashCode);
    _$hash = $jc(_$hash, doctorFullName.hashCode);
    _$hash = $jc(_$hash, doctorSpecialization.hashCode);
    _$hash = $jc(_$hash, categoryName.hashCode);
    _$hash = $jc(_$hash, serviceName.hashCode);
    _$hash = $jc(_$hash, visitDate.hashCode);
    _$hash = $jc(_$hash, visitTime.hashCode);
    _$hash = $jc(_$hash, visitStatus.hashCode);
    _$hash = $jc(_$hash, weekIndex.hashCode);
    _$hash = $jc(_$hash, address.hashCode);
    _$hash = $jc(_$hash, paymentMethod.hashCode);
    _$hash = $jc(_$hash, paymentStatus.hashCode);
    _$hash = $jc(_$hash, longitude.hashCode);
    _$hash = $jc(_$hash, latitude.hashCode);
    _$hash = $jc(_$hash, companyName.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OrderVisit')
          ..add('imageUrl', imageUrl)
          ..add('doctorFullName', doctorFullName)
          ..add('doctorSpecialization', doctorSpecialization)
          ..add('categoryName', categoryName)
          ..add('serviceName', serviceName)
          ..add('visitDate', visitDate)
          ..add('visitTime', visitTime)
          ..add('visitStatus', visitStatus)
          ..add('weekIndex', weekIndex)
          ..add('address', address)
          ..add('paymentMethod', paymentMethod)
          ..add('paymentStatus', paymentStatus)
          ..add('longitude', longitude)
          ..add('latitude', latitude)
          ..add('companyName', companyName))
        .toString();
  }
}

class OrderVisitBuilder implements Builder<OrderVisit, OrderVisitBuilder> {
  _$OrderVisit? _$v;

  String? _imageUrl;
  String? get imageUrl => _$this._imageUrl;
  set imageUrl(String? imageUrl) => _$this._imageUrl = imageUrl;

  String? _doctorFullName;
  String? get doctorFullName => _$this._doctorFullName;
  set doctorFullName(String? doctorFullName) =>
      _$this._doctorFullName = doctorFullName;

  String? _doctorSpecialization;
  String? get doctorSpecialization => _$this._doctorSpecialization;
  set doctorSpecialization(String? doctorSpecialization) =>
      _$this._doctorSpecialization = doctorSpecialization;

  String? _categoryName;
  String? get categoryName => _$this._categoryName;
  set categoryName(String? categoryName) => _$this._categoryName = categoryName;

  String? _serviceName;
  String? get serviceName => _$this._serviceName;
  set serviceName(String? serviceName) => _$this._serviceName = serviceName;

  String? _visitDate;
  String? get visitDate => _$this._visitDate;
  set visitDate(String? visitDate) => _$this._visitDate = visitDate;

  String? _visitTime;
  String? get visitTime => _$this._visitTime;
  set visitTime(String? visitTime) => _$this._visitTime = visitTime;

  String? _visitStatus;
  String? get visitStatus => _$this._visitStatus;
  set visitStatus(String? visitStatus) => _$this._visitStatus = visitStatus;

  int? _weekIndex;
  int? get weekIndex => _$this._weekIndex;
  set weekIndex(int? weekIndex) => _$this._weekIndex = weekIndex;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  String? _paymentMethod;
  String? get paymentMethod => _$this._paymentMethod;
  set paymentMethod(String? paymentMethod) =>
      _$this._paymentMethod = paymentMethod;

  String? _paymentStatus;
  String? get paymentStatus => _$this._paymentStatus;
  set paymentStatus(String? paymentStatus) =>
      _$this._paymentStatus = paymentStatus;

  double? _longitude;
  double? get longitude => _$this._longitude;
  set longitude(double? longitude) => _$this._longitude = longitude;

  double? _latitude;
  double? get latitude => _$this._latitude;
  set latitude(double? latitude) => _$this._latitude = latitude;

  String? _companyName;
  String? get companyName => _$this._companyName;
  set companyName(String? companyName) => _$this._companyName = companyName;

  OrderVisitBuilder();

  OrderVisitBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _imageUrl = $v.imageUrl;
      _doctorFullName = $v.doctorFullName;
      _doctorSpecialization = $v.doctorSpecialization;
      _categoryName = $v.categoryName;
      _serviceName = $v.serviceName;
      _visitDate = $v.visitDate;
      _visitTime = $v.visitTime;
      _visitStatus = $v.visitStatus;
      _weekIndex = $v.weekIndex;
      _address = $v.address;
      _paymentMethod = $v.paymentMethod;
      _paymentStatus = $v.paymentStatus;
      _longitude = $v.longitude;
      _latitude = $v.latitude;
      _companyName = $v.companyName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OrderVisit other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OrderVisit;
  }

  @override
  void update(void Function(OrderVisitBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OrderVisit build() => _build();

  _$OrderVisit _build() {
    final _$result = _$v ??
        new _$OrderVisit._(
          imageUrl: BuiltValueNullFieldError.checkNotNull(
              imageUrl, r'OrderVisit', 'imageUrl'),
          doctorFullName: BuiltValueNullFieldError.checkNotNull(
              doctorFullName, r'OrderVisit', 'doctorFullName'),
          doctorSpecialization: BuiltValueNullFieldError.checkNotNull(
              doctorSpecialization, r'OrderVisit', 'doctorSpecialization'),
          categoryName: BuiltValueNullFieldError.checkNotNull(
              categoryName, r'OrderVisit', 'categoryName'),
          serviceName: BuiltValueNullFieldError.checkNotNull(
              serviceName, r'OrderVisit', 'serviceName'),
          visitDate: BuiltValueNullFieldError.checkNotNull(
              visitDate, r'OrderVisit', 'visitDate'),
          visitTime: BuiltValueNullFieldError.checkNotNull(
              visitTime, r'OrderVisit', 'visitTime'),
          visitStatus: BuiltValueNullFieldError.checkNotNull(
              visitStatus, r'OrderVisit', 'visitStatus'),
          weekIndex: BuiltValueNullFieldError.checkNotNull(
              weekIndex, r'OrderVisit', 'weekIndex'),
          address: BuiltValueNullFieldError.checkNotNull(
              address, r'OrderVisit', 'address'),
          paymentMethod: BuiltValueNullFieldError.checkNotNull(
              paymentMethod, r'OrderVisit', 'paymentMethod'),
          paymentStatus: BuiltValueNullFieldError.checkNotNull(
              paymentStatus, r'OrderVisit', 'paymentStatus'),
          longitude: BuiltValueNullFieldError.checkNotNull(
              longitude, r'OrderVisit', 'longitude'),
          latitude: BuiltValueNullFieldError.checkNotNull(
              latitude, r'OrderVisit', 'latitude'),
          companyName: BuiltValueNullFieldError.checkNotNull(
              companyName, r'OrderVisit', 'companyName'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$VisitRequest extends VisitRequest {
  @override
  final int serviceId;
  @override
  final int companyId;
  @override
  final int doctorId;
  @override
  final String startTime;
  @override
  final String endTime;
  @override
  final String date;

  factory _$VisitRequest([void Function(VisitRequestBuilder)? updates]) =>
      (new VisitRequestBuilder()..update(updates))._build();

  _$VisitRequest._(
      {required this.serviceId,
      required this.companyId,
      required this.doctorId,
      required this.startTime,
      required this.endTime,
      required this.date})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        serviceId, r'VisitRequest', 'serviceId');
    BuiltValueNullFieldError.checkNotNull(
        companyId, r'VisitRequest', 'companyId');
    BuiltValueNullFieldError.checkNotNull(
        doctorId, r'VisitRequest', 'doctorId');
    BuiltValueNullFieldError.checkNotNull(
        startTime, r'VisitRequest', 'startTime');
    BuiltValueNullFieldError.checkNotNull(endTime, r'VisitRequest', 'endTime');
    BuiltValueNullFieldError.checkNotNull(date, r'VisitRequest', 'date');
  }

  @override
  VisitRequest rebuild(void Function(VisitRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VisitRequestBuilder toBuilder() => new VisitRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VisitRequest &&
        serviceId == other.serviceId &&
        companyId == other.companyId &&
        doctorId == other.doctorId &&
        startTime == other.startTime &&
        endTime == other.endTime &&
        date == other.date;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, serviceId.hashCode);
    _$hash = $jc(_$hash, companyId.hashCode);
    _$hash = $jc(_$hash, doctorId.hashCode);
    _$hash = $jc(_$hash, startTime.hashCode);
    _$hash = $jc(_$hash, endTime.hashCode);
    _$hash = $jc(_$hash, date.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'VisitRequest')
          ..add('serviceId', serviceId)
          ..add('companyId', companyId)
          ..add('doctorId', doctorId)
          ..add('startTime', startTime)
          ..add('endTime', endTime)
          ..add('date', date))
        .toString();
  }
}

class VisitRequestBuilder
    implements Builder<VisitRequest, VisitRequestBuilder> {
  _$VisitRequest? _$v;

  int? _serviceId;
  int? get serviceId => _$this._serviceId;
  set serviceId(int? serviceId) => _$this._serviceId = serviceId;

  int? _companyId;
  int? get companyId => _$this._companyId;
  set companyId(int? companyId) => _$this._companyId = companyId;

  int? _doctorId;
  int? get doctorId => _$this._doctorId;
  set doctorId(int? doctorId) => _$this._doctorId = doctorId;

  String? _startTime;
  String? get startTime => _$this._startTime;
  set startTime(String? startTime) => _$this._startTime = startTime;

  String? _endTime;
  String? get endTime => _$this._endTime;
  set endTime(String? endTime) => _$this._endTime = endTime;

  String? _date;
  String? get date => _$this._date;
  set date(String? date) => _$this._date = date;

  VisitRequestBuilder();

  VisitRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _serviceId = $v.serviceId;
      _companyId = $v.companyId;
      _doctorId = $v.doctorId;
      _startTime = $v.startTime;
      _endTime = $v.endTime;
      _date = $v.date;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VisitRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$VisitRequest;
  }

  @override
  void update(void Function(VisitRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  VisitRequest build() => _build();

  _$VisitRequest _build() {
    final _$result = _$v ??
        new _$VisitRequest._(
          serviceId: BuiltValueNullFieldError.checkNotNull(
              serviceId, r'VisitRequest', 'serviceId'),
          companyId: BuiltValueNullFieldError.checkNotNull(
              companyId, r'VisitRequest', 'companyId'),
          doctorId: BuiltValueNullFieldError.checkNotNull(
              doctorId, r'VisitRequest', 'doctorId'),
          startTime: BuiltValueNullFieldError.checkNotNull(
              startTime, r'VisitRequest', 'startTime'),
          endTime: BuiltValueNullFieldError.checkNotNull(
              endTime, r'VisitRequest', 'endTime'),
          date: BuiltValueNullFieldError.checkNotNull(
              date, r'VisitRequest', 'date'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$PatientAnalyse extends PatientAnalyse {
  @override
  final BuiltList<PatientOrder>? orders;
  @override
  final BuiltList<PatientVisit>? visits;

  factory _$PatientAnalyse([void Function(PatientAnalyseBuilder)? updates]) =>
      (new PatientAnalyseBuilder()..update(updates))._build();

  _$PatientAnalyse._({this.orders, this.visits}) : super._();

  @override
  PatientAnalyse rebuild(void Function(PatientAnalyseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PatientAnalyseBuilder toBuilder() =>
      new PatientAnalyseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PatientAnalyse &&
        orders == other.orders &&
        visits == other.visits;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, orders.hashCode);
    _$hash = $jc(_$hash, visits.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PatientAnalyse')
          ..add('orders', orders)
          ..add('visits', visits))
        .toString();
  }
}

class PatientAnalyseBuilder
    implements Builder<PatientAnalyse, PatientAnalyseBuilder> {
  _$PatientAnalyse? _$v;

  ListBuilder<PatientOrder>? _orders;
  ListBuilder<PatientOrder> get orders =>
      _$this._orders ??= new ListBuilder<PatientOrder>();
  set orders(ListBuilder<PatientOrder>? orders) => _$this._orders = orders;

  ListBuilder<PatientVisit>? _visits;
  ListBuilder<PatientVisit> get visits =>
      _$this._visits ??= new ListBuilder<PatientVisit>();
  set visits(ListBuilder<PatientVisit>? visits) => _$this._visits = visits;

  PatientAnalyseBuilder();

  PatientAnalyseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _orders = $v.orders?.toBuilder();
      _visits = $v.visits?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PatientAnalyse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PatientAnalyse;
  }

  @override
  void update(void Function(PatientAnalyseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PatientAnalyse build() => _build();

  _$PatientAnalyse _build() {
    _$PatientAnalyse _$result;
    try {
      _$result = _$v ??
          new _$PatientAnalyse._(
            orders: _orders?.build(),
            visits: _visits?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'orders';
        _orders?.build();
        _$failedField = 'visits';
        _visits?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PatientAnalyse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$PatientOrder extends PatientOrder {
  @override
  final String? saleOrderName;
  @override
  final String? saleOrderCheckPdfUrl;
  @override
  final String? saleOrderPaymentStatus;
  @override
  final BuiltList<SaleOrderLine> saleOrderLines;
  @override
  final BuiltList<PaymentUrlModels>? saleOrderPaymentUrls;
  @override
  final double? saleOrderPrice;

  factory _$PatientOrder([void Function(PatientOrderBuilder)? updates]) =>
      (new PatientOrderBuilder()..update(updates))._build();

  _$PatientOrder._(
      {this.saleOrderName,
      this.saleOrderCheckPdfUrl,
      this.saleOrderPaymentStatus,
      required this.saleOrderLines,
      this.saleOrderPaymentUrls,
      this.saleOrderPrice})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        saleOrderLines, r'PatientOrder', 'saleOrderLines');
  }

  @override
  PatientOrder rebuild(void Function(PatientOrderBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PatientOrderBuilder toBuilder() => new PatientOrderBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PatientOrder &&
        saleOrderName == other.saleOrderName &&
        saleOrderCheckPdfUrl == other.saleOrderCheckPdfUrl &&
        saleOrderPaymentStatus == other.saleOrderPaymentStatus &&
        saleOrderLines == other.saleOrderLines &&
        saleOrderPaymentUrls == other.saleOrderPaymentUrls &&
        saleOrderPrice == other.saleOrderPrice;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, saleOrderName.hashCode);
    _$hash = $jc(_$hash, saleOrderCheckPdfUrl.hashCode);
    _$hash = $jc(_$hash, saleOrderPaymentStatus.hashCode);
    _$hash = $jc(_$hash, saleOrderLines.hashCode);
    _$hash = $jc(_$hash, saleOrderPaymentUrls.hashCode);
    _$hash = $jc(_$hash, saleOrderPrice.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PatientOrder')
          ..add('saleOrderName', saleOrderName)
          ..add('saleOrderCheckPdfUrl', saleOrderCheckPdfUrl)
          ..add('saleOrderPaymentStatus', saleOrderPaymentStatus)
          ..add('saleOrderLines', saleOrderLines)
          ..add('saleOrderPaymentUrls', saleOrderPaymentUrls)
          ..add('saleOrderPrice', saleOrderPrice))
        .toString();
  }
}

class PatientOrderBuilder
    implements Builder<PatientOrder, PatientOrderBuilder> {
  _$PatientOrder? _$v;

  String? _saleOrderName;
  String? get saleOrderName => _$this._saleOrderName;
  set saleOrderName(String? saleOrderName) =>
      _$this._saleOrderName = saleOrderName;

  String? _saleOrderCheckPdfUrl;
  String? get saleOrderCheckPdfUrl => _$this._saleOrderCheckPdfUrl;
  set saleOrderCheckPdfUrl(String? saleOrderCheckPdfUrl) =>
      _$this._saleOrderCheckPdfUrl = saleOrderCheckPdfUrl;

  String? _saleOrderPaymentStatus;
  String? get saleOrderPaymentStatus => _$this._saleOrderPaymentStatus;
  set saleOrderPaymentStatus(String? saleOrderPaymentStatus) =>
      _$this._saleOrderPaymentStatus = saleOrderPaymentStatus;

  ListBuilder<SaleOrderLine>? _saleOrderLines;
  ListBuilder<SaleOrderLine> get saleOrderLines =>
      _$this._saleOrderLines ??= new ListBuilder<SaleOrderLine>();
  set saleOrderLines(ListBuilder<SaleOrderLine>? saleOrderLines) =>
      _$this._saleOrderLines = saleOrderLines;

  ListBuilder<PaymentUrlModels>? _saleOrderPaymentUrls;
  ListBuilder<PaymentUrlModels> get saleOrderPaymentUrls =>
      _$this._saleOrderPaymentUrls ??= new ListBuilder<PaymentUrlModels>();
  set saleOrderPaymentUrls(
          ListBuilder<PaymentUrlModels>? saleOrderPaymentUrls) =>
      _$this._saleOrderPaymentUrls = saleOrderPaymentUrls;

  double? _saleOrderPrice;
  double? get saleOrderPrice => _$this._saleOrderPrice;
  set saleOrderPrice(double? saleOrderPrice) =>
      _$this._saleOrderPrice = saleOrderPrice;

  PatientOrderBuilder();

  PatientOrderBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _saleOrderName = $v.saleOrderName;
      _saleOrderCheckPdfUrl = $v.saleOrderCheckPdfUrl;
      _saleOrderPaymentStatus = $v.saleOrderPaymentStatus;
      _saleOrderLines = $v.saleOrderLines.toBuilder();
      _saleOrderPaymentUrls = $v.saleOrderPaymentUrls?.toBuilder();
      _saleOrderPrice = $v.saleOrderPrice;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PatientOrder other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PatientOrder;
  }

  @override
  void update(void Function(PatientOrderBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PatientOrder build() => _build();

  _$PatientOrder _build() {
    _$PatientOrder _$result;
    try {
      _$result = _$v ??
          new _$PatientOrder._(
            saleOrderName: saleOrderName,
            saleOrderCheckPdfUrl: saleOrderCheckPdfUrl,
            saleOrderPaymentStatus: saleOrderPaymentStatus,
            saleOrderLines: saleOrderLines.build(),
            saleOrderPaymentUrls: _saleOrderPaymentUrls?.build(),
            saleOrderPrice: saleOrderPrice,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'saleOrderLines';
        saleOrderLines.build();
        _$failedField = 'saleOrderPaymentUrls';
        _saleOrderPaymentUrls?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PatientOrder', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$PaymentUrlModels extends PaymentUrlModels {
  @override
  final String? payUrl;
  @override
  final String? clickUrl;
  @override
  final String? mCardUrl;

  factory _$PaymentUrlModels(
          [void Function(PaymentUrlModelsBuilder)? updates]) =>
      (new PaymentUrlModelsBuilder()..update(updates))._build();

  _$PaymentUrlModels._({this.payUrl, this.clickUrl, this.mCardUrl}) : super._();

  @override
  PaymentUrlModels rebuild(void Function(PaymentUrlModelsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PaymentUrlModelsBuilder toBuilder() =>
      new PaymentUrlModelsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaymentUrlModels &&
        payUrl == other.payUrl &&
        clickUrl == other.clickUrl &&
        mCardUrl == other.mCardUrl;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, payUrl.hashCode);
    _$hash = $jc(_$hash, clickUrl.hashCode);
    _$hash = $jc(_$hash, mCardUrl.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PaymentUrlModels')
          ..add('payUrl', payUrl)
          ..add('clickUrl', clickUrl)
          ..add('mCardUrl', mCardUrl))
        .toString();
  }
}

class PaymentUrlModelsBuilder
    implements Builder<PaymentUrlModels, PaymentUrlModelsBuilder> {
  _$PaymentUrlModels? _$v;

  String? _payUrl;
  String? get payUrl => _$this._payUrl;
  set payUrl(String? payUrl) => _$this._payUrl = payUrl;

  String? _clickUrl;
  String? get clickUrl => _$this._clickUrl;
  set clickUrl(String? clickUrl) => _$this._clickUrl = clickUrl;

  String? _mCardUrl;
  String? get mCardUrl => _$this._mCardUrl;
  set mCardUrl(String? mCardUrl) => _$this._mCardUrl = mCardUrl;

  PaymentUrlModelsBuilder();

  PaymentUrlModelsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _payUrl = $v.payUrl;
      _clickUrl = $v.clickUrl;
      _mCardUrl = $v.mCardUrl;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PaymentUrlModels other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PaymentUrlModels;
  }

  @override
  void update(void Function(PaymentUrlModelsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PaymentUrlModels build() => _build();

  _$PaymentUrlModels _build() {
    final _$result = _$v ??
        new _$PaymentUrlModels._(
          payUrl: payUrl,
          clickUrl: clickUrl,
          mCardUrl: mCardUrl,
        );
    replace(_$result);
    return _$result;
  }
}

class _$PatientVisit extends PatientVisit {
  @override
  final int? id;
  @override
  final String? image;
  @override
  final String? doctorFullName;
  @override
  final String? doctorJobName;
  @override
  final String? companyName;
  @override
  final String? serviceName;
  @override
  final String? serviceType;
  @override
  final String? categoryName;
  @override
  final String? visitDate;
  @override
  final String? visitTime;
  @override
  final String? visitStatus;
  @override
  final String? paymentStatus;
  @override
  final String? address;
  @override
  final String? paymentMethod;
  @override
  final BuiltList<PatientAnalysis> saleOrderLines;
  @override
  final BuiltList<PatientAnalysis> saleOrderPaymentUrls;
  @override
  final int? weekIndex;
  @override
  final double? price;
  @override
  final double? longitude;
  @override
  final double? latitude;

  factory _$PatientVisit([void Function(PatientVisitBuilder)? updates]) =>
      (new PatientVisitBuilder()..update(updates))._build();

  _$PatientVisit._(
      {this.id,
      this.image,
      this.doctorFullName,
      this.doctorJobName,
      this.companyName,
      this.serviceName,
      this.serviceType,
      this.categoryName,
      this.visitDate,
      this.visitTime,
      this.visitStatus,
      this.paymentStatus,
      this.address,
      this.paymentMethod,
      required this.saleOrderLines,
      required this.saleOrderPaymentUrls,
      this.weekIndex,
      this.price,
      this.longitude,
      this.latitude})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        saleOrderLines, r'PatientVisit', 'saleOrderLines');
    BuiltValueNullFieldError.checkNotNull(
        saleOrderPaymentUrls, r'PatientVisit', 'saleOrderPaymentUrls');
  }

  @override
  PatientVisit rebuild(void Function(PatientVisitBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PatientVisitBuilder toBuilder() => new PatientVisitBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PatientVisit &&
        id == other.id &&
        image == other.image &&
        doctorFullName == other.doctorFullName &&
        doctorJobName == other.doctorJobName &&
        companyName == other.companyName &&
        serviceName == other.serviceName &&
        serviceType == other.serviceType &&
        categoryName == other.categoryName &&
        visitDate == other.visitDate &&
        visitTime == other.visitTime &&
        visitStatus == other.visitStatus &&
        paymentStatus == other.paymentStatus &&
        address == other.address &&
        paymentMethod == other.paymentMethod &&
        saleOrderLines == other.saleOrderLines &&
        saleOrderPaymentUrls == other.saleOrderPaymentUrls &&
        weekIndex == other.weekIndex &&
        price == other.price &&
        longitude == other.longitude &&
        latitude == other.latitude;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jc(_$hash, doctorFullName.hashCode);
    _$hash = $jc(_$hash, doctorJobName.hashCode);
    _$hash = $jc(_$hash, companyName.hashCode);
    _$hash = $jc(_$hash, serviceName.hashCode);
    _$hash = $jc(_$hash, serviceType.hashCode);
    _$hash = $jc(_$hash, categoryName.hashCode);
    _$hash = $jc(_$hash, visitDate.hashCode);
    _$hash = $jc(_$hash, visitTime.hashCode);
    _$hash = $jc(_$hash, visitStatus.hashCode);
    _$hash = $jc(_$hash, paymentStatus.hashCode);
    _$hash = $jc(_$hash, address.hashCode);
    _$hash = $jc(_$hash, paymentMethod.hashCode);
    _$hash = $jc(_$hash, saleOrderLines.hashCode);
    _$hash = $jc(_$hash, saleOrderPaymentUrls.hashCode);
    _$hash = $jc(_$hash, weekIndex.hashCode);
    _$hash = $jc(_$hash, price.hashCode);
    _$hash = $jc(_$hash, longitude.hashCode);
    _$hash = $jc(_$hash, latitude.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PatientVisit')
          ..add('id', id)
          ..add('image', image)
          ..add('doctorFullName', doctorFullName)
          ..add('doctorJobName', doctorJobName)
          ..add('companyName', companyName)
          ..add('serviceName', serviceName)
          ..add('serviceType', serviceType)
          ..add('categoryName', categoryName)
          ..add('visitDate', visitDate)
          ..add('visitTime', visitTime)
          ..add('visitStatus', visitStatus)
          ..add('paymentStatus', paymentStatus)
          ..add('address', address)
          ..add('paymentMethod', paymentMethod)
          ..add('saleOrderLines', saleOrderLines)
          ..add('saleOrderPaymentUrls', saleOrderPaymentUrls)
          ..add('weekIndex', weekIndex)
          ..add('price', price)
          ..add('longitude', longitude)
          ..add('latitude', latitude))
        .toString();
  }
}

class PatientVisitBuilder
    implements Builder<PatientVisit, PatientVisitBuilder> {
  _$PatientVisit? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  String? _doctorFullName;
  String? get doctorFullName => _$this._doctorFullName;
  set doctorFullName(String? doctorFullName) =>
      _$this._doctorFullName = doctorFullName;

  String? _doctorJobName;
  String? get doctorJobName => _$this._doctorJobName;
  set doctorJobName(String? doctorJobName) =>
      _$this._doctorJobName = doctorJobName;

  String? _companyName;
  String? get companyName => _$this._companyName;
  set companyName(String? companyName) => _$this._companyName = companyName;

  String? _serviceName;
  String? get serviceName => _$this._serviceName;
  set serviceName(String? serviceName) => _$this._serviceName = serviceName;

  String? _serviceType;
  String? get serviceType => _$this._serviceType;
  set serviceType(String? serviceType) => _$this._serviceType = serviceType;

  String? _categoryName;
  String? get categoryName => _$this._categoryName;
  set categoryName(String? categoryName) => _$this._categoryName = categoryName;

  String? _visitDate;
  String? get visitDate => _$this._visitDate;
  set visitDate(String? visitDate) => _$this._visitDate = visitDate;

  String? _visitTime;
  String? get visitTime => _$this._visitTime;
  set visitTime(String? visitTime) => _$this._visitTime = visitTime;

  String? _visitStatus;
  String? get visitStatus => _$this._visitStatus;
  set visitStatus(String? visitStatus) => _$this._visitStatus = visitStatus;

  String? _paymentStatus;
  String? get paymentStatus => _$this._paymentStatus;
  set paymentStatus(String? paymentStatus) =>
      _$this._paymentStatus = paymentStatus;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  String? _paymentMethod;
  String? get paymentMethod => _$this._paymentMethod;
  set paymentMethod(String? paymentMethod) =>
      _$this._paymentMethod = paymentMethod;

  ListBuilder<PatientAnalysis>? _saleOrderLines;
  ListBuilder<PatientAnalysis> get saleOrderLines =>
      _$this._saleOrderLines ??= new ListBuilder<PatientAnalysis>();
  set saleOrderLines(ListBuilder<PatientAnalysis>? saleOrderLines) =>
      _$this._saleOrderLines = saleOrderLines;

  ListBuilder<PatientAnalysis>? _saleOrderPaymentUrls;
  ListBuilder<PatientAnalysis> get saleOrderPaymentUrls =>
      _$this._saleOrderPaymentUrls ??= new ListBuilder<PatientAnalysis>();
  set saleOrderPaymentUrls(
          ListBuilder<PatientAnalysis>? saleOrderPaymentUrls) =>
      _$this._saleOrderPaymentUrls = saleOrderPaymentUrls;

  int? _weekIndex;
  int? get weekIndex => _$this._weekIndex;
  set weekIndex(int? weekIndex) => _$this._weekIndex = weekIndex;

  double? _price;
  double? get price => _$this._price;
  set price(double? price) => _$this._price = price;

  double? _longitude;
  double? get longitude => _$this._longitude;
  set longitude(double? longitude) => _$this._longitude = longitude;

  double? _latitude;
  double? get latitude => _$this._latitude;
  set latitude(double? latitude) => _$this._latitude = latitude;

  PatientVisitBuilder();

  PatientVisitBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _image = $v.image;
      _doctorFullName = $v.doctorFullName;
      _doctorJobName = $v.doctorJobName;
      _companyName = $v.companyName;
      _serviceName = $v.serviceName;
      _serviceType = $v.serviceType;
      _categoryName = $v.categoryName;
      _visitDate = $v.visitDate;
      _visitTime = $v.visitTime;
      _visitStatus = $v.visitStatus;
      _paymentStatus = $v.paymentStatus;
      _address = $v.address;
      _paymentMethod = $v.paymentMethod;
      _saleOrderLines = $v.saleOrderLines.toBuilder();
      _saleOrderPaymentUrls = $v.saleOrderPaymentUrls.toBuilder();
      _weekIndex = $v.weekIndex;
      _price = $v.price;
      _longitude = $v.longitude;
      _latitude = $v.latitude;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PatientVisit other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PatientVisit;
  }

  @override
  void update(void Function(PatientVisitBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PatientVisit build() => _build();

  _$PatientVisit _build() {
    _$PatientVisit _$result;
    try {
      _$result = _$v ??
          new _$PatientVisit._(
            id: id,
            image: image,
            doctorFullName: doctorFullName,
            doctorJobName: doctorJobName,
            companyName: companyName,
            serviceName: serviceName,
            serviceType: serviceType,
            categoryName: categoryName,
            visitDate: visitDate,
            visitTime: visitTime,
            visitStatus: visitStatus,
            paymentStatus: paymentStatus,
            address: address,
            paymentMethod: paymentMethod,
            saleOrderLines: saleOrderLines.build(),
            saleOrderPaymentUrls: saleOrderPaymentUrls.build(),
            weekIndex: weekIndex,
            price: price,
            longitude: longitude,
            latitude: latitude,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'saleOrderLines';
        saleOrderLines.build();
        _$failedField = 'saleOrderPaymentUrls';
        saleOrderPaymentUrls.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PatientVisit', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$SaleOrderLine extends SaleOrderLine {
  @override
  final String? service;
  @override
  final String? serviceType;
  @override
  final String? createDate;
  @override
  final String? patientStatus;
  @override
  final String? paymentStatus;
  @override
  final String? doctorFullName;
  @override
  final bool? isDone;

  factory _$SaleOrderLine([void Function(SaleOrderLineBuilder)? updates]) =>
      (new SaleOrderLineBuilder()..update(updates))._build();

  _$SaleOrderLine._(
      {this.service,
      this.serviceType,
      this.createDate,
      this.patientStatus,
      this.paymentStatus,
      this.doctorFullName,
      this.isDone})
      : super._();

  @override
  SaleOrderLine rebuild(void Function(SaleOrderLineBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SaleOrderLineBuilder toBuilder() => new SaleOrderLineBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SaleOrderLine &&
        service == other.service &&
        serviceType == other.serviceType &&
        createDate == other.createDate &&
        patientStatus == other.patientStatus &&
        paymentStatus == other.paymentStatus &&
        doctorFullName == other.doctorFullName &&
        isDone == other.isDone;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, service.hashCode);
    _$hash = $jc(_$hash, serviceType.hashCode);
    _$hash = $jc(_$hash, createDate.hashCode);
    _$hash = $jc(_$hash, patientStatus.hashCode);
    _$hash = $jc(_$hash, paymentStatus.hashCode);
    _$hash = $jc(_$hash, doctorFullName.hashCode);
    _$hash = $jc(_$hash, isDone.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SaleOrderLine')
          ..add('service', service)
          ..add('serviceType', serviceType)
          ..add('createDate', createDate)
          ..add('patientStatus', patientStatus)
          ..add('paymentStatus', paymentStatus)
          ..add('doctorFullName', doctorFullName)
          ..add('isDone', isDone))
        .toString();
  }
}

class SaleOrderLineBuilder
    implements Builder<SaleOrderLine, SaleOrderLineBuilder> {
  _$SaleOrderLine? _$v;

  String? _service;
  String? get service => _$this._service;
  set service(String? service) => _$this._service = service;

  String? _serviceType;
  String? get serviceType => _$this._serviceType;
  set serviceType(String? serviceType) => _$this._serviceType = serviceType;

  String? _createDate;
  String? get createDate => _$this._createDate;
  set createDate(String? createDate) => _$this._createDate = createDate;

  String? _patientStatus;
  String? get patientStatus => _$this._patientStatus;
  set patientStatus(String? patientStatus) =>
      _$this._patientStatus = patientStatus;

  String? _paymentStatus;
  String? get paymentStatus => _$this._paymentStatus;
  set paymentStatus(String? paymentStatus) =>
      _$this._paymentStatus = paymentStatus;

  String? _doctorFullName;
  String? get doctorFullName => _$this._doctorFullName;
  set doctorFullName(String? doctorFullName) =>
      _$this._doctorFullName = doctorFullName;

  bool? _isDone;
  bool? get isDone => _$this._isDone;
  set isDone(bool? isDone) => _$this._isDone = isDone;

  SaleOrderLineBuilder();

  SaleOrderLineBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _service = $v.service;
      _serviceType = $v.serviceType;
      _createDate = $v.createDate;
      _patientStatus = $v.patientStatus;
      _paymentStatus = $v.paymentStatus;
      _doctorFullName = $v.doctorFullName;
      _isDone = $v.isDone;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SaleOrderLine other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SaleOrderLine;
  }

  @override
  void update(void Function(SaleOrderLineBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SaleOrderLine build() => _build();

  _$SaleOrderLine _build() {
    final _$result = _$v ??
        new _$SaleOrderLine._(
          service: service,
          serviceType: serviceType,
          createDate: createDate,
          patientStatus: patientStatus,
          paymentStatus: paymentStatus,
          doctorFullName: doctorFullName,
          isDone: isDone,
        );
    replace(_$result);
    return _$result;
  }
}

class _$PatientVisitModel extends PatientVisitModel {
  @override
  final String? serviceId;
  @override
  final String? doctorFullName;
  @override
  final String? doctorJobName;
  @override
  final String? serviceName;
  @override
  final String? visitDate;
  @override
  final String? visitTime;
  @override
  final String? visitStatus;
  @override
  final String? paymentStatus;

  factory _$PatientVisitModel(
          [void Function(PatientVisitModelBuilder)? updates]) =>
      (new PatientVisitModelBuilder()..update(updates))._build();

  _$PatientVisitModel._(
      {this.serviceId,
      this.doctorFullName,
      this.doctorJobName,
      this.serviceName,
      this.visitDate,
      this.visitTime,
      this.visitStatus,
      this.paymentStatus})
      : super._();

  @override
  PatientVisitModel rebuild(void Function(PatientVisitModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PatientVisitModelBuilder toBuilder() =>
      new PatientVisitModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PatientVisitModel &&
        serviceId == other.serviceId &&
        doctorFullName == other.doctorFullName &&
        doctorJobName == other.doctorJobName &&
        serviceName == other.serviceName &&
        visitDate == other.visitDate &&
        visitTime == other.visitTime &&
        visitStatus == other.visitStatus &&
        paymentStatus == other.paymentStatus;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, serviceId.hashCode);
    _$hash = $jc(_$hash, doctorFullName.hashCode);
    _$hash = $jc(_$hash, doctorJobName.hashCode);
    _$hash = $jc(_$hash, serviceName.hashCode);
    _$hash = $jc(_$hash, visitDate.hashCode);
    _$hash = $jc(_$hash, visitTime.hashCode);
    _$hash = $jc(_$hash, visitStatus.hashCode);
    _$hash = $jc(_$hash, paymentStatus.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PatientVisitModel')
          ..add('serviceId', serviceId)
          ..add('doctorFullName', doctorFullName)
          ..add('doctorJobName', doctorJobName)
          ..add('serviceName', serviceName)
          ..add('visitDate', visitDate)
          ..add('visitTime', visitTime)
          ..add('visitStatus', visitStatus)
          ..add('paymentStatus', paymentStatus))
        .toString();
  }
}

class PatientVisitModelBuilder
    implements Builder<PatientVisitModel, PatientVisitModelBuilder> {
  _$PatientVisitModel? _$v;

  String? _serviceId;
  String? get serviceId => _$this._serviceId;
  set serviceId(String? serviceId) => _$this._serviceId = serviceId;

  String? _doctorFullName;
  String? get doctorFullName => _$this._doctorFullName;
  set doctorFullName(String? doctorFullName) =>
      _$this._doctorFullName = doctorFullName;

  String? _doctorJobName;
  String? get doctorJobName => _$this._doctorJobName;
  set doctorJobName(String? doctorJobName) =>
      _$this._doctorJobName = doctorJobName;

  String? _serviceName;
  String? get serviceName => _$this._serviceName;
  set serviceName(String? serviceName) => _$this._serviceName = serviceName;

  String? _visitDate;
  String? get visitDate => _$this._visitDate;
  set visitDate(String? visitDate) => _$this._visitDate = visitDate;

  String? _visitTime;
  String? get visitTime => _$this._visitTime;
  set visitTime(String? visitTime) => _$this._visitTime = visitTime;

  String? _visitStatus;
  String? get visitStatus => _$this._visitStatus;
  set visitStatus(String? visitStatus) => _$this._visitStatus = visitStatus;

  String? _paymentStatus;
  String? get paymentStatus => _$this._paymentStatus;
  set paymentStatus(String? paymentStatus) =>
      _$this._paymentStatus = paymentStatus;

  PatientVisitModelBuilder();

  PatientVisitModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _serviceId = $v.serviceId;
      _doctorFullName = $v.doctorFullName;
      _doctorJobName = $v.doctorJobName;
      _serviceName = $v.serviceName;
      _visitDate = $v.visitDate;
      _visitTime = $v.visitTime;
      _visitStatus = $v.visitStatus;
      _paymentStatus = $v.paymentStatus;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PatientVisitModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PatientVisitModel;
  }

  @override
  void update(void Function(PatientVisitModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PatientVisitModel build() => _build();

  _$PatientVisitModel _build() {
    final _$result = _$v ??
        new _$PatientVisitModel._(
          serviceId: serviceId,
          doctorFullName: doctorFullName,
          doctorJobName: doctorJobName,
          serviceName: serviceName,
          visitDate: visitDate,
          visitTime: visitTime,
          visitStatus: visitStatus,
          paymentStatus: paymentStatus,
        );
    replace(_$result);
    return _$result;
  }
}

class _$VisitSingleResultModel extends VisitSingleResultModel {
  @override
  final String? title;
  @override
  final String? url;
  @override
  final String? date;

  factory _$VisitSingleResultModel(
          [void Function(VisitSingleResultModelBuilder)? updates]) =>
      (new VisitSingleResultModelBuilder()..update(updates))._build();

  _$VisitSingleResultModel._({this.title, this.url, this.date}) : super._();

  @override
  VisitSingleResultModel rebuild(
          void Function(VisitSingleResultModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VisitSingleResultModelBuilder toBuilder() =>
      new VisitSingleResultModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VisitSingleResultModel &&
        title == other.title &&
        url == other.url &&
        date == other.date;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, url.hashCode);
    _$hash = $jc(_$hash, date.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'VisitSingleResultModel')
          ..add('title', title)
          ..add('url', url)
          ..add('date', date))
        .toString();
  }
}

class VisitSingleResultModelBuilder
    implements Builder<VisitSingleResultModel, VisitSingleResultModelBuilder> {
  _$VisitSingleResultModel? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _url;
  String? get url => _$this._url;
  set url(String? url) => _$this._url = url;

  String? _date;
  String? get date => _$this._date;
  set date(String? date) => _$this._date = date;

  VisitSingleResultModelBuilder();

  VisitSingleResultModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _url = $v.url;
      _date = $v.date;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VisitSingleResultModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$VisitSingleResultModel;
  }

  @override
  void update(void Function(VisitSingleResultModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  VisitSingleResultModel build() => _build();

  _$VisitSingleResultModel _build() {
    final _$result = _$v ??
        new _$VisitSingleResultModel._(
          title: title,
          url: url,
          date: date,
        );
    replace(_$result);
    return _$result;
  }
}

class _$PatientVisitSingleModel extends PatientVisitSingleModel {
  @override
  final int? id;
  @override
  final String? image;
  @override
  final String? doctorFullName;
  @override
  final String? doctorJobName;
  @override
  final String? categoryName;
  @override
  final String? serviceType;
  @override
  final String? serviceName;
  @override
  final String? visitDate;
  @override
  final String? visitTime;
  @override
  final String? visitStatus;
  @override
  final int? weekIndex;
  @override
  final String? address;
  @override
  final String? paymentMethod;
  @override
  final String? paymentStatus;
  @override
  final double? longitude;
  @override
  final double? latitude;
  @override
  final String? companyName;
  @override
  final double? price;
  @override
  final String? employerPays;
  @override
  final BuiltList<PatientAnalysis>? saleOrderLines;
  @override
  final BuiltList<PatientAnalysis>? results;
  @override
  final PatientReviewModel? review;

  factory _$PatientVisitSingleModel(
          [void Function(PatientVisitSingleModelBuilder)? updates]) =>
      (new PatientVisitSingleModelBuilder()..update(updates))._build();

  _$PatientVisitSingleModel._(
      {this.id,
      this.image,
      this.doctorFullName,
      this.doctorJobName,
      this.categoryName,
      this.serviceType,
      this.serviceName,
      this.visitDate,
      this.visitTime,
      this.visitStatus,
      this.weekIndex,
      this.address,
      this.paymentMethod,
      this.paymentStatus,
      this.longitude,
      this.latitude,
      this.companyName,
      this.price,
      this.employerPays,
      this.saleOrderLines,
      this.results,
      this.review})
      : super._();

  @override
  PatientVisitSingleModel rebuild(
          void Function(PatientVisitSingleModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PatientVisitSingleModelBuilder toBuilder() =>
      new PatientVisitSingleModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PatientVisitSingleModel &&
        id == other.id &&
        image == other.image &&
        doctorFullName == other.doctorFullName &&
        doctorJobName == other.doctorJobName &&
        categoryName == other.categoryName &&
        serviceType == other.serviceType &&
        serviceName == other.serviceName &&
        visitDate == other.visitDate &&
        visitTime == other.visitTime &&
        visitStatus == other.visitStatus &&
        weekIndex == other.weekIndex &&
        address == other.address &&
        paymentMethod == other.paymentMethod &&
        paymentStatus == other.paymentStatus &&
        longitude == other.longitude &&
        latitude == other.latitude &&
        companyName == other.companyName &&
        price == other.price &&
        employerPays == other.employerPays &&
        saleOrderLines == other.saleOrderLines &&
        results == other.results &&
        review == other.review;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jc(_$hash, doctorFullName.hashCode);
    _$hash = $jc(_$hash, doctorJobName.hashCode);
    _$hash = $jc(_$hash, categoryName.hashCode);
    _$hash = $jc(_$hash, serviceType.hashCode);
    _$hash = $jc(_$hash, serviceName.hashCode);
    _$hash = $jc(_$hash, visitDate.hashCode);
    _$hash = $jc(_$hash, visitTime.hashCode);
    _$hash = $jc(_$hash, visitStatus.hashCode);
    _$hash = $jc(_$hash, weekIndex.hashCode);
    _$hash = $jc(_$hash, address.hashCode);
    _$hash = $jc(_$hash, paymentMethod.hashCode);
    _$hash = $jc(_$hash, paymentStatus.hashCode);
    _$hash = $jc(_$hash, longitude.hashCode);
    _$hash = $jc(_$hash, latitude.hashCode);
    _$hash = $jc(_$hash, companyName.hashCode);
    _$hash = $jc(_$hash, price.hashCode);
    _$hash = $jc(_$hash, employerPays.hashCode);
    _$hash = $jc(_$hash, saleOrderLines.hashCode);
    _$hash = $jc(_$hash, results.hashCode);
    _$hash = $jc(_$hash, review.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PatientVisitSingleModel')
          ..add('id', id)
          ..add('image', image)
          ..add('doctorFullName', doctorFullName)
          ..add('doctorJobName', doctorJobName)
          ..add('categoryName', categoryName)
          ..add('serviceType', serviceType)
          ..add('serviceName', serviceName)
          ..add('visitDate', visitDate)
          ..add('visitTime', visitTime)
          ..add('visitStatus', visitStatus)
          ..add('weekIndex', weekIndex)
          ..add('address', address)
          ..add('paymentMethod', paymentMethod)
          ..add('paymentStatus', paymentStatus)
          ..add('longitude', longitude)
          ..add('latitude', latitude)
          ..add('companyName', companyName)
          ..add('price', price)
          ..add('employerPays', employerPays)
          ..add('saleOrderLines', saleOrderLines)
          ..add('results', results)
          ..add('review', review))
        .toString();
  }
}

class PatientVisitSingleModelBuilder
    implements
        Builder<PatientVisitSingleModel, PatientVisitSingleModelBuilder> {
  _$PatientVisitSingleModel? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  String? _doctorFullName;
  String? get doctorFullName => _$this._doctorFullName;
  set doctorFullName(String? doctorFullName) =>
      _$this._doctorFullName = doctorFullName;

  String? _doctorJobName;
  String? get doctorJobName => _$this._doctorJobName;
  set doctorJobName(String? doctorJobName) =>
      _$this._doctorJobName = doctorJobName;

  String? _categoryName;
  String? get categoryName => _$this._categoryName;
  set categoryName(String? categoryName) => _$this._categoryName = categoryName;

  String? _serviceType;
  String? get serviceType => _$this._serviceType;
  set serviceType(String? serviceType) => _$this._serviceType = serviceType;

  String? _serviceName;
  String? get serviceName => _$this._serviceName;
  set serviceName(String? serviceName) => _$this._serviceName = serviceName;

  String? _visitDate;
  String? get visitDate => _$this._visitDate;
  set visitDate(String? visitDate) => _$this._visitDate = visitDate;

  String? _visitTime;
  String? get visitTime => _$this._visitTime;
  set visitTime(String? visitTime) => _$this._visitTime = visitTime;

  String? _visitStatus;
  String? get visitStatus => _$this._visitStatus;
  set visitStatus(String? visitStatus) => _$this._visitStatus = visitStatus;

  int? _weekIndex;
  int? get weekIndex => _$this._weekIndex;
  set weekIndex(int? weekIndex) => _$this._weekIndex = weekIndex;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  String? _paymentMethod;
  String? get paymentMethod => _$this._paymentMethod;
  set paymentMethod(String? paymentMethod) =>
      _$this._paymentMethod = paymentMethod;

  String? _paymentStatus;
  String? get paymentStatus => _$this._paymentStatus;
  set paymentStatus(String? paymentStatus) =>
      _$this._paymentStatus = paymentStatus;

  double? _longitude;
  double? get longitude => _$this._longitude;
  set longitude(double? longitude) => _$this._longitude = longitude;

  double? _latitude;
  double? get latitude => _$this._latitude;
  set latitude(double? latitude) => _$this._latitude = latitude;

  String? _companyName;
  String? get companyName => _$this._companyName;
  set companyName(String? companyName) => _$this._companyName = companyName;

  double? _price;
  double? get price => _$this._price;
  set price(double? price) => _$this._price = price;

  String? _employerPays;
  String? get employerPays => _$this._employerPays;
  set employerPays(String? employerPays) => _$this._employerPays = employerPays;

  ListBuilder<PatientAnalysis>? _saleOrderLines;
  ListBuilder<PatientAnalysis> get saleOrderLines =>
      _$this._saleOrderLines ??= new ListBuilder<PatientAnalysis>();
  set saleOrderLines(ListBuilder<PatientAnalysis>? saleOrderLines) =>
      _$this._saleOrderLines = saleOrderLines;

  ListBuilder<PatientAnalysis>? _results;
  ListBuilder<PatientAnalysis> get results =>
      _$this._results ??= new ListBuilder<PatientAnalysis>();
  set results(ListBuilder<PatientAnalysis>? results) =>
      _$this._results = results;

  PatientReviewModelBuilder? _review;
  PatientReviewModelBuilder get review =>
      _$this._review ??= new PatientReviewModelBuilder();
  set review(PatientReviewModelBuilder? review) => _$this._review = review;

  PatientVisitSingleModelBuilder();

  PatientVisitSingleModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _image = $v.image;
      _doctorFullName = $v.doctorFullName;
      _doctorJobName = $v.doctorJobName;
      _categoryName = $v.categoryName;
      _serviceType = $v.serviceType;
      _serviceName = $v.serviceName;
      _visitDate = $v.visitDate;
      _visitTime = $v.visitTime;
      _visitStatus = $v.visitStatus;
      _weekIndex = $v.weekIndex;
      _address = $v.address;
      _paymentMethod = $v.paymentMethod;
      _paymentStatus = $v.paymentStatus;
      _longitude = $v.longitude;
      _latitude = $v.latitude;
      _companyName = $v.companyName;
      _price = $v.price;
      _employerPays = $v.employerPays;
      _saleOrderLines = $v.saleOrderLines?.toBuilder();
      _results = $v.results?.toBuilder();
      _review = $v.review?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PatientVisitSingleModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PatientVisitSingleModel;
  }

  @override
  void update(void Function(PatientVisitSingleModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PatientVisitSingleModel build() => _build();

  _$PatientVisitSingleModel _build() {
    _$PatientVisitSingleModel _$result;
    try {
      _$result = _$v ??
          new _$PatientVisitSingleModel._(
            id: id,
            image: image,
            doctorFullName: doctorFullName,
            doctorJobName: doctorJobName,
            categoryName: categoryName,
            serviceType: serviceType,
            serviceName: serviceName,
            visitDate: visitDate,
            visitTime: visitTime,
            visitStatus: visitStatus,
            weekIndex: weekIndex,
            address: address,
            paymentMethod: paymentMethod,
            paymentStatus: paymentStatus,
            longitude: longitude,
            latitude: latitude,
            companyName: companyName,
            price: price,
            employerPays: employerPays,
            saleOrderLines: _saleOrderLines?.build(),
            results: _results?.build(),
            review: _review?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'saleOrderLines';
        _saleOrderLines?.build();
        _$failedField = 'results';
        _results?.build();
        _$failedField = 'review';
        _review?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PatientVisitSingleModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$PatientReviewModel extends PatientReviewModel {
  @override
  final String? state;
  @override
  final Object? createDate;
  @override
  final String? location;
  @override
  final String? review;
  @override
  final String? patientName;
  @override
  final int? id;

  factory _$PatientReviewModel(
          [void Function(PatientReviewModelBuilder)? updates]) =>
      (new PatientReviewModelBuilder()..update(updates))._build();

  _$PatientReviewModel._(
      {this.state,
      this.createDate,
      this.location,
      this.review,
      this.patientName,
      this.id})
      : super._();

  @override
  PatientReviewModel rebuild(
          void Function(PatientReviewModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PatientReviewModelBuilder toBuilder() =>
      new PatientReviewModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PatientReviewModel &&
        state == other.state &&
        createDate == other.createDate &&
        location == other.location &&
        review == other.review &&
        patientName == other.patientName &&
        id == other.id;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, state.hashCode);
    _$hash = $jc(_$hash, createDate.hashCode);
    _$hash = $jc(_$hash, location.hashCode);
    _$hash = $jc(_$hash, review.hashCode);
    _$hash = $jc(_$hash, patientName.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PatientReviewModel')
          ..add('state', state)
          ..add('createDate', createDate)
          ..add('location', location)
          ..add('review', review)
          ..add('patientName', patientName)
          ..add('id', id))
        .toString();
  }
}

class PatientReviewModelBuilder
    implements Builder<PatientReviewModel, PatientReviewModelBuilder> {
  _$PatientReviewModel? _$v;

  String? _state;
  String? get state => _$this._state;
  set state(String? state) => _$this._state = state;

  Object? _createDate;
  Object? get createDate => _$this._createDate;
  set createDate(Object? createDate) => _$this._createDate = createDate;

  String? _location;
  String? get location => _$this._location;
  set location(String? location) => _$this._location = location;

  String? _review;
  String? get review => _$this._review;
  set review(String? review) => _$this._review = review;

  String? _patientName;
  String? get patientName => _$this._patientName;
  set patientName(String? patientName) => _$this._patientName = patientName;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  PatientReviewModelBuilder();

  PatientReviewModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _state = $v.state;
      _createDate = $v.createDate;
      _location = $v.location;
      _review = $v.review;
      _patientName = $v.patientName;
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PatientReviewModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PatientReviewModel;
  }

  @override
  void update(void Function(PatientReviewModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PatientReviewModel build() => _build();

  _$PatientReviewModel _build() {
    final _$result = _$v ??
        new _$PatientReviewModel._(
          state: state,
          createDate: createDate,
          location: location,
          review: review,
          patientName: patientName,
          id: id,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
