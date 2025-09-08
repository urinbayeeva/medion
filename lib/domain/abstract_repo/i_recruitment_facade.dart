import 'package:dartz/dartz.dart';
import 'package:medion/domain/common/failure.dart';
import 'package:medion/domain/models/recruitment/recruitment_model.dart';

abstract class IRecruitmentFacade {
  Future<Either<ResponseFailure, VacancyModel>> fetchVacancies();

  Future<Either<ResponseFailure, JobApplicationModel>> fetchVacancySingle({int? id});

  Future<Either<ResponseFailure, ResultVacancyModel>> uploadVacancy({required UploadVacancyModel vacancy});
}
