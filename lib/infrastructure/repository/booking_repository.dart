import 'package:built_collection/built_collection.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
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

      // API call (ensure `request` is passed correctly)
      final response = await _bookingService.fetchDoctors(
        requiresToken: "true",
        request: request, // You were missing this parameter!
      );

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
  Future<Either<ResponseFailure, BuiltList<MedicalServiceCategory>>>
      getServicesByDoctorId(int doctorId) async {
    try {
      // Remove any potential whitespace from the doctor_id parameter
      final cleanedDoctorId = doctorId.toString().trim();
      final numericDoctorId = int.parse(cleanedDoctorId);

      final response =
          await _bookingService.getHomePageBookingDoctorsByID(numericDoctorId);

      LogService.d('Response Status: ${response.statusCode}');
      LogService.d('Response Body: ${response.body}');

      if (response.isSuccessful) {
        if (response.body != null) {
          // If the response is a single item, convert it to a BuiltList
          final categories =
              BuiltList<MedicalServiceCategory>([response.body!]);
          return right(categories);
        } else {
          return left(InvalidCredentials(message: 'empty_response'.tr()));
        }
      } else {
        return left(InvalidCredentials(
          message: 'failed_to_fetch_services'.tr(),
        ));
      }
    } on FormatException {
      return left(InvalidCredentials(message: 'invalid_doctor_id_format'.tr()));
    } catch (e) {
      LogService.e("Error fetching services by doctor ID: ${e.toString()}");
      return left(handleError(e));
    }
  }
}
