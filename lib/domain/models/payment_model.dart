import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'payment_model.g.dart';

abstract class PaymentResponse
    implements Built<PaymentResponse, PaymentResponseBuilder> {
  @BuiltValueField(wireName: 'patient_balance')
  double? get patientBalance;

  @BuiltValueField(wireName: 'patient_deposit')
  double? get patientDeposit;

  @BuiltValueField(wireName: 'patient_debit')
  double? get patientDebit;

  @BuiltValueField(wireName: 'payments')
  BuiltList<Payment> get payments;

  PaymentResponse._();
  factory PaymentResponse([void Function(PaymentResponseBuilder) updates]) =
      _$PaymentResponse;
  static Serializer<PaymentResponse> get serializer =>
      _$paymentResponseSerializer;
}

abstract class Payment implements Built<Payment, PaymentBuilder> {
  @BuiltValueField(wireName: 'move_id')
  String? get moveId;

  @BuiltValueField(wireName: 'partner_id')
  int? get partnerId;

  @BuiltValueField(wireName: 'date')
  String? get date;

  @BuiltValueField(wireName: 'create_date')
  String? get createDate;

  @BuiltValueField(wireName: 'create_uid')
  double? get createUid;

  @BuiltValueField(wireName: 'journal_name')
  String? get journalName;

  @BuiltValueField(wireName: 'name')
  String? get name;

  @BuiltValueField(wireName: 'case_ref')
  String? get caseRef;

  @BuiltValueField(wireName: 'currency_id')
  double? get currencyId;

  @BuiltValueField(wireName: 'company_id')
  int? get companyId;

  @BuiltValueField(wireName: 'debit')
  double? get debit;

  @BuiltValueField(wireName: 'credit')
  double? get credit;

  @BuiltValueField(wireName: 'date_maturity')
  String? get dateMaturity;

  @BuiltValueField(wireName: 'display_amount')
  double? get displayAmount;

  @BuiltValueField(wireName: 'create_user')
  String? get createUser;

  Payment._();
  factory Payment([void Function(PaymentBuilder) updates]) = _$Payment;
  static Serializer<Payment> get serializer => _$paymentSerializer;
}
