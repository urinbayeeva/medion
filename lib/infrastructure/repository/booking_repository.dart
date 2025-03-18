import 'package:built_collection/built_collection.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:medion/domain/common/failure.dart';
import 'package:medion/domain/failurs/booking/i_booking_facade.dart';
import 'package:medion/domain/models/booking/booking_type_model.dart';
import 'package:medion/domain/models/third_service_model/third_service_model.dart';

import 'package:medion/infrastructure/apis/apis.dart';
import 'package:medion/infrastructure/services/log_service.dart';

class BookingRepository implements IBookingFacade {
  final BookingService _bookingService;
  // final ApiService _apiService;
  final CreateVisitService _createVisitService;

  BookingRepository(this._bookingService, this._createVisitService);

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
  Future<Either<ResponseFailure, List<HomepageBookingCategory>>>
      fetchHomePageBookingCategories() async {
    try {
      final response = await _bookingService.getHomePageBookingCategory();
      LogService.d('Response Status: ${response.statusCode}');
      LogService.d('Response Body: ${response.body}');

      if (response.isSuccessful && response.body != null) {
        return right(response.body!.toList());
      } else {
        return left(InvalidCredentials(message: 'invalid_credential'.tr()));
      }
    } catch (e) {
      LogService.e(" ----> error on repo  : ${e.toString()}");
      return left(handleError(e));
    }
  }

  //HOME PAGE BOOKING GET DOCTORS

  @override
  Future<Either<ResponseFailure, MedicalModel>> fetchHomePageBookingDoctors(
    int id,
  ) async {
    try {
      final response = await _bookingService.getHomePageBookingDoctors(id);
      LogService.d('Response Status: ${response.statusCode}');
      LogService.d('Response Body: ${response.body}');

      if (response.isSuccessful && response.body != null) {
        return right(response.body!);
      } else {
        return left(InvalidCredentials(message: 'invalid_credential'.tr()));
      }
    } catch (e) {
      LogService.e(" ----> error on repo: ${e.toString()}");
      return left(handleError(e));
    }
  }
   @override
  Future<Either<ResponseFailure, BuiltList<ThirdBookingService>>> getDoctors({
    required List<int> serviceIds,
  }) async {
    try {
      // Create the proper request object
      final request =
          DoctorsRequest((b) => b..serviceIds = ListBuilder<int>(serviceIds));

      // API call
      final response = await _bookingService.fetchDoctors(request);

      // Logging
      LogService.d('Response Status: ${response.statusCode}');
      LogService.d('Response Body: ${response.body}');

      // Handle response
      if (response.isSuccessful && response.body != null) {
        return right(response.body!);
      } else {
        return left(InvalidCredentials(message: 'invalid_credential'.tr()));
      }
    } catch (e) {
      LogService.e(" ----> Error on repo: ${e.toString()}");
      return left(handleError(e));
    }
  }
  
@override
Future<Either<ResponseFailure, List<CreatePatientResponse>>> getCreatePatientVisit({
  required List<CreatePatientRequest> request,
}) async {
  try {
   final response = await _createVisitService.createVisit(request: request.toList());
LogService.d('Response Status: ${response.statusCode}');
LogService.d('Response Body: ${response.body}');

if (response.isSuccessful && response.body != null) {
  final body = response.body!;
  if (body.first == null) {
    LogService.e('Services list is null in response');
    return left(InvalidCredentials(message: 'invalid_response'.tr()));
  }
  return right(body);
} else {
  return left(InvalidCredentials(message: 'server_error'.tr()));
}
  } catch (e) {
    LogService.e(" ----> error on repo  : ${e.toString()}");
    return left(handleError(e));
  }
}


}
