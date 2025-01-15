import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:medion/domain/models/booking/booking_type_model.dart';
import 'package:medion/domain/models/doctors/doctor_model.dart';
import 'package:medion/domain/models/medical_services/medical_services.dart';
import 'package:medion/domain/models/news_model/news_model.dart';

import 'package:medion/domain/success_model/success_model.dart';
import '../models/auth/auth.dart';

part 'serializer.g.dart';

@SerializersFor([
  VerificationSendReq,
  SuccessModel,
  BookingTypeModel,
  News,
  Service,
  Category,
  CreateInfoReq,
  DoctorCategory,
  DoctorData,
  MedicalServices,
  DiseaseModle,
  AdModel,
])
final Serializers serializers = (_$serializers.toBuilder()
   
      ..addPlugin(StandardJsonPlugin()))
    .build();
