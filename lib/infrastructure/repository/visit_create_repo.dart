import 'package:dartz/dartz.dart';
import 'package:medion/domain/common/failure.dart';
import 'package:medion/domain/failurs/booking/i_visit_facade.dart';
import 'package:medion/domain/models/visit/visit_model.dart';
import 'package:medion/infrastructure/apis/apis.dart';
import 'package:medion/infrastructure/services/log_service.dart';

class VisitRepository implements IVisitFacade {
  final VisitCreateService _visitCreateService;

  VisitRepository(this._visitCreateService);

  @override
  Future<Either<ResponseFailure, List<VisitResponse>>> createVisit(
      VisitRequest request) async {
    try {
      final response = await _visitCreateService.visitCreate(request: request);
      LogService.d('Response Status: ${response.statusCode}');
      LogService.d('Response Body: ${response.body}');

      if (response.isSuccessful && response.body != null) {
        LogService.d('Raw Response Body: ${response.body}');

        return right(response.body!.toList());
      } else {
        return left(const InvalidCredentials(message: 'Invalid Credentials'));
      }
    } catch (e, stackTrace) {
      LogService.e(" ----> Error on repo: ${e.toString()}");
      LogService.e(" ----> StackTrace: $stackTrace");

      return left(handleError(e));
    }
  }
}
