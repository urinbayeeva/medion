import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:medion/domain/common/failure.dart';
import 'package:medion/domain/failurs/booking/i_booking_facade.dart';
import 'package:medion/domain/models/booking/booking_type_model.dart';
import 'package:medion/infrastructure/apis/apis.dart';
import 'package:medion/infrastructure/services/log_service.dart';

class BookingRepository implements IBookingFacade {
  final BookingService _bookingService;

  BookingRepository(this._bookingService);
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
}
