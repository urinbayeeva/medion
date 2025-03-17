import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:medion/domain/models/booking/booking_type_model.dart';
import 'package:medion/domain/models/branch/branch_model.dart';
import 'package:medion/domain/models/doctors/doctor_model.dart';
import 'package:medion/domain/models/medical_services/medical_services.dart';
import 'package:medion/domain/models/news_model/news_model.dart';
import 'package:medion/domain/models/profile/profile_model.dart';
import 'package:medion/domain/models/third_service_model/third_service_model.dart';
import 'package:medion/domain/success_model/response_model.dart';

import 'package:medion/domain/success_model/success_model.dart';
import 'package:medion/domain/upload_image/upload_image.dart';
import '../models/auth/auth.dart';

part 'serializer.g.dart';

@SerializersFor([
  RegisterReq,
  SuccessModel,
  ResponseModel,
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
  PatientInfo,
  GiveSelectedId,
  CreatePatientInfoResponse,
  DoctorCategory,
  DoctorData,
  ImageModel,
  HomepageBookingCategory,
  ErrorResponse,
  MedicalModel,
  HomeMedicalDoctor,
  HomeServiceBooking,
  Service,
  CompanyDoctor,
  Doctor,
  Schedule,
  ScheduleTime,

  //Third Service Models

  DoctorsRequest,
  ThirdBookingDoctorSchedule,
  ThirdBookingDoctor,
  ThirdBookingCompanyDoctor,
  ThirdBookingService,
  CreatePatientBookingReq,
  PatientInfo,

  //Payment Booking

  CreatePatientRequest,
  CreatePatientResponse,
  CreatePatientBookingReq,



  //Branches

  BranchModel,
  AwardsModel,
  EducationModel,
  Course,
  ContentModel,
  ChildContentModel,

  RefreshTokenModel,
  RefreshTokenResponseModel,
  CreatePatientInfoResponse,
  RegistrationResponse,

  //Visit
  VisitModel,

  //Analyse
  PatientAnalysis,

])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
