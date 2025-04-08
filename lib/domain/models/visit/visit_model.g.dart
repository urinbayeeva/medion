// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visit_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<VisitOrder> _$visitOrderSerializer = new _$VisitOrderSerializer();
Serializer<OrderVisit> _$orderVisitSerializer = new _$OrderVisitSerializer();
Serializer<VisitRequest> _$visitRequestSerializer =
    new _$VisitRequestSerializer();

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

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
