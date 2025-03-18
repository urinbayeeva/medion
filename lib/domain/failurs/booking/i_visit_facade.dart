import 'package:dartz/dartz.dart';
import 'package:medion/domain/common/failure.dart';
import 'package:medion/domain/models/visit/visit_model.dart';

abstract class IVisitFacade {
  Future<Either<ResponseFailure, List<VisitResponse>>> createVisit(VisitRequest request);
}