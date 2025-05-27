// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PaymentResponse> _$paymentResponseSerializer =
    new _$PaymentResponseSerializer();
Serializer<Payment> _$paymentSerializer = new _$PaymentSerializer();

class _$PaymentResponseSerializer
    implements StructuredSerializer<PaymentResponse> {
  @override
  final Iterable<Type> types = const [PaymentResponse, _$PaymentResponse];
  @override
  final String wireName = 'PaymentResponse';

  @override
  Iterable<Object?> serialize(Serializers serializers, PaymentResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'payments',
      serializers.serialize(object.payments,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Payment)])),
    ];
    Object? value;
    value = object.patientBalance;
    if (value != null) {
      result
        ..add('patient_balance')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.patientDeposit;
    if (value != null) {
      result
        ..add('patient_deposit')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.patientDebit;
    if (value != null) {
      result
        ..add('patient_debit')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  PaymentResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PaymentResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'patient_balance':
          result.patientBalance = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'patient_deposit':
          result.patientDeposit = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'patient_debit':
          result.patientDebit = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'payments':
          result.payments.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Payment)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$PaymentSerializer implements StructuredSerializer<Payment> {
  @override
  final Iterable<Type> types = const [Payment, _$Payment];
  @override
  final String wireName = 'Payment';

  @override
  Iterable<Object?> serialize(Serializers serializers, Payment object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.moveId;
    if (value != null) {
      result
        ..add('move_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.partnerId;
    if (value != null) {
      result
        ..add('partner_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.date;
    if (value != null) {
      result
        ..add('date')
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
    value = object.createUid;
    if (value != null) {
      result
        ..add('create_uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.journalName;
    if (value != null) {
      result
        ..add('journal_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.caseRef;
    if (value != null) {
      result
        ..add('case_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.currencyId;
    if (value != null) {
      result
        ..add('currency_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.companyId;
    if (value != null) {
      result
        ..add('company_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.debit;
    if (value != null) {
      result
        ..add('debit')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.credit;
    if (value != null) {
      result
        ..add('credit')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.dateMaturity;
    if (value != null) {
      result
        ..add('date_maturity')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.displayAmount;
    if (value != null) {
      result
        ..add('display_amount')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.createUser;
    if (value != null) {
      result
        ..add('create_user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Payment deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PaymentBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'move_id':
          result.moveId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'partner_id':
          result.partnerId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'create_date':
          result.createDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'create_uid':
          result.createUid = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'journal_name':
          result.journalName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'case_ref':
          result.caseRef = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'currency_id':
          result.currencyId = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'company_id':
          result.companyId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'debit':
          result.debit = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'credit':
          result.credit = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'date_maturity':
          result.dateMaturity = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'display_amount':
          result.displayAmount = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'create_user':
          result.createUser = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$PaymentResponse extends PaymentResponse {
  @override
  final double? patientBalance;
  @override
  final double? patientDeposit;
  @override
  final double? patientDebit;
  @override
  final BuiltList<Payment> payments;

  factory _$PaymentResponse([void Function(PaymentResponseBuilder)? updates]) =>
      (new PaymentResponseBuilder()..update(updates))._build();

  _$PaymentResponse._(
      {this.patientBalance,
      this.patientDeposit,
      this.patientDebit,
      required this.payments})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        payments, r'PaymentResponse', 'payments');
  }

  @override
  PaymentResponse rebuild(void Function(PaymentResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PaymentResponseBuilder toBuilder() =>
      new PaymentResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaymentResponse &&
        patientBalance == other.patientBalance &&
        patientDeposit == other.patientDeposit &&
        patientDebit == other.patientDebit &&
        payments == other.payments;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, patientBalance.hashCode);
    _$hash = $jc(_$hash, patientDeposit.hashCode);
    _$hash = $jc(_$hash, patientDebit.hashCode);
    _$hash = $jc(_$hash, payments.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PaymentResponse')
          ..add('patientBalance', patientBalance)
          ..add('patientDeposit', patientDeposit)
          ..add('patientDebit', patientDebit)
          ..add('payments', payments))
        .toString();
  }
}

class PaymentResponseBuilder
    implements Builder<PaymentResponse, PaymentResponseBuilder> {
  _$PaymentResponse? _$v;

  double? _patientBalance;
  double? get patientBalance => _$this._patientBalance;
  set patientBalance(double? patientBalance) =>
      _$this._patientBalance = patientBalance;

  double? _patientDeposit;
  double? get patientDeposit => _$this._patientDeposit;
  set patientDeposit(double? patientDeposit) =>
      _$this._patientDeposit = patientDeposit;

  double? _patientDebit;
  double? get patientDebit => _$this._patientDebit;
  set patientDebit(double? patientDebit) => _$this._patientDebit = patientDebit;

  ListBuilder<Payment>? _payments;
  ListBuilder<Payment> get payments =>
      _$this._payments ??= new ListBuilder<Payment>();
  set payments(ListBuilder<Payment>? payments) => _$this._payments = payments;

  PaymentResponseBuilder();

  PaymentResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _patientBalance = $v.patientBalance;
      _patientDeposit = $v.patientDeposit;
      _patientDebit = $v.patientDebit;
      _payments = $v.payments.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PaymentResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PaymentResponse;
  }

  @override
  void update(void Function(PaymentResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PaymentResponse build() => _build();

  _$PaymentResponse _build() {
    _$PaymentResponse _$result;
    try {
      _$result = _$v ??
          new _$PaymentResponse._(
            patientBalance: patientBalance,
            patientDeposit: patientDeposit,
            patientDebit: patientDebit,
            payments: payments.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'payments';
        payments.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PaymentResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Payment extends Payment {
  @override
  final String? moveId;
  @override
  final int? partnerId;
  @override
  final String? date;
  @override
  final String? createDate;
  @override
  final double? createUid;
  @override
  final String? journalName;
  @override
  final String? name;
  @override
  final String? caseRef;
  @override
  final double? currencyId;
  @override
  final int? companyId;
  @override
  final double? debit;
  @override
  final double? credit;
  @override
  final String? dateMaturity;
  @override
  final double? displayAmount;
  @override
  final String? createUser;

  factory _$Payment([void Function(PaymentBuilder)? updates]) =>
      (new PaymentBuilder()..update(updates))._build();

  _$Payment._(
      {this.moveId,
      this.partnerId,
      this.date,
      this.createDate,
      this.createUid,
      this.journalName,
      this.name,
      this.caseRef,
      this.currencyId,
      this.companyId,
      this.debit,
      this.credit,
      this.dateMaturity,
      this.displayAmount,
      this.createUser})
      : super._();

  @override
  Payment rebuild(void Function(PaymentBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PaymentBuilder toBuilder() => new PaymentBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Payment &&
        moveId == other.moveId &&
        partnerId == other.partnerId &&
        date == other.date &&
        createDate == other.createDate &&
        createUid == other.createUid &&
        journalName == other.journalName &&
        name == other.name &&
        caseRef == other.caseRef &&
        currencyId == other.currencyId &&
        companyId == other.companyId &&
        debit == other.debit &&
        credit == other.credit &&
        dateMaturity == other.dateMaturity &&
        displayAmount == other.displayAmount &&
        createUser == other.createUser;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, moveId.hashCode);
    _$hash = $jc(_$hash, partnerId.hashCode);
    _$hash = $jc(_$hash, date.hashCode);
    _$hash = $jc(_$hash, createDate.hashCode);
    _$hash = $jc(_$hash, createUid.hashCode);
    _$hash = $jc(_$hash, journalName.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, caseRef.hashCode);
    _$hash = $jc(_$hash, currencyId.hashCode);
    _$hash = $jc(_$hash, companyId.hashCode);
    _$hash = $jc(_$hash, debit.hashCode);
    _$hash = $jc(_$hash, credit.hashCode);
    _$hash = $jc(_$hash, dateMaturity.hashCode);
    _$hash = $jc(_$hash, displayAmount.hashCode);
    _$hash = $jc(_$hash, createUser.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Payment')
          ..add('moveId', moveId)
          ..add('partnerId', partnerId)
          ..add('date', date)
          ..add('createDate', createDate)
          ..add('createUid', createUid)
          ..add('journalName', journalName)
          ..add('name', name)
          ..add('caseRef', caseRef)
          ..add('currencyId', currencyId)
          ..add('companyId', companyId)
          ..add('debit', debit)
          ..add('credit', credit)
          ..add('dateMaturity', dateMaturity)
          ..add('displayAmount', displayAmount)
          ..add('createUser', createUser))
        .toString();
  }
}

class PaymentBuilder implements Builder<Payment, PaymentBuilder> {
  _$Payment? _$v;

  String? _moveId;
  String? get moveId => _$this._moveId;
  set moveId(String? moveId) => _$this._moveId = moveId;

  int? _partnerId;
  int? get partnerId => _$this._partnerId;
  set partnerId(int? partnerId) => _$this._partnerId = partnerId;

  String? _date;
  String? get date => _$this._date;
  set date(String? date) => _$this._date = date;

  String? _createDate;
  String? get createDate => _$this._createDate;
  set createDate(String? createDate) => _$this._createDate = createDate;

  double? _createUid;
  double? get createUid => _$this._createUid;
  set createUid(double? createUid) => _$this._createUid = createUid;

  String? _journalName;
  String? get journalName => _$this._journalName;
  set journalName(String? journalName) => _$this._journalName = journalName;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _caseRef;
  String? get caseRef => _$this._caseRef;
  set caseRef(String? caseRef) => _$this._caseRef = caseRef;

  double? _currencyId;
  double? get currencyId => _$this._currencyId;
  set currencyId(double? currencyId) => _$this._currencyId = currencyId;

  int? _companyId;
  int? get companyId => _$this._companyId;
  set companyId(int? companyId) => _$this._companyId = companyId;

  double? _debit;
  double? get debit => _$this._debit;
  set debit(double? debit) => _$this._debit = debit;

  double? _credit;
  double? get credit => _$this._credit;
  set credit(double? credit) => _$this._credit = credit;

  String? _dateMaturity;
  String? get dateMaturity => _$this._dateMaturity;
  set dateMaturity(String? dateMaturity) => _$this._dateMaturity = dateMaturity;

  double? _displayAmount;
  double? get displayAmount => _$this._displayAmount;
  set displayAmount(double? displayAmount) =>
      _$this._displayAmount = displayAmount;

  String? _createUser;
  String? get createUser => _$this._createUser;
  set createUser(String? createUser) => _$this._createUser = createUser;

  PaymentBuilder();

  PaymentBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _moveId = $v.moveId;
      _partnerId = $v.partnerId;
      _date = $v.date;
      _createDate = $v.createDate;
      _createUid = $v.createUid;
      _journalName = $v.journalName;
      _name = $v.name;
      _caseRef = $v.caseRef;
      _currencyId = $v.currencyId;
      _companyId = $v.companyId;
      _debit = $v.debit;
      _credit = $v.credit;
      _dateMaturity = $v.dateMaturity;
      _displayAmount = $v.displayAmount;
      _createUser = $v.createUser;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Payment other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Payment;
  }

  @override
  void update(void Function(PaymentBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Payment build() => _build();

  _$Payment _build() {
    final _$result = _$v ??
        new _$Payment._(
          moveId: moveId,
          partnerId: partnerId,
          date: date,
          createDate: createDate,
          createUid: createUid,
          journalName: journalName,
          name: name,
          caseRef: caseRef,
          currencyId: currencyId,
          companyId: companyId,
          debit: debit,
          credit: credit,
          dateMaturity: dateMaturity,
          displayAmount: displayAmount,
          createUser: createUser,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
