import 'package:built_collection/built_collection.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:medion/domain/common/failure.dart';
import 'package:medion/domain/failurs/booking/i_booking_facade.dart';
import 'package:medion/domain/models/booking/booking_type_model.dart';
import 'package:medion/domain/serializers/serializer.dart';
import 'package:medion/infrastructure/apis/api_service.dart';
import 'package:medion/infrastructure/apis/apis.dart';
import 'package:medion/infrastructure/services/log_service.dart';

class BookingRepository implements IBookingFacade {
  final BookingService _bookingService;
  // final ApiService _apiService;

  BookingRepository(this._bookingService);

  /// Fetch booking types
  @override
  Future<Either<ResponseFailure, List<BookingTypeModel>>>
      fetchBookingTypes() async {
    try {
      final response = await _bookingService.bookingTypes();
      LogService.d('Response Status: ${response.statusCode}');
      LogService.d('Response Body: ${response.body}');

      if (response.isSuccessful && response.body != null) {
        final bookingTypes = response.body!.toList();
        return right(bookingTypes);
      } else {
        return left(InvalidCredentials(message: 'invalid_credential'.tr()));
      }
    } catch (e) {
      LogService.e(" ----> error on repo  : ${e.toString()}");
      return left(handleError(e));
    }
  }

//fetchCategoryServices
  @override
  Future<Either<ResponseFailure, BuiltList<Category>>> fetchCategoryServices(
      int id) async {
    try {
      final response = await _bookingService.getServiceId(id);
      LogService.d('Response Status: ${response.statusCode}');
      LogService.d('Response Body: ${response.body}');

      if (response.isSuccessful && response.body != null) {
        return right(response.body as BuiltList<Category>);
      } else {
        return left(InvalidCredentials(message: 'invalid_credential'.tr()));
      }
    } catch (e) {
      LogService.e(" ----> error on repo  : ${e.toString()}");
      return left(handleError(e));
    }
  }

   @override
  Future<Either<ResponseFailure, BuiltList<ServiceModel>>> getDoctorsTimeSlots({
    required BuiltList<int> serviceIds,
    required int days,
  }) async {
    try {
      final request = GiveSelectedId((b) => b..serviceIds = serviceIds.toBuilder());
      
      final response = await _bookingService.getDoctorsTime(
        request: request,
        days: days,
      );
      
      LogService.d('Response Status: ${response.statusCode}');
      LogService.d('Response Body: ${response.body}');

      if (response.isSuccessful && response.body != null) {
        return right(response.body!);
      } else {
        return left(InvalidCredentials(message: 'invalid_credential'.tr()));
      }
    } catch (e) {
      LogService.e(" ----> error on repo  : ${e.toString()}");
      return left(handleError(e));
    }
  }

}
