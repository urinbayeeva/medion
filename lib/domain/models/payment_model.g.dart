// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PaymentResponse> _$paymentResponseSerializer =
    _$PaymentResponseSerializer();
Serializer<DailyTransactions> _$dailyTransactionsSerializer =
    _$DailyTransactionsSerializer();
Serializer<Transactions> _$transactionsSerializer = _$TransactionsSerializer();
Serializer<Payment> _$paymentSerializer = _$PaymentSerializer();
Serializer<Recommendation> _$recommendationSerializer =
    _$RecommendationSerializer();
Serializer<RecommendationInfo> _$recommendationInfoSerializer =
    _$RecommendationInfoSerializer();
Serializer<RecipeModel> _$recipeModelSerializer = _$RecipeModelSerializer();
Serializer<VisitRecipe> _$visitRecipeSerializer = _$VisitRecipeSerializer();
Serializer<RecipeDetailModel> _$recipeDetailModelSerializer =
    _$RecipeDetailModelSerializer();
Serializer<ReceptionTime> _$receptionTimeSerializer =
    _$ReceptionTimeSerializer();
Serializer<Medicine> _$medicineSerializer = _$MedicineSerializer();

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
      'payment_history',
      serializers.serialize(object.payments,
          specifiedType: const FullType(
              BuiltList, const [const FullType(DailyTransactions)])),
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
    final result = PaymentResponseBuilder();

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
        case 'payment_history':
          result.payments.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(DailyTransactions)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$DailyTransactionsSerializer
    implements StructuredSerializer<DailyTransactions> {
  @override
  final Iterable<Type> types = const [DailyTransactions, _$DailyTransactions];
  @override
  final String wireName = 'DailyTransactions';

  @override
  Iterable<Object?> serialize(Serializers serializers, DailyTransactions object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'transactions',
      serializers.serialize(object.transactions,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Transactions)])),
    ];
    Object? value;
    value = object.date;
    if (value != null) {
      result
        ..add('date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.totalAmount;
    if (value != null) {
      result
        ..add('total_amount')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  DailyTransactions deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = DailyTransactionsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'total_amount':
          result.totalAmount = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'transactions':
          result.transactions.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Transactions)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$TransactionsSerializer implements StructuredSerializer<Transactions> {
  @override
  final Iterable<Type> types = const [Transactions, _$Transactions];
  @override
  final String wireName = 'Transactions';

  @override
  Iterable<Object?> serialize(Serializers serializers, Transactions object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.dateTime;
    if (value != null) {
      result
        ..add('datetime')
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
    value = object.currency;
    if (value != null) {
      result
        ..add('currency')
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
    value = object.invoiceName;
    if (value != null) {
      result
        ..add('invoice_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.cashier;
    if (value != null) {
      result
        ..add('cashier')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.paymentCheck;
    if (value != null) {
      result
        ..add('payment_check')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.fiscalCheck;
    if (value != null) {
      result
        ..add('fiscal_check')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isIncome;
    if (value != null) {
      result
        ..add('is_income')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.amount;
    if (value != null) {
      result
        ..add('amount')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.accountNumber;
    if (value != null) {
      result
        ..add('account_number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Transactions deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = TransactionsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'datetime':
          result.dateTime = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'currency':
          result.currency = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'payment_method':
          result.paymentMethod = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'invoice_name':
          result.invoiceName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'cashier':
          result.cashier = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'payment_check':
          result.paymentCheck = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'fiscal_check':
          result.fiscalCheck = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'is_income':
          result.isIncome = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'amount':
          result.amount = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'account_number':
          result.accountNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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
    final result = PaymentBuilder();

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

class _$RecommendationSerializer
    implements StructuredSerializer<Recommendation> {
  @override
  final Iterable<Type> types = const [Recommendation, _$Recommendation];
  @override
  final String wireName = 'Recommendation';

  @override
  Iterable<Object?> serialize(Serializers serializers, Recommendation object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.datetime;
    if (value != null) {
      result
        ..add('datetime')
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
    value = object.doctorName;
    if (value != null) {
      result
        ..add('doctor_name')
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
    value = object.recommendations;
    if (value != null) {
      result
        ..add('recommendations')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(RecommendationInfo)])));
    }
    return result;
  }

  @override
  Recommendation deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = RecommendationBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'datetime':
          result.datetime = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'service_name':
          result.serviceName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'doctor_name':
          result.doctorName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'recommendations':
          result.recommendations.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(RecommendationInfo)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$RecommendationInfoSerializer
    implements StructuredSerializer<RecommendationInfo> {
  @override
  final Iterable<Type> types = const [RecommendationInfo, _$RecommendationInfo];
  @override
  final String wireName = 'RecommendationInfo';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, RecommendationInfo object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.serviceId;
    if (value != null) {
      result
        ..add('service_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.serviceName;
    if (value != null) {
      result
        ..add('service_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.doctorId;
    if (value != null) {
      result
        ..add('doctor_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.price;
    if (value != null) {
      result
        ..add('price')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.orderDetailId;
    if (value != null) {
      result
        ..add('order_detail_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  RecommendationInfo deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = RecommendationInfoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'service_id':
          result.serviceId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'service_name':
          result.serviceName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'doctor_id':
          result.doctorId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'order_detail_id':
          result.orderDetailId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$RecipeModelSerializer implements StructuredSerializer<RecipeModel> {
  @override
  final Iterable<Type> types = const [RecipeModel, _$RecipeModel];
  @override
  final String wireName = 'RecipeModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, RecipeModel object,
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
    value = object.patientName;
    if (value != null) {
      result
        ..add('patient_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.datetime;
    if (value != null) {
      result
        ..add('datetime')
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
    value = object.prescriptions;
    if (value != null) {
      result
        ..add('prescriptions')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(VisitRecipe)])));
    }
    return result;
  }

  @override
  RecipeModel deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = RecipeModelBuilder();

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
        case 'patient_name':
          result.patientName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'datetime':
          result.datetime = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'prescriptions':
          result.prescriptions.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(VisitRecipe)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$VisitRecipeSerializer implements StructuredSerializer<VisitRecipe> {
  @override
  final Iterable<Type> types = const [VisitRecipe, _$VisitRecipe];
  @override
  final String wireName = 'VisitRecipe';

  @override
  Iterable<Object?> serialize(Serializers serializers, VisitRecipe object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.visitPrescriptions;
    if (value != null) {
      result
        ..add('visit_prescriptions')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(RecipeDetailModel)])));
    }
    return result;
  }

  @override
  VisitRecipe deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = VisitRecipeBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'visit_prescriptions':
          result.visitPrescriptions.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(RecipeDetailModel)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$RecipeDetailModelSerializer
    implements StructuredSerializer<RecipeDetailModel> {
  @override
  final Iterable<Type> types = const [RecipeDetailModel, _$RecipeDetailModel];
  @override
  final String wireName = 'RecipeDetailModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, RecipeDetailModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.administrationMethods;
    if (value != null) {
      result
        ..add('administration_methods')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.sleepRegarding;
    if (value != null) {
      result
        ..add('sleep_regarding')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.foodRegarding;
    if (value != null) {
      result
        ..add('food_regarding')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.startDate;
    if (value != null) {
      result
        ..add('start_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.durationUnit;
    if (value != null) {
      result
        ..add('duration_unit')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.notes;
    if (value != null) {
      result
        ..add('notes')
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
    value = object.receptionTime;
    if (value != null) {
      result
        ..add('reception_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(ReceptionTime)])));
    }
    value = object.medicines;
    if (value != null) {
      result
        ..add('medicines')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(Medicine)])));
    }
    value = object.duration;
    if (value != null) {
      result
        ..add('duration')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.receptionPerDay;
    if (value != null) {
      result
        ..add('reception_per_day')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  RecipeDetailModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = RecipeDetailModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'administration_methods':
          result.administrationMethods = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'sleep_regarding':
          result.sleepRegarding = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'food_regarding':
          result.foodRegarding = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'start_date':
          result.startDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'duration_unit':
          result.durationUnit = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'notes':
          result.notes = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'reception_time':
          result.receptionTime.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ReceptionTime)]))!
              as BuiltList<Object?>);
          break;
        case 'medicines':
          result.medicines.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Medicine)]))!
              as BuiltList<Object?>);
          break;
        case 'duration':
          result.duration = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'reception_per_day':
          result.receptionPerDay = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
      }
    }

    return result.build();
  }
}

class _$ReceptionTimeSerializer implements StructuredSerializer<ReceptionTime> {
  @override
  final Iterable<Type> types = const [ReceptionTime, _$ReceptionTime];
  @override
  final String wireName = 'ReceptionTime';

  @override
  Iterable<Object?> serialize(Serializers serializers, ReceptionTime object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.time;
    if (value != null) {
      result
        ..add('time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  ReceptionTime deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ReceptionTimeBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'time':
          result.time = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$MedicineSerializer implements StructuredSerializer<Medicine> {
  @override
  final Iterable<Type> types = const [Medicine, _$Medicine];
  @override
  final String wireName = 'Medicine';

  @override
  Iterable<Object?> serialize(Serializers serializers, Medicine object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.medicine;
    if (value != null) {
      result
        ..add('medicine')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.dosage;
    if (value != null) {
      result
        ..add('dosage')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Medicine deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = MedicineBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'medicine':
          result.medicine = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'dosage':
          result.dosage = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
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
  final BuiltList<DailyTransactions> payments;

  factory _$PaymentResponse([void Function(PaymentResponseBuilder)? updates]) =>
      (PaymentResponseBuilder()..update(updates))._build();

  _$PaymentResponse._(
      {this.patientBalance,
      this.patientDeposit,
      this.patientDebit,
      required this.payments})
      : super._();
  @override
  PaymentResponse rebuild(void Function(PaymentResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PaymentResponseBuilder toBuilder() => PaymentResponseBuilder()..replace(this);

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

  ListBuilder<DailyTransactions>? _payments;
  ListBuilder<DailyTransactions> get payments =>
      _$this._payments ??= ListBuilder<DailyTransactions>();
  set payments(ListBuilder<DailyTransactions>? payments) =>
      _$this._payments = payments;

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
          _$PaymentResponse._(
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
        throw BuiltValueNestedFieldError(
            r'PaymentResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$DailyTransactions extends DailyTransactions {
  @override
  final String? date;
  @override
  final double? totalAmount;
  @override
  final BuiltList<Transactions> transactions;

  factory _$DailyTransactions(
          [void Function(DailyTransactionsBuilder)? updates]) =>
      (DailyTransactionsBuilder()..update(updates))._build();

  _$DailyTransactions._(
      {this.date, this.totalAmount, required this.transactions})
      : super._();
  @override
  DailyTransactions rebuild(void Function(DailyTransactionsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DailyTransactionsBuilder toBuilder() =>
      DailyTransactionsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DailyTransactions &&
        date == other.date &&
        totalAmount == other.totalAmount &&
        transactions == other.transactions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, date.hashCode);
    _$hash = $jc(_$hash, totalAmount.hashCode);
    _$hash = $jc(_$hash, transactions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DailyTransactions')
          ..add('date', date)
          ..add('totalAmount', totalAmount)
          ..add('transactions', transactions))
        .toString();
  }
}

class DailyTransactionsBuilder
    implements Builder<DailyTransactions, DailyTransactionsBuilder> {
  _$DailyTransactions? _$v;

  String? _date;
  String? get date => _$this._date;
  set date(String? date) => _$this._date = date;

  double? _totalAmount;
  double? get totalAmount => _$this._totalAmount;
  set totalAmount(double? totalAmount) => _$this._totalAmount = totalAmount;

  ListBuilder<Transactions>? _transactions;
  ListBuilder<Transactions> get transactions =>
      _$this._transactions ??= ListBuilder<Transactions>();
  set transactions(ListBuilder<Transactions>? transactions) =>
      _$this._transactions = transactions;

  DailyTransactionsBuilder();

  DailyTransactionsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _date = $v.date;
      _totalAmount = $v.totalAmount;
      _transactions = $v.transactions.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DailyTransactions other) {
    _$v = other as _$DailyTransactions;
  }

  @override
  void update(void Function(DailyTransactionsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DailyTransactions build() => _build();

  _$DailyTransactions _build() {
    _$DailyTransactions _$result;
    try {
      _$result = _$v ??
          _$DailyTransactions._(
            date: date,
            totalAmount: totalAmount,
            transactions: transactions.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'transactions';
        transactions.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'DailyTransactions', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Transactions extends Transactions {
  @override
  final String? dateTime;
  @override
  final String? name;
  @override
  final String? currency;
  @override
  final String? paymentMethod;
  @override
  final String? invoiceName;
  @override
  final String? cashier;
  @override
  final String? status;
  @override
  final String? paymentCheck;
  @override
  final String? fiscalCheck;
  @override
  final bool? isIncome;
  @override
  final double? amount;
  @override
  final String? accountNumber;

  factory _$Transactions([void Function(TransactionsBuilder)? updates]) =>
      (TransactionsBuilder()..update(updates))._build();

  _$Transactions._(
      {this.dateTime,
      this.name,
      this.currency,
      this.paymentMethod,
      this.invoiceName,
      this.cashier,
      this.status,
      this.paymentCheck,
      this.fiscalCheck,
      this.isIncome,
      this.amount,
      this.accountNumber})
      : super._();
  @override
  Transactions rebuild(void Function(TransactionsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TransactionsBuilder toBuilder() => TransactionsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Transactions &&
        dateTime == other.dateTime &&
        name == other.name &&
        currency == other.currency &&
        paymentMethod == other.paymentMethod &&
        invoiceName == other.invoiceName &&
        cashier == other.cashier &&
        status == other.status &&
        paymentCheck == other.paymentCheck &&
        fiscalCheck == other.fiscalCheck &&
        isIncome == other.isIncome &&
        amount == other.amount &&
        accountNumber == other.accountNumber;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, dateTime.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, currency.hashCode);
    _$hash = $jc(_$hash, paymentMethod.hashCode);
    _$hash = $jc(_$hash, invoiceName.hashCode);
    _$hash = $jc(_$hash, cashier.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, paymentCheck.hashCode);
    _$hash = $jc(_$hash, fiscalCheck.hashCode);
    _$hash = $jc(_$hash, isIncome.hashCode);
    _$hash = $jc(_$hash, amount.hashCode);
    _$hash = $jc(_$hash, accountNumber.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Transactions')
          ..add('dateTime', dateTime)
          ..add('name', name)
          ..add('currency', currency)
          ..add('paymentMethod', paymentMethod)
          ..add('invoiceName', invoiceName)
          ..add('cashier', cashier)
          ..add('status', status)
          ..add('paymentCheck', paymentCheck)
          ..add('fiscalCheck', fiscalCheck)
          ..add('isIncome', isIncome)
          ..add('amount', amount)
          ..add('accountNumber', accountNumber))
        .toString();
  }
}

class TransactionsBuilder
    implements Builder<Transactions, TransactionsBuilder> {
  _$Transactions? _$v;

  String? _dateTime;
  String? get dateTime => _$this._dateTime;
  set dateTime(String? dateTime) => _$this._dateTime = dateTime;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _currency;
  String? get currency => _$this._currency;
  set currency(String? currency) => _$this._currency = currency;

  String? _paymentMethod;
  String? get paymentMethod => _$this._paymentMethod;
  set paymentMethod(String? paymentMethod) =>
      _$this._paymentMethod = paymentMethod;

  String? _invoiceName;
  String? get invoiceName => _$this._invoiceName;
  set invoiceName(String? invoiceName) => _$this._invoiceName = invoiceName;

  String? _cashier;
  String? get cashier => _$this._cashier;
  set cashier(String? cashier) => _$this._cashier = cashier;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  String? _paymentCheck;
  String? get paymentCheck => _$this._paymentCheck;
  set paymentCheck(String? paymentCheck) => _$this._paymentCheck = paymentCheck;

  String? _fiscalCheck;
  String? get fiscalCheck => _$this._fiscalCheck;
  set fiscalCheck(String? fiscalCheck) => _$this._fiscalCheck = fiscalCheck;

  bool? _isIncome;
  bool? get isIncome => _$this._isIncome;
  set isIncome(bool? isIncome) => _$this._isIncome = isIncome;

  double? _amount;
  double? get amount => _$this._amount;
  set amount(double? amount) => _$this._amount = amount;

  String? _accountNumber;
  String? get accountNumber => _$this._accountNumber;
  set accountNumber(String? accountNumber) =>
      _$this._accountNumber = accountNumber;

  TransactionsBuilder();

  TransactionsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _dateTime = $v.dateTime;
      _name = $v.name;
      _currency = $v.currency;
      _paymentMethod = $v.paymentMethod;
      _invoiceName = $v.invoiceName;
      _cashier = $v.cashier;
      _status = $v.status;
      _paymentCheck = $v.paymentCheck;
      _fiscalCheck = $v.fiscalCheck;
      _isIncome = $v.isIncome;
      _amount = $v.amount;
      _accountNumber = $v.accountNumber;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Transactions other) {
    _$v = other as _$Transactions;
  }

  @override
  void update(void Function(TransactionsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Transactions build() => _build();

  _$Transactions _build() {
    final _$result = _$v ??
        _$Transactions._(
          dateTime: dateTime,
          name: name,
          currency: currency,
          paymentMethod: paymentMethod,
          invoiceName: invoiceName,
          cashier: cashier,
          status: status,
          paymentCheck: paymentCheck,
          fiscalCheck: fiscalCheck,
          isIncome: isIncome,
          amount: amount,
          accountNumber: accountNumber,
        );
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
      (PaymentBuilder()..update(updates))._build();

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
  PaymentBuilder toBuilder() => PaymentBuilder()..replace(this);

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
        _$Payment._(
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

class _$Recommendation extends Recommendation {
  @override
  final String? datetime;
  @override
  final String? serviceName;
  @override
  final String? doctorName;
  @override
  final String? address;
  @override
  final BuiltList<RecommendationInfo>? recommendations;

  factory _$Recommendation([void Function(RecommendationBuilder)? updates]) =>
      (RecommendationBuilder()..update(updates))._build();

  _$Recommendation._(
      {this.datetime,
      this.serviceName,
      this.doctorName,
      this.address,
      this.recommendations})
      : super._();
  @override
  Recommendation rebuild(void Function(RecommendationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RecommendationBuilder toBuilder() => RecommendationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Recommendation &&
        datetime == other.datetime &&
        serviceName == other.serviceName &&
        doctorName == other.doctorName &&
        address == other.address &&
        recommendations == other.recommendations;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, datetime.hashCode);
    _$hash = $jc(_$hash, serviceName.hashCode);
    _$hash = $jc(_$hash, doctorName.hashCode);
    _$hash = $jc(_$hash, address.hashCode);
    _$hash = $jc(_$hash, recommendations.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Recommendation')
          ..add('datetime', datetime)
          ..add('serviceName', serviceName)
          ..add('doctorName', doctorName)
          ..add('address', address)
          ..add('recommendations', recommendations))
        .toString();
  }
}

class RecommendationBuilder
    implements Builder<Recommendation, RecommendationBuilder> {
  _$Recommendation? _$v;

  String? _datetime;
  String? get datetime => _$this._datetime;
  set datetime(String? datetime) => _$this._datetime = datetime;

  String? _serviceName;
  String? get serviceName => _$this._serviceName;
  set serviceName(String? serviceName) => _$this._serviceName = serviceName;

  String? _doctorName;
  String? get doctorName => _$this._doctorName;
  set doctorName(String? doctorName) => _$this._doctorName = doctorName;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  ListBuilder<RecommendationInfo>? _recommendations;
  ListBuilder<RecommendationInfo> get recommendations =>
      _$this._recommendations ??= ListBuilder<RecommendationInfo>();
  set recommendations(ListBuilder<RecommendationInfo>? recommendations) =>
      _$this._recommendations = recommendations;

  RecommendationBuilder();

  RecommendationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _datetime = $v.datetime;
      _serviceName = $v.serviceName;
      _doctorName = $v.doctorName;
      _address = $v.address;
      _recommendations = $v.recommendations?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Recommendation other) {
    _$v = other as _$Recommendation;
  }

  @override
  void update(void Function(RecommendationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Recommendation build() => _build();

  _$Recommendation _build() {
    _$Recommendation _$result;
    try {
      _$result = _$v ??
          _$Recommendation._(
            datetime: datetime,
            serviceName: serviceName,
            doctorName: doctorName,
            address: address,
            recommendations: _recommendations?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'recommendations';
        _recommendations?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'Recommendation', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$RecommendationInfo extends RecommendationInfo {
  @override
  final int? serviceId;
  @override
  final String? serviceName;
  @override
  final int? doctorId;
  @override
  final double? price;
  @override
  final int? orderDetailId;

  factory _$RecommendationInfo(
          [void Function(RecommendationInfoBuilder)? updates]) =>
      (RecommendationInfoBuilder()..update(updates))._build();

  _$RecommendationInfo._(
      {this.serviceId,
      this.serviceName,
      this.doctorId,
      this.price,
      this.orderDetailId})
      : super._();
  @override
  RecommendationInfo rebuild(
          void Function(RecommendationInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RecommendationInfoBuilder toBuilder() =>
      RecommendationInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RecommendationInfo &&
        serviceId == other.serviceId &&
        serviceName == other.serviceName &&
        doctorId == other.doctorId &&
        price == other.price &&
        orderDetailId == other.orderDetailId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, serviceId.hashCode);
    _$hash = $jc(_$hash, serviceName.hashCode);
    _$hash = $jc(_$hash, doctorId.hashCode);
    _$hash = $jc(_$hash, price.hashCode);
    _$hash = $jc(_$hash, orderDetailId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RecommendationInfo')
          ..add('serviceId', serviceId)
          ..add('serviceName', serviceName)
          ..add('doctorId', doctorId)
          ..add('price', price)
          ..add('orderDetailId', orderDetailId))
        .toString();
  }
}

class RecommendationInfoBuilder
    implements Builder<RecommendationInfo, RecommendationInfoBuilder> {
  _$RecommendationInfo? _$v;

  int? _serviceId;
  int? get serviceId => _$this._serviceId;
  set serviceId(int? serviceId) => _$this._serviceId = serviceId;

  String? _serviceName;
  String? get serviceName => _$this._serviceName;
  set serviceName(String? serviceName) => _$this._serviceName = serviceName;

  int? _doctorId;
  int? get doctorId => _$this._doctorId;
  set doctorId(int? doctorId) => _$this._doctorId = doctorId;

  double? _price;
  double? get price => _$this._price;
  set price(double? price) => _$this._price = price;

  int? _orderDetailId;
  int? get orderDetailId => _$this._orderDetailId;
  set orderDetailId(int? orderDetailId) =>
      _$this._orderDetailId = orderDetailId;

  RecommendationInfoBuilder();

  RecommendationInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _serviceId = $v.serviceId;
      _serviceName = $v.serviceName;
      _doctorId = $v.doctorId;
      _price = $v.price;
      _orderDetailId = $v.orderDetailId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RecommendationInfo other) {
    _$v = other as _$RecommendationInfo;
  }

  @override
  void update(void Function(RecommendationInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RecommendationInfo build() => _build();

  _$RecommendationInfo _build() {
    final _$result = _$v ??
        _$RecommendationInfo._(
          serviceId: serviceId,
          serviceName: serviceName,
          doctorId: doctorId,
          price: price,
          orderDetailId: orderDetailId,
        );
    replace(_$result);
    return _$result;
  }
}

class _$RecipeModel extends RecipeModel {
  @override
  final String? service;
  @override
  final String? patientName;
  @override
  final String? datetime;
  @override
  final String? address;
  @override
  final BuiltList<VisitRecipe>? prescriptions;

  factory _$RecipeModel([void Function(RecipeModelBuilder)? updates]) =>
      (RecipeModelBuilder()..update(updates))._build();

  _$RecipeModel._(
      {this.service,
      this.patientName,
      this.datetime,
      this.address,
      this.prescriptions})
      : super._();
  @override
  RecipeModel rebuild(void Function(RecipeModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RecipeModelBuilder toBuilder() => RecipeModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RecipeModel &&
        service == other.service &&
        patientName == other.patientName &&
        datetime == other.datetime &&
        address == other.address &&
        prescriptions == other.prescriptions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, service.hashCode);
    _$hash = $jc(_$hash, patientName.hashCode);
    _$hash = $jc(_$hash, datetime.hashCode);
    _$hash = $jc(_$hash, address.hashCode);
    _$hash = $jc(_$hash, prescriptions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RecipeModel')
          ..add('service', service)
          ..add('patientName', patientName)
          ..add('datetime', datetime)
          ..add('address', address)
          ..add('prescriptions', prescriptions))
        .toString();
  }
}

class RecipeModelBuilder implements Builder<RecipeModel, RecipeModelBuilder> {
  _$RecipeModel? _$v;

  String? _service;
  String? get service => _$this._service;
  set service(String? service) => _$this._service = service;

  String? _patientName;
  String? get patientName => _$this._patientName;
  set patientName(String? patientName) => _$this._patientName = patientName;

  String? _datetime;
  String? get datetime => _$this._datetime;
  set datetime(String? datetime) => _$this._datetime = datetime;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  ListBuilder<VisitRecipe>? _prescriptions;
  ListBuilder<VisitRecipe> get prescriptions =>
      _$this._prescriptions ??= ListBuilder<VisitRecipe>();
  set prescriptions(ListBuilder<VisitRecipe>? prescriptions) =>
      _$this._prescriptions = prescriptions;

  RecipeModelBuilder();

  RecipeModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _service = $v.service;
      _patientName = $v.patientName;
      _datetime = $v.datetime;
      _address = $v.address;
      _prescriptions = $v.prescriptions?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RecipeModel other) {
    _$v = other as _$RecipeModel;
  }

  @override
  void update(void Function(RecipeModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RecipeModel build() => _build();

  _$RecipeModel _build() {
    _$RecipeModel _$result;
    try {
      _$result = _$v ??
          _$RecipeModel._(
            service: service,
            patientName: patientName,
            datetime: datetime,
            address: address,
            prescriptions: _prescriptions?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'prescriptions';
        _prescriptions?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'RecipeModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$VisitRecipe extends VisitRecipe {
  @override
  final BuiltList<RecipeDetailModel>? visitPrescriptions;

  factory _$VisitRecipe([void Function(VisitRecipeBuilder)? updates]) =>
      (VisitRecipeBuilder()..update(updates))._build();

  _$VisitRecipe._({this.visitPrescriptions}) : super._();
  @override
  VisitRecipe rebuild(void Function(VisitRecipeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VisitRecipeBuilder toBuilder() => VisitRecipeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VisitRecipe &&
        visitPrescriptions == other.visitPrescriptions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, visitPrescriptions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'VisitRecipe')
          ..add('visitPrescriptions', visitPrescriptions))
        .toString();
  }
}

class VisitRecipeBuilder implements Builder<VisitRecipe, VisitRecipeBuilder> {
  _$VisitRecipe? _$v;

  ListBuilder<RecipeDetailModel>? _visitPrescriptions;
  ListBuilder<RecipeDetailModel> get visitPrescriptions =>
      _$this._visitPrescriptions ??= ListBuilder<RecipeDetailModel>();
  set visitPrescriptions(ListBuilder<RecipeDetailModel>? visitPrescriptions) =>
      _$this._visitPrescriptions = visitPrescriptions;

  VisitRecipeBuilder();

  VisitRecipeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _visitPrescriptions = $v.visitPrescriptions?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VisitRecipe other) {
    _$v = other as _$VisitRecipe;
  }

  @override
  void update(void Function(VisitRecipeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  VisitRecipe build() => _build();

  _$VisitRecipe _build() {
    _$VisitRecipe _$result;
    try {
      _$result = _$v ??
          _$VisitRecipe._(
            visitPrescriptions: _visitPrescriptions?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'visitPrescriptions';
        _visitPrescriptions?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'VisitRecipe', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$RecipeDetailModel extends RecipeDetailModel {
  @override
  final String? name;
  @override
  final String? administrationMethods;
  @override
  final String? sleepRegarding;
  @override
  final String? foodRegarding;
  @override
  final String? startDate;
  @override
  final String? durationUnit;
  @override
  final String? notes;
  @override
  final String? date;
  @override
  final BuiltList<ReceptionTime>? receptionTime;
  @override
  final BuiltList<Medicine>? medicines;
  @override
  final double? duration;
  @override
  final double? receptionPerDay;

  factory _$RecipeDetailModel(
          [void Function(RecipeDetailModelBuilder)? updates]) =>
      (RecipeDetailModelBuilder()..update(updates))._build();

  _$RecipeDetailModel._(
      {this.name,
      this.administrationMethods,
      this.sleepRegarding,
      this.foodRegarding,
      this.startDate,
      this.durationUnit,
      this.notes,
      this.date,
      this.receptionTime,
      this.medicines,
      this.duration,
      this.receptionPerDay})
      : super._();
  @override
  RecipeDetailModel rebuild(void Function(RecipeDetailModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RecipeDetailModelBuilder toBuilder() =>
      RecipeDetailModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RecipeDetailModel &&
        name == other.name &&
        administrationMethods == other.administrationMethods &&
        sleepRegarding == other.sleepRegarding &&
        foodRegarding == other.foodRegarding &&
        startDate == other.startDate &&
        durationUnit == other.durationUnit &&
        notes == other.notes &&
        date == other.date &&
        receptionTime == other.receptionTime &&
        medicines == other.medicines &&
        duration == other.duration &&
        receptionPerDay == other.receptionPerDay;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, administrationMethods.hashCode);
    _$hash = $jc(_$hash, sleepRegarding.hashCode);
    _$hash = $jc(_$hash, foodRegarding.hashCode);
    _$hash = $jc(_$hash, startDate.hashCode);
    _$hash = $jc(_$hash, durationUnit.hashCode);
    _$hash = $jc(_$hash, notes.hashCode);
    _$hash = $jc(_$hash, date.hashCode);
    _$hash = $jc(_$hash, receptionTime.hashCode);
    _$hash = $jc(_$hash, medicines.hashCode);
    _$hash = $jc(_$hash, duration.hashCode);
    _$hash = $jc(_$hash, receptionPerDay.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RecipeDetailModel')
          ..add('name', name)
          ..add('administrationMethods', administrationMethods)
          ..add('sleepRegarding', sleepRegarding)
          ..add('foodRegarding', foodRegarding)
          ..add('startDate', startDate)
          ..add('durationUnit', durationUnit)
          ..add('notes', notes)
          ..add('date', date)
          ..add('receptionTime', receptionTime)
          ..add('medicines', medicines)
          ..add('duration', duration)
          ..add('receptionPerDay', receptionPerDay))
        .toString();
  }
}

class RecipeDetailModelBuilder
    implements Builder<RecipeDetailModel, RecipeDetailModelBuilder> {
  _$RecipeDetailModel? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _administrationMethods;
  String? get administrationMethods => _$this._administrationMethods;
  set administrationMethods(String? administrationMethods) =>
      _$this._administrationMethods = administrationMethods;

  String? _sleepRegarding;
  String? get sleepRegarding => _$this._sleepRegarding;
  set sleepRegarding(String? sleepRegarding) =>
      _$this._sleepRegarding = sleepRegarding;

  String? _foodRegarding;
  String? get foodRegarding => _$this._foodRegarding;
  set foodRegarding(String? foodRegarding) =>
      _$this._foodRegarding = foodRegarding;

  String? _startDate;
  String? get startDate => _$this._startDate;
  set startDate(String? startDate) => _$this._startDate = startDate;

  String? _durationUnit;
  String? get durationUnit => _$this._durationUnit;
  set durationUnit(String? durationUnit) => _$this._durationUnit = durationUnit;

  String? _notes;
  String? get notes => _$this._notes;
  set notes(String? notes) => _$this._notes = notes;

  String? _date;
  String? get date => _$this._date;
  set date(String? date) => _$this._date = date;

  ListBuilder<ReceptionTime>? _receptionTime;
  ListBuilder<ReceptionTime> get receptionTime =>
      _$this._receptionTime ??= ListBuilder<ReceptionTime>();
  set receptionTime(ListBuilder<ReceptionTime>? receptionTime) =>
      _$this._receptionTime = receptionTime;

  ListBuilder<Medicine>? _medicines;
  ListBuilder<Medicine> get medicines =>
      _$this._medicines ??= ListBuilder<Medicine>();
  set medicines(ListBuilder<Medicine>? medicines) =>
      _$this._medicines = medicines;

  double? _duration;
  double? get duration => _$this._duration;
  set duration(double? duration) => _$this._duration = duration;

  double? _receptionPerDay;
  double? get receptionPerDay => _$this._receptionPerDay;
  set receptionPerDay(double? receptionPerDay) =>
      _$this._receptionPerDay = receptionPerDay;

  RecipeDetailModelBuilder();

  RecipeDetailModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _administrationMethods = $v.administrationMethods;
      _sleepRegarding = $v.sleepRegarding;
      _foodRegarding = $v.foodRegarding;
      _startDate = $v.startDate;
      _durationUnit = $v.durationUnit;
      _notes = $v.notes;
      _date = $v.date;
      _receptionTime = $v.receptionTime?.toBuilder();
      _medicines = $v.medicines?.toBuilder();
      _duration = $v.duration;
      _receptionPerDay = $v.receptionPerDay;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RecipeDetailModel other) {
    _$v = other as _$RecipeDetailModel;
  }

  @override
  void update(void Function(RecipeDetailModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RecipeDetailModel build() => _build();

  _$RecipeDetailModel _build() {
    _$RecipeDetailModel _$result;
    try {
      _$result = _$v ??
          _$RecipeDetailModel._(
            name: name,
            administrationMethods: administrationMethods,
            sleepRegarding: sleepRegarding,
            foodRegarding: foodRegarding,
            startDate: startDate,
            durationUnit: durationUnit,
            notes: notes,
            date: date,
            receptionTime: _receptionTime?.build(),
            medicines: _medicines?.build(),
            duration: duration,
            receptionPerDay: receptionPerDay,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'receptionTime';
        _receptionTime?.build();
        _$failedField = 'medicines';
        _medicines?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'RecipeDetailModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ReceptionTime extends ReceptionTime {
  @override
  final String? time;

  factory _$ReceptionTime([void Function(ReceptionTimeBuilder)? updates]) =>
      (ReceptionTimeBuilder()..update(updates))._build();

  _$ReceptionTime._({this.time}) : super._();
  @override
  ReceptionTime rebuild(void Function(ReceptionTimeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReceptionTimeBuilder toBuilder() => ReceptionTimeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReceptionTime && time == other.time;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, time.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReceptionTime')..add('time', time))
        .toString();
  }
}

class ReceptionTimeBuilder
    implements Builder<ReceptionTime, ReceptionTimeBuilder> {
  _$ReceptionTime? _$v;

  String? _time;
  String? get time => _$this._time;
  set time(String? time) => _$this._time = time;

  ReceptionTimeBuilder();

  ReceptionTimeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _time = $v.time;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReceptionTime other) {
    _$v = other as _$ReceptionTime;
  }

  @override
  void update(void Function(ReceptionTimeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReceptionTime build() => _build();

  _$ReceptionTime _build() {
    final _$result = _$v ??
        _$ReceptionTime._(
          time: time,
        );
    replace(_$result);
    return _$result;
  }
}

class _$Medicine extends Medicine {
  @override
  final String? medicine;
  @override
  final double? dosage;
  @override
  final String? type;

  factory _$Medicine([void Function(MedicineBuilder)? updates]) =>
      (MedicineBuilder()..update(updates))._build();

  _$Medicine._({this.medicine, this.dosage, this.type}) : super._();
  @override
  Medicine rebuild(void Function(MedicineBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MedicineBuilder toBuilder() => MedicineBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Medicine &&
        medicine == other.medicine &&
        dosage == other.dosage &&
        type == other.type;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, medicine.hashCode);
    _$hash = $jc(_$hash, dosage.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Medicine')
          ..add('medicine', medicine)
          ..add('dosage', dosage)
          ..add('type', type))
        .toString();
  }
}

class MedicineBuilder implements Builder<Medicine, MedicineBuilder> {
  _$Medicine? _$v;

  String? _medicine;
  String? get medicine => _$this._medicine;
  set medicine(String? medicine) => _$this._medicine = medicine;

  double? _dosage;
  double? get dosage => _$this._dosage;
  set dosage(double? dosage) => _$this._dosage = dosage;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  MedicineBuilder();

  MedicineBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _medicine = $v.medicine;
      _dosage = $v.dosage;
      _type = $v.type;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Medicine other) {
    _$v = other as _$Medicine;
  }

  @override
  void update(void Function(MedicineBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Medicine build() => _build();

  _$Medicine _build() {
    final _$result = _$v ??
        _$Medicine._(
          medicine: medicine,
          dosage: dosage,
          type: type,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
