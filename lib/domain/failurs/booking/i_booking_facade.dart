import 'package:built_collection/built_collection.dart';
import 'package:dartz/dartz.dart';
import 'package:medion/domain/common/failure.dart';
import 'package:medion/domain/models/booking/booking_type_model.dart';
import 'package:medion/domain/models/third_service_model/third_service_model.dart';

abstract class IBookingFacade {
  Future<Either<ResponseFailure, List<BookingTypeModel>>> fetchBookingTypes();
  Future<Either<ResponseFailure, BuiltList<Category>>> fetchCategoryServices(
      int serviceTypeId);

  Future<Either<ResponseFailure, List<HomepageBookingCategory>>>
      fetchHomePageBookingCategories();

  Future<Either<ResponseFailure, MedicalModel>> fetchHomePageBookingDoctors(
      int id);

  Future<Either<ResponseFailure, BuiltList<ThirdBookingService>>> getDoctors({
    required List<int> serviceIds,
  });


  Future<Either<ResponseFailure, BuiltList<CreatePatientResponse>>> getCreatePatientVisit({
    required CreatePatientRequest request
  });
}
