import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:medion/domain/abstract_repo/branch/i_branch_repo.dart';
import 'package:medion/domain/common/failure.dart';
import 'package:medion/domain/models/branch/branch_model.dart';
import 'package:medion/infrastructure/apis/apis.dart';
import 'package:medion/infrastructure/services/log_service.dart';

class BranchRepository implements IBranchRepository {
  final BranchService apiService;

  BranchRepository(this.apiService);

  @override
  Future<Either<ResponseFailure, List<BranchModel>>> fetchBranches() async {
    try {
      final response = await apiService.getBranchInfo();
      LogService.d('Response Status: ${response.statusCode}');
      LogService.d('Response Body: ${response.body}');

      if (response.isSuccessful && response.body != null) {
        final branches = response.body!;
        return right(branches.toList());
      } else {
        return left(InvalidCredentials(message: 'invalid_credential'.tr()));
      }
    } catch (e) {
      LogService.e(" ----> error on branch repo  : ${e.toString()}");
      return left(handleError(e));
    }
  }
}