import 'dart:developer';

import 'package:built_collection/built_collection.dart';
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
  Future<Either<ResponseFailure, CreateVisitResponse>> createVisit(List<VisitRequest> request) async {
    try {
      final response = await _visitCreateService.visitCreate(request: BuiltList<VisitRequest>(request));
      if (response.isSuccessful) {
        return right(response.body!);
      } else {
        return left(const InvalidCredentials(message: 'Invalid Credentials'));
      }
    } catch (e, stackTrace) {
      log("Error Message catch $e");
      return left(handleError(e));
    }
  }
}
