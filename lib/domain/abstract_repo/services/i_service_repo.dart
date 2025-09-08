import 'package:dartz/dartz.dart';
import 'package:medion/domain/common/failure.dart';
import 'package:medion/domain/models/booking/booking_type_model.dart';
import 'package:medion/domain/success_model/response_model.dart';

abstract class IServiceRepo {
  Future<Either<ResponseFailure, ServiceResponse>> serviceReqCall({required ServiceRequest request});
}
