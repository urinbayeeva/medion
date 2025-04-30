import 'package:built_collection/built_collection.dart';
import 'package:dartz/dartz.dart';
import 'package:medion/domain/common/failure.dart';
import 'package:medion/domain/models/recruitment/recruitment_model.dart';

abstract class IRecruitmentFacade {
  Future<Either<ResponseFailure, BuiltList<VacancyModel>>> fetchVacancies();
}
