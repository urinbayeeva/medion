import 'package:dartz/dartz.dart';
import 'package:medion/domain/abstract_repo/company/i_company.dart';
import 'package:medion/domain/common/failure.dart';
import 'package:medion/domain/models/branch/branch_model.dart';
import 'package:medion/infrastructure/services/log_service.dart';

class CompanyService implements ICompany {
  final ICompany _companyRepository;

  CompanyService(this._companyRepository);

  @override
  Future<Either<ResponseFailure, MedionModel>> getMedionActivity() async {
    try {
      final response = await _companyRepository.getMedionActivity();

      return response.fold(
        (failure) => left(failure),
        (companyModel) => right(companyModel),
      );
    } catch (e) {
      LogService.e(" ----> error on company service : ${e.toString()}");
      return left(handleError(e));
    }
  }
}
