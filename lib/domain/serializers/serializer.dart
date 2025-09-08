import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:medion/domain/models/auth/auth.dart';
import 'package:medion/domain/models/booking/booking_type_model.dart';
import 'package:medion/domain/models/branch/branch_model.dart';
import 'package:medion/domain/models/doctors/doctor_model.dart';
import 'package:medion/domain/models/map/map_model.dart';
import 'package:medion/domain/models/medical_services/medical_services.dart';
import 'package:medion/domain/models/news_model/news_model.dart';
import 'package:medion/domain/models/notification/notification_model.dart';
import 'package:medion/domain/models/payment_model.dart';
import 'package:medion/domain/models/profile/profile_model.dart';
import 'package:medion/domain/models/recruitment/recruitment_model.dart';
import 'package:medion/domain/models/search/search_model.dart';
import 'package:medion/domain/models/team/team_model.dart';
import 'package:medion/domain/models/third_service_model/third_service_model.dart';
import 'package:medion/domain/models/visit/visit_model.dart';
import 'package:medion/domain/models/visit/visit_new_model.dart';
import 'package:medion/domain/success_model/response_model.dart';
import 'package:medion/domain/success_model/success_model.dart';

import 'package:medion/domain/upload_image/upload_image.dart';

part 'serializer.g.dart';

@SerializersFor([
  RegisterReq,
  SuccessModel,
  ResponseModel,
  BookingTypeModel,
  PhoneNumberSendReq,
  News,
  Service,
  Category,
  CreateInfoReq,
  DoctorCategory,
  DoctorData,
  DiagnosticsModel,
  DiseaseModle,
  AdModel,
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
  ModelDoctor,
  WorkSchedule,
  ScheduleItem,
  Articles,
  GalleryItems,
  DoctorReview,
  DoctorInfoDetails,
  PriceItem,
  Team,

  //Third Service Models

  DoctorsRequest,
  ThirdBookingServiceModel,
  ThirdBookingDoctorSchedule,
  ScheduleDetail,
  ThirdBookingDoctor,
  ThirdBookingCompany,
  ThirdBookingService,
  CreatePatientBookingReq,
  PatientInfo,

  //Payment Booking

  CreatePatientRequest,
  CreatePatientResponse,
  CreatePatientServiceResponse,

  // Notification
  NotificationModel,
  SetFcmTokenBody,
  NotificationSendReview,
  NotificationDiscount,
  NotificationReminder,
  NotificationReview,
  NotificationLabResult,

  //Branches
  BranchModel,
  BranchDetailModel,
  // OffersModel,
  AwardsModel,
  EducationModel,
  StudyLead,
  StudyLeadResult,
  Course,
  ContentModel,
  BannerModel,
  ChildContentModel,
  OfferModel,
  MedionModel,
  PrivacyModel,
  GetReviewModel,
  ReviewInfoModel,
  ReviewModel,
  PostReviewModel,
  PostReviewResult,
  PostVisitReviewModel,

  RefreshTokenModel,
  RefreshTokenResponseModel,
  RegistrationResponse,

  //Visit
  VisitModel,
  PatientDocuments,
  PatientOrder,
  OrderPayment,
  PatientVisit,
  SaleOrderLine,
  PatientVisitModel,
  PatientVisitSingleModel,
  VisitSingleResultModel,
  PatientReviewModel,

  //Analyse
  PatientAnalysis,

  //Create A Visit

  VisitRequest,
  VisitOrder,
  OrderVisit,
  CreateVisitResponse,
  CreateVisitTotal,
  VisitResponseService,
  VisitResponseUrls,
  Visit,
  PatientAnalyse,
  CancelVisitBody,
  CancelVisitResult,
  PaymentUrlModels,

  //Map
  Position,
  LocationModel,

  //Service Reques
  ServiceResponse,
  ServiceRequest,

  //Vacancy
  VacancyModel,
  JobApplicationModel,
  VacancyDetailModel,
  RequirementsModel,
  UploadVacancyModel,
  ResultVacancyModel,

  //Search
  SearchReqModel,
  DoctorSearchText,
  CategorySearchText,
  MedionResponseSearchText,

  //Payment history
  PaymentResponse,
  Payment,
  User,
  DailyTransactions,
  Transactions,
  Recommendation,
  RecommendationInfo,
  RecipeModel,
  VisitRecipe,
  RecipeDetailModel,
  ReceptionTime,
  Medicine,

  //Doctor Job
  DoctorsJob,
  DoctorCategory,
  DoctorData,
])
final Serializers serializers = (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
