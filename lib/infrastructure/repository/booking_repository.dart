import 'package:built_collection/built_collection.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:medion/domain/common/failure.dart';
import 'package:medion/domain/failurs/booking/i_booking_facade.dart';
import 'package:medion/domain/models/booking/booking_type_model.dart';

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

  //Get doctor time

  @override
  Future<Either<ResponseFailure, BuiltList<BookingThirdService>>>
      getDoctorsTimeSlots({
    required List<int> serviceIds,
    required int days,
  }) async {
    try {
      // Prepare the request body
      final request = serviceIds.toList();

      LogService.d('Request ServiceIds: $request');

      // Make the API call using Chopper
      final response = await _bookingService.getDoctorsTime(request: request);

      LogService.d('Response Status: ${response.statusCode}');
      LogService.d('Response Body: ${response.body}');

      if (response.isSuccessful) {
        final body = response.body;

        // Add null check and explicit handling
        if (body != null && body.isNotEmpty) {
          return right(body);
        } else {
          LogService.e('Response body is null or empty');
          return left(InvalidCredentials(
            message: 'No doctors available',
          ));
        }
      } else {
        LogService.e('Request failed: ${response.statusCode}');
        return left(InvalidCredentials(
          message: response.error?.toString() ?? 'Request failed',
        ));
      }
    } catch (e, stackTrace) {
      // Log the exception and return a failure
      LogService.e('Error in getDoctorsTimeSlots: $e');
      LogService.e('StackTrace: $stackTrace');
      return left(InvalidCredentials(
        message: e.toString(),
      ));
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
        print(response.statusCode);
        return right(response.body!);
      } else {
        print(response.statusCode);

        return left(InvalidCredentials(message: 'invalid_credential'.tr()));
      }
    } catch (e) {
      LogService.e(" ----> error on repo: ${e.toString()}");
      return left(handleError(e));
    }
  }
}
