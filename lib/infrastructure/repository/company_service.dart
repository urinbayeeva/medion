import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:medion/domain/abstract_repo/company/i_company.dart';
import 'package:medion/domain/common/failure.dart';
import 'package:medion/domain/models/branch/branch_model.dart';
import 'package:medion/domain/models/team/team_model.dart';
import 'package:medion/infrastructure/apis/apis.dart';
import 'package:medion/infrastructure/services/log_service.dart';

class CompanyServiceRepo implements ICompany {
  final CompanyService _companyRepository;

  CompanyServiceRepo(this._companyRepository);

  @override
  Future<Either<ResponseFailure, MedionModel>> getMedionActivity() async {
    try {
      final response = await _companyRepository.getMedionActivity();
      if (response.isSuccessful || response.body != null) {
        return right(response.body!);
      } else {
        return left(InvalidCredentials(message: 'invalid_credential'.tr()));
      }
    } catch (e) {
      LogService.e(" ----> error on company service : ${e.toString()}");
      return left(handleError(e));
    }
  }

  @override
  Future<Either<ResponseFailure, Map<String, dynamic>>> getTeams({required String type}) async {
    try {
      final response = await _companyRepository.getTeam();
      log("res data: ${response.statusCode}");
      log("res data: ${response.body}");
      if (response.isSuccessful || response.body != null) {
        return right(response.body!);
      } else {
        return left(InvalidCredentials(message: 'invalid_credential'.tr()));
      }
    } catch (e) {
      LogService.e(" ----> error on company service : ${e.toString()}");
      return left(handleError(e));
    }
  }
}
