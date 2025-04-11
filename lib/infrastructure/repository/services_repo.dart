import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:medion/domain/abstract_repo/services/i_service_repo.dart';
import 'package:medion/domain/common/failure.dart';
import 'package:medion/domain/models/booking/booking_type_model.dart';
import 'package:medion/domain/success_model/response_model.dart';
import 'package:medion/infrastructure/apis/apis.dart';
import 'package:medion/infrastructure/services/log_service.dart';

class ServicesRepo implements IServiceRepo {
  final HelpCallService _helpCallService;

  ServicesRepo(this._helpCallService);

  @override
  Future<Either<ResponseFailure, ServiceResponse>> serviceReqCall(
      {required ServiceRequest request}) async {
    try {
      final response = await _helpCallService.serviceReqCall(request: request);
      LogService.d('Response Status: ${response.statusCode}');
      LogService.d('Response Body: ${response.body}');

      if (response.isSuccessful && response.body != null) {
        final bookingTypes = response.body!;
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
