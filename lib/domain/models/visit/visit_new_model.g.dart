// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visit_new_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<VisitResponse> _$visitResponseSerializer =
    new _$VisitResponseSerializer();
Serializer<Visit> _$visitSerializer = new _$VisitSerializer();

class _$VisitResponseSerializer implements StructuredSerializer<VisitResponse> {
  @override
  final Iterable<Type> types = const [VisitResponse, _$VisitResponse];
  @override
  final String wireName = 'VisitResponse';

  @override
  Iterable<Object?> serialize(Serializers serializers, VisitResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'status',
      serializers.serialize(object.status,
          specifiedType: const FullType(String)),
      'visits',
      serializers.serialize(object.visits,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Visit)])),
    ];

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
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'visits':
          result.visits.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Visit)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$VisitSerializer implements StructuredSerializer<Visit> {
  @override
  final Iterable<Type> types = const [Visit, _$Visit];
  @override
  final String wireName = 'Visit';

  @override
  Iterable<Object?> serialize(Serializers serializers, Visit object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'visit_id',
      serializers.serialize(object.visitId, specifiedType: const FullType(int)),
      'date',
      serializers.serialize(object.date, specifiedType: const FullType(String)),
      'doctor_name',
      serializers.serialize(object.doctorName,
          specifiedType: const FullType(String)),
      'speciality',
      serializers.serialize(object.speciality,
          specifiedType: const FullType(String)),
      'clinic_name',
      serializers.serialize(object.clinicName,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.invoiceUrl;
    if (value != null) {
      result
        ..add('invoice_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.pdfUrl;
    if (value != null) {
      result
        ..add('pdf_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Visit deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new VisitBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'visit_id':
          result.visitId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'doctor_name':
          result.doctorName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'speciality':
          result.speciality = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'clinic_name':
          result.clinicName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'invoice_url':
          result.invoiceUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'pdf_url':
          result.pdfUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$VisitResponse extends VisitResponse {
  @override
  final String status;
  @override
  final BuiltList<Visit> visits;

  factory _$VisitResponse([void Function(VisitResponseBuilder)? updates]) =>
      (new VisitResponseBuilder()..update(updates))._build();

  _$VisitResponse._({required this.status, required this.visits}) : super._() {
    BuiltValueNullFieldError.checkNotNull(status, r'VisitResponse', 'status');
    BuiltValueNullFieldError.checkNotNull(visits, r'VisitResponse', 'visits');
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
        status == other.status &&
        visits == other.visits;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, visits.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'VisitResponse')
          ..add('status', status)
          ..add('visits', visits))
        .toString();
  }
}

class VisitResponseBuilder
    implements Builder<VisitResponse, VisitResponseBuilder> {
  _$VisitResponse? _$v;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  ListBuilder<Visit>? _visits;
  ListBuilder<Visit> get visits => _$this._visits ??= new ListBuilder<Visit>();
  set visits(ListBuilder<Visit>? visits) => _$this._visits = visits;

  VisitResponseBuilder();

  VisitResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _status = $v.status;
      _visits = $v.visits.toBuilder();
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
            status: BuiltValueNullFieldError.checkNotNull(
                status, r'VisitResponse', 'status'),
            visits: visits.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'visits';
        visits.build();
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

class _$Visit extends Visit {
  @override
  final int visitId;
  @override
  final String date;
  @override
  final String doctorName;
  @override
  final String speciality;
  @override
  final String clinicName;
  @override
  final String? invoiceUrl;
  @override
  final String? pdfUrl;

  factory _$Visit([void Function(VisitBuilder)? updates]) =>
      (new VisitBuilder()..update(updates))._build();

  _$Visit._(
      {required this.visitId,
      required this.date,
      required this.doctorName,
      required this.speciality,
      required this.clinicName,
      this.invoiceUrl,
      this.pdfUrl})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(visitId, r'Visit', 'visitId');
    BuiltValueNullFieldError.checkNotNull(date, r'Visit', 'date');
    BuiltValueNullFieldError.checkNotNull(doctorName, r'Visit', 'doctorName');
    BuiltValueNullFieldError.checkNotNull(speciality, r'Visit', 'speciality');
    BuiltValueNullFieldError.checkNotNull(clinicName, r'Visit', 'clinicName');
  }

  @override
  Visit rebuild(void Function(VisitBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VisitBuilder toBuilder() => new VisitBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Visit &&
        visitId == other.visitId &&
        date == other.date &&
        doctorName == other.doctorName &&
        speciality == other.speciality &&
        clinicName == other.clinicName &&
        invoiceUrl == other.invoiceUrl &&
        pdfUrl == other.pdfUrl;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, visitId.hashCode);
    _$hash = $jc(_$hash, date.hashCode);
    _$hash = $jc(_$hash, doctorName.hashCode);
    _$hash = $jc(_$hash, speciality.hashCode);
    _$hash = $jc(_$hash, clinicName.hashCode);
    _$hash = $jc(_$hash, invoiceUrl.hashCode);
    _$hash = $jc(_$hash, pdfUrl.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Visit')
          ..add('visitId', visitId)
          ..add('date', date)
          ..add('doctorName', doctorName)
          ..add('speciality', speciality)
          ..add('clinicName', clinicName)
          ..add('invoiceUrl', invoiceUrl)
          ..add('pdfUrl', pdfUrl))
        .toString();
  }
}

class VisitBuilder implements Builder<Visit, VisitBuilder> {
  _$Visit? _$v;

  int? _visitId;
  int? get visitId => _$this._visitId;
  set visitId(int? visitId) => _$this._visitId = visitId;

  String? _date;
  String? get date => _$this._date;
  set date(String? date) => _$this._date = date;

  String? _doctorName;
  String? get doctorName => _$this._doctorName;
  set doctorName(String? doctorName) => _$this._doctorName = doctorName;

  String? _speciality;
  String? get speciality => _$this._speciality;
  set speciality(String? speciality) => _$this._speciality = speciality;

  String? _clinicName;
  String? get clinicName => _$this._clinicName;
  set clinicName(String? clinicName) => _$this._clinicName = clinicName;

  String? _invoiceUrl;
  String? get invoiceUrl => _$this._invoiceUrl;
  set invoiceUrl(String? invoiceUrl) => _$this._invoiceUrl = invoiceUrl;

  String? _pdfUrl;
  String? get pdfUrl => _$this._pdfUrl;
  set pdfUrl(String? pdfUrl) => _$this._pdfUrl = pdfUrl;

  VisitBuilder();

  VisitBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _visitId = $v.visitId;
      _date = $v.date;
      _doctorName = $v.doctorName;
      _speciality = $v.speciality;
      _clinicName = $v.clinicName;
      _invoiceUrl = $v.invoiceUrl;
      _pdfUrl = $v.pdfUrl;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Visit other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Visit;
  }

  @override
  void update(void Function(VisitBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Visit build() => _build();

  _$Visit _build() {
    final _$result = _$v ??
        new _$Visit._(
          visitId: BuiltValueNullFieldError.checkNotNull(
              visitId, r'Visit', 'visitId'),
          date: BuiltValueNullFieldError.checkNotNull(date, r'Visit', 'date'),
          doctorName: BuiltValueNullFieldError.checkNotNull(
              doctorName, r'Visit', 'doctorName'),
          speciality: BuiltValueNullFieldError.checkNotNull(
              speciality, r'Visit', 'speciality'),
          clinicName: BuiltValueNullFieldError.checkNotNull(
              clinicName, r'Visit', 'clinicName'),
          invoiceUrl: invoiceUrl,
          pdfUrl: pdfUrl,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
