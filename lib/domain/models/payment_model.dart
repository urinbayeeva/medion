import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'payment_model.g.dart';

abstract class PaymentResponse implements Built<PaymentResponse, PaymentResponseBuilder> {
  @BuiltValueField(wireName: 'patient_balance')
  double? get patientBalance;

  @BuiltValueField(wireName: 'patient_deposit')
  double? get patientDeposit;

  @BuiltValueField(wireName: 'patient_debit')
  double? get patientDebit;

  @BuiltValueField(wireName: 'payment_history')
  BuiltList<DailyTransactions> get payments;

  PaymentResponse._();

  factory PaymentResponse([void Function(PaymentResponseBuilder) updates]) = _$PaymentResponse;

  static Serializer<PaymentResponse> get serializer => _$paymentResponseSerializer;
}

abstract class DailyTransactions implements Built<DailyTransactions, DailyTransactionsBuilder> {
  @BuiltValueField(wireName: 'date')
  String? get date;

  @BuiltValueField(wireName: 'total_amount')
  double? get totalAmount;

  @BuiltValueField(wireName: 'transactions')
  BuiltList<Transactions> get transactions;

  DailyTransactions._();

  factory DailyTransactions([void Function(DailyTransactionsBuilder) updates]) = _$DailyTransactions;

  static Serializer<DailyTransactions> get serializer => _$dailyTransactionsSerializer;
}

abstract class Transactions implements Built<Transactions, TransactionsBuilder> {
  //           "cashier": "Public user",
  //           "status": "cancel",
  //           "payment_check": "https://his.uicgroup.tech/apiweb/patient_report/1498?model=account.move",
  //           "fiscal_check": null,
  //           "is_income": false
  @BuiltValueField(wireName: 'datetime')
  String? get dateTime;

  @BuiltValueField(wireName: 'name')
  String? get name;

  @BuiltValueField(wireName: 'currency')
  String? get currency;

  @BuiltValueField(wireName: 'payment_method')
  String? get paymentMethod;

  @BuiltValueField(wireName: 'invoice_name')
  String? get invoiceName;

  @BuiltValueField(wireName: 'cashier')
  String? get cashier;

  @BuiltValueField(wireName: 'status')
  String? get status;

  @BuiltValueField(wireName: 'payment_check')
  String? get paymentCheck;

  @BuiltValueField(wireName: 'fiscal_check')
  String? get fiscalCheck;

  @BuiltValueField(wireName: 'is_income')
  bool? get isIncome;

  @BuiltValueField(wireName: 'amount')
  double? get amount;

  @BuiltValueField(wireName: 'account_number')
  String? get accountNumber;

  Transactions._();

  factory Transactions([void Function(TransactionsBuilder) updates]) = _$Transactions;

  static Serializer<Transactions> get serializer => _$transactionsSerializer;
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

abstract class Recommendation implements Built<Recommendation, RecommendationBuilder> {
  @BuiltValueField(wireName: 'datetime')
  String? get datetime;

  @BuiltValueField(wireName: 'service_name')
  String? get serviceName;

  @BuiltValueField(wireName: 'doctor_name')
  String? get doctorName;

  @BuiltValueField(wireName: 'address')
  String? get address;

  @BuiltValueField(wireName: 'recommendations')
  BuiltList<RecommendationInfo>? get recommendations;

  Recommendation._();

  factory Recommendation([void Function(RecommendationBuilder) updates]) = _$Recommendation;

  static Serializer<Recommendation> get serializer => _$recommendationSerializer;
}

abstract class RecommendationInfo implements Built<RecommendationInfo, RecommendationInfoBuilder> {
  @BuiltValueField(wireName: 'service_id')
  int? get serviceId;

  @BuiltValueField(wireName: 'service_name')
  String? get serviceName;

  @BuiltValueField(wireName: 'doctor_id')
  int? get doctorId;

  @BuiltValueField(wireName: 'price')
  double? get price;

  @BuiltValueField(wireName: 'order_detail_id')
  int? get orderDetailId;

  RecommendationInfo._();

  factory RecommendationInfo([void Function(RecommendationInfoBuilder) updates]) = _$RecommendationInfo;

  static Serializer<RecommendationInfo> get serializer => _$recommendationInfoSerializer;
}

abstract class RecipeModel implements Built<RecipeModel, RecipeModelBuilder> {
  @BuiltValueField(wireName: 'service')
  String? get service;

  @BuiltValueField(wireName: 'patient_name')
  String? get patientName;

  @BuiltValueField(wireName: 'datetime')
  String? get datetime;

  @BuiltValueField(wireName: 'address')
  String? get address;

  @BuiltValueField(wireName: 'prescriptions')
  BuiltList<VisitRecipe>? get prescriptions;

  RecipeModel._();

  factory RecipeModel([void Function(RecipeModelBuilder) updates]) = _$RecipeModel;

  static Serializer<RecipeModel> get serializer => _$recipeModelSerializer;
}

abstract class VisitRecipe implements Built<VisitRecipe, VisitRecipeBuilder> {
  @BuiltValueField(wireName: 'visit_prescriptions')
  BuiltList<RecipeDetailModel>? get visitPrescriptions;

  VisitRecipe._();

  factory VisitRecipe([void Function(VisitRecipeBuilder) updates]) = _$VisitRecipe;

  static Serializer<VisitRecipe> get serializer => _$visitRecipeSerializer;
}

abstract class RecipeDetailModel implements Built<RecipeDetailModel, RecipeDetailModelBuilder> {
  @BuiltValueField(wireName: 'name')
  String? get name;

  @BuiltValueField(wireName: 'administration_methods')
  String? get administrationMethods;

  @BuiltValueField(wireName: 'sleep_regarding')
  String? get sleepRegarding;

  @BuiltValueField(wireName: 'food_regarding')
  String? get foodRegarding;

  @BuiltValueField(wireName: 'start_date')
  String? get startDate;

  @BuiltValueField(wireName: 'duration_unit')
  String? get durationUnit;

  @BuiltValueField(wireName: 'notes')
  String? get notes;

  @BuiltValueField(wireName: 'date')
  String? get date;

  @BuiltValueField(wireName: 'reception_time')
  BuiltList<ReceptionTime>? get receptionTime;

  @BuiltValueField(wireName: 'medicines')
  BuiltList<Medicine>? get medicines;

  @BuiltValueField(wireName: 'duration')
  double? get duration;

  @BuiltValueField(wireName: 'reception_per_day')
  double? get receptionPerDay;

  RecipeDetailModel._();

  factory RecipeDetailModel([void Function(RecipeDetailModelBuilder) updates]) = _$RecipeDetailModel;

  static Serializer<RecipeDetailModel> get serializer => _$recipeDetailModelSerializer;
}

abstract class ReceptionTime implements Built<ReceptionTime, ReceptionTimeBuilder> {
  @BuiltValueField(wireName: 'time')
  String? get time;

  ReceptionTime._();

  factory ReceptionTime([void Function(ReceptionTimeBuilder) updates]) = _$ReceptionTime;

  static Serializer<ReceptionTime> get serializer => _$receptionTimeSerializer;
}

abstract class Medicine implements Built<Medicine, MedicineBuilder> {
  @BuiltValueField(wireName: 'medicine')
  String? get medicine;

  @BuiltValueField(wireName: 'dosage')
  double? get dosage;

  @BuiltValueField(wireName: 'type')
  String? get type;

  Medicine._();

  factory Medicine([void Function(MedicineBuilder) updates]) = _$Medicine;

  static Serializer<Medicine> get serializer => _$medicineSerializer;
}
