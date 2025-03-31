import 'package:built_collection/built_collection.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:medion/domain/common/failure.dart';
import 'package:medion/domain/models/doctors/doctor_model.dart';
import 'package:medion/infrastructure/apis/apis.dart';
import 'package:medion/infrastructure/services/log_service.dart';

class DoctorRepository {
  final DoctorService apiService;

  DoctorRepository(this.apiService);

  // @override
  Future<Either<ResponseFailure, List<DoctorCategory>>> fetchDoctors() async {
    try {
      final response = await apiService.getDoctorsInfo();
      LogService.d('Response Status: ${response.statusCode}');
      LogService.d('Response Body: ${response.body}');

      if (response.isSuccessful && response.body != null) {
        final bookingTypes = response.body!;
        return right(bookingTypes.toList());
      } else {
        return left(InvalidCredentials(message: 'invalid_credential'.tr()));
      }
    } catch (e) {
      LogService.e(" ----> error on repo  : ${e.toString()}");
      return left(handleError(e));
    }
  }

  Future<Either<ResponseFailure, ModelDoctor>> getDoctorDetailInfo(
      int id) async {
    try {
      final response = await apiService.getDoctorDetailInfo(id);
      LogService.d('Doctor Detail Response Status: ${response.statusCode}');
      LogService.d('Doctor Detail Response Body: ${response.body}');

      if (response.isSuccessful && response.body != null) {
        return right(response.body!);
      } else {
        return left(InvalidCredentials(
          message: 'failed_to_load_doctor_details'.tr(),
          // statusCode: response.statusCode,
        ));
      }
    } catch (e) {
      LogService.e("Error fetching doctor details: ${e.toString()}");
      return left(handleError(e));
    }
  }
}
