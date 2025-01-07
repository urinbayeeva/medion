import 'package:built_collection/built_collection.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:medion/domain/common/failure.dart';
import 'package:medion/domain/models/doctors/doctor_model.dart';
import 'package:medion/infrastructure/apis/apis.dart';
import 'package:medion/infrastructure/services/log_service.dart';

class DoctorRepository {
  final DoctorService _service;

  DoctorRepository(this._service);

  Future<Either<ResponseFailure, BuiltList<DoctorCategory>>> getDoctors() async {
    try {
      final response = await _service.getDoctors();
      if (response.isSuccessful) {
        return right(response.body!);
      } else {
        return left(InvalidCredentials(message: 'invalid_response'.tr()));
      }
    } catch (e) {
      LogService.e(" ----> error on repo  : ${e.toString()}");
      return left(handleError(e));
    }
  }
}