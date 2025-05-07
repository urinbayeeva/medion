library visit_response;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'visit_new_model.g.dart';

abstract class VisitResponse
    implements Built<VisitResponse, VisitResponseBuilder> {
  @BuiltValueField(wireName: 'status')
  String get status;

  @BuiltValueField(wireName: 'visits')
  BuiltList<Visit> get visits;

  VisitResponse._();
  factory VisitResponse([void Function(VisitResponseBuilder) updates]) =
      _$VisitResponse;

  static Serializer<VisitResponse> get serializer => _$visitResponseSerializer;
}

abstract class Visit implements Built<Visit, VisitBuilder> {
  @BuiltValueField(wireName: 'visit_id')
  int get visitId;

  @BuiltValueField(wireName: 'date')
  String get date;

  @BuiltValueField(wireName: 'doctor_name')
  String get doctorName;

  @BuiltValueField(wireName: 'speciality')
  String get speciality;

  @BuiltValueField(wireName: 'clinic_name')
  String get clinicName;

  @BuiltValueField(wireName: 'invoice_url')
  String? get invoiceUrl;

  @BuiltValueField(wireName: 'pdf_url')
  String? get pdfUrl;

  Visit._();
  factory Visit([void Function(VisitBuilder) updates]) = _$Visit;

  static Serializer<Visit> get serializer => _$visitSerializer;
}
