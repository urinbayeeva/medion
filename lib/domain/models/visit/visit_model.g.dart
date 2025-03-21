// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visit_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<VisitResponse> _$visitResponseSerializer =
    new _$VisitResponseSerializer();
Serializer<VisitService> _$visitServiceSerializer =
    new _$VisitServiceSerializer();
Serializer<VisitRequest> _$visitRequestSerializer =
    new _$VisitRequestSerializer();

class _$VisitResponseSerializer implements StructuredSerializer<VisitResponse> {
  @override
  final Iterable<Type> types = const [VisitResponse, _$VisitResponse];
  @override
  final String wireName = 'VisitResponse';

  @override
  Iterable<Object?> serialize(Serializers serializers, VisitResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'services',
      serializers.serialize(object.services,
          specifiedType:
              const FullType(BuiltList, const [const FullType(VisitService)])),
    ];
    Object? value;
    value = object.paymeUrl;
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
    value = object.multicardUrl;
    if (value != null) {
      result
        ..add('multicard_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  VisitResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new VisitResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'services':
          result.services.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(VisitService)]))!
              as BuiltList<Object?>);
          break;
        case 'payme_url':
          result.paymeUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'click_url':
          result.clickUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'multicard_url':
          result.multicardUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$VisitServiceSerializer implements StructuredSerializer<VisitService> {
  @override
  final Iterable<Type> types = const [VisitService, _$VisitService];
  @override
  final String wireName = 'VisitService';

  @override
  Iterable<Object?> serialize(Serializers serializers, VisitService object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'doctor_id',
      serializers.serialize(object.doctorId,
          specifiedType: const FullType(String)),
      'image',
      serializers.serialize(object.image,
          specifiedType: const FullType(String)),
      'company_id',
      serializers.serialize(object.companyId,
          specifiedType: const FullType(String)),
      'main_service_id',
      serializers.serialize(object.mainServiceId,
          specifiedType: const FullType(String)),
      'product_type',
      serializers.serialize(object.productType,
          specifiedType: const FullType(String)),
      'doctor_first_visit_price_uzs',
      serializers.serialize(object.doctorFirstVisitPriceUzs,
          specifiedType: const FullType(int)),
      'doctor_first_visit_price_uzd',
      serializers.serialize(object.doctorFirstVisitPriceUzd,
          specifiedType: const FullType(int)),
      'doctor_revisit_price_uzs',
      serializers.serialize(object.doctorRevisitPriceUzs,
          specifiedType: const FullType(int)),
      'doctor_revisit_price_uzd',
      serializers.serialize(object.doctorRevisitPriceUzd,
          specifiedType: const FullType(int)),
      'date',
      serializers.serialize(object.date, specifiedType: const FullType(String)),
      'start_time',
      serializers.serialize(object.startTime,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  VisitService deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new VisitServiceBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'doctor_id':
          result.doctorId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'company_id':
          result.companyId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'main_service_id':
          result.mainServiceId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'product_type':
          result.productType = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'doctor_first_visit_price_uzs':
          result.doctorFirstVisitPriceUzs = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'doctor_first_visit_price_uzd':
          result.doctorFirstVisitPriceUzd = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'doctor_revisit_price_uzs':
          result.doctorRevisitPriceUzs = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'doctor_revisit_price_uzd':
          result.doctorRevisitPriceUzd = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'start_time':
          result.startTime = serializers.deserialize(value,
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

class _$VisitResponse extends VisitResponse {
  @override
  final BuiltList<VisitService> services;
  @override
  final String? paymeUrl;
  @override
  final String? clickUrl;
  @override
  final String? multicardUrl;

  factory _$VisitResponse([void Function(VisitResponseBuilder)? updates]) =>
      (new VisitResponseBuilder()..update(updates))._build();

  _$VisitResponse._(
      {required this.services, this.paymeUrl, this.clickUrl, this.multicardUrl})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        services, r'VisitResponse', 'services');
  }

  @override
  VisitResponse rebuild(void Function(VisitResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VisitResponseBuilder toBuilder() => new VisitResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VisitResponse &&
        services == other.services &&
        paymeUrl == other.paymeUrl &&
        clickUrl == other.clickUrl &&
        multicardUrl == other.multicardUrl;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, services.hashCode);
    _$hash = $jc(_$hash, paymeUrl.hashCode);
    _$hash = $jc(_$hash, clickUrl.hashCode);
    _$hash = $jc(_$hash, multicardUrl.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'VisitResponse')
          ..add('services', services)
          ..add('paymeUrl', paymeUrl)
          ..add('clickUrl', clickUrl)
          ..add('multicardUrl', multicardUrl))
        .toString();
  }
}

class VisitResponseBuilder
    implements Builder<VisitResponse, VisitResponseBuilder> {
  _$VisitResponse? _$v;

  ListBuilder<VisitService>? _services;
  ListBuilder<VisitService> get services =>
      _$this._services ??= new ListBuilder<VisitService>();
  set services(ListBuilder<VisitService>? services) =>
      _$this._services = services;

  String? _paymeUrl;
  String? get paymeUrl => _$this._paymeUrl;
  set paymeUrl(String? paymeUrl) => _$this._paymeUrl = paymeUrl;

  String? _clickUrl;
  String? get clickUrl => _$this._clickUrl;
  set clickUrl(String? clickUrl) => _$this._clickUrl = clickUrl;

  String? _multicardUrl;
  String? get multicardUrl => _$this._multicardUrl;
  set multicardUrl(String? multicardUrl) => _$this._multicardUrl = multicardUrl;

  VisitResponseBuilder();

  VisitResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _services = $v.services.toBuilder();
      _paymeUrl = $v.paymeUrl;
      _clickUrl = $v.clickUrl;
      _multicardUrl = $v.multicardUrl;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VisitResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$VisitResponse;
  }

  @override
  void update(void Function(VisitResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  VisitResponse build() => _build();

  _$VisitResponse _build() {
    _$VisitResponse _$result;
    try {
      _$result = _$v ??
          new _$VisitResponse._(
            services: services.build(),
            paymeUrl: paymeUrl,
            clickUrl: clickUrl,
            multicardUrl: multicardUrl,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'services';
        services.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'VisitResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$VisitService extends VisitService {
  @override
  final int id;
  @override
  final String doctorId;
  @override
  final String image;
  @override
  final String companyId;
  @override
  final String mainServiceId;
  @override
  final String productType;
  @override
  final int doctorFirstVisitPriceUzs;
  @override
  final int doctorFirstVisitPriceUzd;
  @override
  final int doctorRevisitPriceUzs;
  @override
  final int doctorRevisitPriceUzd;
  @override
  final String date;
  @override
  final String startTime;

  factory _$VisitService([void Function(VisitServiceBuilder)? updates]) =>
      (new VisitServiceBuilder()..update(updates))._build();

  _$VisitService._(
      {required this.id,
      required this.doctorId,
      required this.image,
      required this.companyId,
      required this.mainServiceId,
      required this.productType,
      required this.doctorFirstVisitPriceUzs,
      required this.doctorFirstVisitPriceUzd,
      required this.doctorRevisitPriceUzs,
      required this.doctorRevisitPriceUzd,
      required this.date,
      required this.startTime})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'VisitService', 'id');
    BuiltValueNullFieldError.checkNotNull(
        doctorId, r'VisitService', 'doctorId');
    BuiltValueNullFieldError.checkNotNull(image, r'VisitService', 'image');
    BuiltValueNullFieldError.checkNotNull(
        companyId, r'VisitService', 'companyId');
    BuiltValueNullFieldError.checkNotNull(
        mainServiceId, r'VisitService', 'mainServiceId');
    BuiltValueNullFieldError.checkNotNull(
        productType, r'VisitService', 'productType');
    BuiltValueNullFieldError.checkNotNull(
        doctorFirstVisitPriceUzs, r'VisitService', 'doctorFirstVisitPriceUzs');
    BuiltValueNullFieldError.checkNotNull(
        doctorFirstVisitPriceUzd, r'VisitService', 'doctorFirstVisitPriceUzd');
    BuiltValueNullFieldError.checkNotNull(
        doctorRevisitPriceUzs, r'VisitService', 'doctorRevisitPriceUzs');
    BuiltValueNullFieldError.checkNotNull(
        doctorRevisitPriceUzd, r'VisitService', 'doctorRevisitPriceUzd');
    BuiltValueNullFieldError.checkNotNull(date, r'VisitService', 'date');
    BuiltValueNullFieldError.checkNotNull(
        startTime, r'VisitService', 'startTime');
  }

  @override
  VisitService rebuild(void Function(VisitServiceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VisitServiceBuilder toBuilder() => new VisitServiceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VisitService &&
        id == other.id &&
        doctorId == other.doctorId &&
        image == other.image &&
        companyId == other.companyId &&
        mainServiceId == other.mainServiceId &&
        productType == other.productType &&
        doctorFirstVisitPriceUzs == other.doctorFirstVisitPriceUzs &&
        doctorFirstVisitPriceUzd == other.doctorFirstVisitPriceUzd &&
        doctorRevisitPriceUzs == other.doctorRevisitPriceUzs &&
        doctorRevisitPriceUzd == other.doctorRevisitPriceUzd &&
        date == other.date &&
        startTime == other.startTime;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, doctorId.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jc(_$hash, companyId.hashCode);
    _$hash = $jc(_$hash, mainServiceId.hashCode);
    _$hash = $jc(_$hash, productType.hashCode);
    _$hash = $jc(_$hash, doctorFirstVisitPriceUzs.hashCode);
    _$hash = $jc(_$hash, doctorFirstVisitPriceUzd.hashCode);
    _$hash = $jc(_$hash, doctorRevisitPriceUzs.hashCode);
    _$hash = $jc(_$hash, doctorRevisitPriceUzd.hashCode);
    _$hash = $jc(_$hash, date.hashCode);
    _$hash = $jc(_$hash, startTime.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'VisitService')
          ..add('id', id)
          ..add('doctorId', doctorId)
          ..add('image', image)
          ..add('companyId', companyId)
          ..add('mainServiceId', mainServiceId)
          ..add('productType', productType)
          ..add('doctorFirstVisitPriceUzs', doctorFirstVisitPriceUzs)
          ..add('doctorFirstVisitPriceUzd', doctorFirstVisitPriceUzd)
          ..add('doctorRevisitPriceUzs', doctorRevisitPriceUzs)
          ..add('doctorRevisitPriceUzd', doctorRevisitPriceUzd)
          ..add('date', date)
          ..add('startTime', startTime))
        .toString();
  }
}

class VisitServiceBuilder
    implements Builder<VisitService, VisitServiceBuilder> {
  _$VisitService? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _doctorId;
  String? get doctorId => _$this._doctorId;
  set doctorId(String? doctorId) => _$this._doctorId = doctorId;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  String? _companyId;
  String? get companyId => _$this._companyId;
  set companyId(String? companyId) => _$this._companyId = companyId;

  String? _mainServiceId;
  String? get mainServiceId => _$this._mainServiceId;
  set mainServiceId(String? mainServiceId) =>
      _$this._mainServiceId = mainServiceId;

  String? _productType;
  String? get productType => _$this._productType;
  set productType(String? productType) => _$this._productType = productType;

  int? _doctorFirstVisitPriceUzs;
  int? get doctorFirstVisitPriceUzs => _$this._doctorFirstVisitPriceUzs;
  set doctorFirstVisitPriceUzs(int? doctorFirstVisitPriceUzs) =>
      _$this._doctorFirstVisitPriceUzs = doctorFirstVisitPriceUzs;

  int? _doctorFirstVisitPriceUzd;
  int? get doctorFirstVisitPriceUzd => _$this._doctorFirstVisitPriceUzd;
  set doctorFirstVisitPriceUzd(int? doctorFirstVisitPriceUzd) =>
      _$this._doctorFirstVisitPriceUzd = doctorFirstVisitPriceUzd;

  int? _doctorRevisitPriceUzs;
  int? get doctorRevisitPriceUzs => _$this._doctorRevisitPriceUzs;
  set doctorRevisitPriceUzs(int? doctorRevisitPriceUzs) =>
      _$this._doctorRevisitPriceUzs = doctorRevisitPriceUzs;

  int? _doctorRevisitPriceUzd;
  int? get doctorRevisitPriceUzd => _$this._doctorRevisitPriceUzd;
  set doctorRevisitPriceUzd(int? doctorRevisitPriceUzd) =>
      _$this._doctorRevisitPriceUzd = doctorRevisitPriceUzd;

  String? _date;
  String? get date => _$this._date;
  set date(String? date) => _$this._date = date;

  String? _startTime;
  String? get startTime => _$this._startTime;
  set startTime(String? startTime) => _$this._startTime = startTime;

  VisitServiceBuilder();

  VisitServiceBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _doctorId = $v.doctorId;
      _image = $v.image;
      _companyId = $v.companyId;
      _mainServiceId = $v.mainServiceId;
      _productType = $v.productType;
      _doctorFirstVisitPriceUzs = $v.doctorFirstVisitPriceUzs;
      _doctorFirstVisitPriceUzd = $v.doctorFirstVisitPriceUzd;
      _doctorRevisitPriceUzs = $v.doctorRevisitPriceUzs;
      _doctorRevisitPriceUzd = $v.doctorRevisitPriceUzd;
      _date = $v.date;
      _startTime = $v.startTime;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VisitService other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$VisitService;
  }

  @override
  void update(void Function(VisitServiceBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  VisitService build() => _build();

  _$VisitService _build() {
    final _$result = _$v ??
        new _$VisitService._(
          id: BuiltValueNullFieldError.checkNotNull(id, r'VisitService', 'id'),
          doctorId: BuiltValueNullFieldError.checkNotNull(
              doctorId, r'VisitService', 'doctorId'),
          image: BuiltValueNullFieldError.checkNotNull(
              image, r'VisitService', 'image'),
          companyId: BuiltValueNullFieldError.checkNotNull(
              companyId, r'VisitService', 'companyId'),
          mainServiceId: BuiltValueNullFieldError.checkNotNull(
              mainServiceId, r'VisitService', 'mainServiceId'),
          productType: BuiltValueNullFieldError.checkNotNull(
              productType, r'VisitService', 'productType'),
          doctorFirstVisitPriceUzs: BuiltValueNullFieldError.checkNotNull(
              doctorFirstVisitPriceUzs,
              r'VisitService',
              'doctorFirstVisitPriceUzs'),
          doctorFirstVisitPriceUzd: BuiltValueNullFieldError.checkNotNull(
              doctorFirstVisitPriceUzd,
              r'VisitService',
              'doctorFirstVisitPriceUzd'),
          doctorRevisitPriceUzs: BuiltValueNullFieldError.checkNotNull(
              doctorRevisitPriceUzs, r'VisitService', 'doctorRevisitPriceUzs'),
          doctorRevisitPriceUzd: BuiltValueNullFieldError.checkNotNull(
              doctorRevisitPriceUzd, r'VisitService', 'doctorRevisitPriceUzd'),
          date: BuiltValueNullFieldError.checkNotNull(
              date, r'VisitService', 'date'),
          startTime: BuiltValueNullFieldError.checkNotNull(
              startTime, r'VisitService', 'startTime'),
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
