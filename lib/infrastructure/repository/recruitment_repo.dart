import 'package:built_collection/built_collection.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:medion/domain/abstract_repo/i_recruitment_facade.dart';
import 'package:medion/domain/common/failure.dart';
import 'package:medion/domain/models/recruitment/recruitment_model.dart';
import 'package:medion/infrastructure/apis/apis.dart';
import 'package:medion/infrastructure/services/log_service.dart';

class RecruitmentRepository implements IRecruitmentFacade {
  final RecruitmentService _recruitmentService;

  RecruitmentRepository(this._recruitmentService);

  /// Fetch all vacancies
  @override
  Future<Either<ResponseFailure, VacancyModel>> fetchVacancies() async {
    try {
      final response = await _recruitmentService.getVacancies();
      if (response.isSuccessful && response.body != null) {
        return right(response.body!);
      } else {
        return left(InvalidCredentials(message: 'invalid_credential'.tr()));
      }
    } catch (e) {
      return left(handleError(e));
    }
  }

  @override
  Future<Either<ResponseFailure, JobApplicationModel>> fetchVacancySingle({int? id}) async {
    try {
      final response = await _recruitmentService.getVacancySingle(id: id);
      if (response.isSuccessful && response.body != null) {
        return right(response.body!);
      } else {
        return left(InvalidCredentials(message: 'invalid_credential'.tr()));
      }
    } catch (e) {
      return left(handleError(e));
    }
  }

  @override
  Future<Either<ResponseFailure, ResultVacancyModel>> uploadVacancy({required UploadVacancyModel vacancy}) async {
    try {
      final response = await _recruitmentService.uploadVacancy(vacancy: vacancy);
      if (response.isSuccessful && (response.statusCode > 199 && response.statusCode < 300)) {
        return right(response.body!);
      } else {
        return left(InvalidCredentials(message: 'invalid_credential'.tr()));
      }
    } catch (e) {
      return left(handleError(e));
    }
  }
}
