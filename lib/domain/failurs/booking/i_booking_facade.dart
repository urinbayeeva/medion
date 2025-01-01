import 'package:dartz/dartz.dart';
import 'package:medion/domain/common/failure.dart';
import 'package:medion/domain/models/booking/booking_type_model.dart';

/// Booking Facade Interface
abstract class IBookingFacade {
  Future<Either<ResponseFailure, List<BookingTypeModel>>> fetchBookingTypes();


}
