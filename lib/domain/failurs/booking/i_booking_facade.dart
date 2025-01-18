import 'package:built_collection/built_collection.dart';
import 'package:dartz/dartz.dart';
import 'package:medion/domain/common/failure.dart';
import 'package:medion/domain/models/booking/booking_type_model.dart';



abstract class IBookingFacade {
  Future<Either<ResponseFailure, List<BookingTypeModel>>> fetchBookingTypes();
  Future<Either<ResponseFailure, BuiltList<Category>>> fetchCategoryServices(int serviceTypeId);
Future<Either<ResponseFailure, BuiltList<ServiceModel>>> getDoctorsTimeSlots({
    required BuiltList<int> serviceIds,
    required int days,
  });
}
