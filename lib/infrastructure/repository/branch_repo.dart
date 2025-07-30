import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:medion/domain/abstract_repo/branch/i_branch_repo.dart';
import 'package:medion/domain/common/failure.dart';
import 'package:medion/domain/models/branch/branch_model.dart';
import 'package:medion/infrastructure/apis/apis.dart';
import 'package:medion/infrastructure/services/log_service.dart';

class BranchRepository implements IBranchRepository {
  final BranchService apiService;
  final StudyService studyService;
  final CompanyService companyService;

  BranchRepository(this.apiService, this.studyService, this.companyService);

  @override
  Future<Either<ResponseFailure, List<BranchModel>>> fetchBranches() async {
    try {
      final response = await apiService.getBranchInfo();
      //LogService.d('Response Status: ${response.statusCode}');
      //LogService.d('Response Body: ${response.body}');

      if (response.isSuccessful && response.body != null) {
        final branches = response.body!;
        return right(branches.toList());
      } else {
        return left(InvalidCredentials(message: 'invalid_credential'.tr()));
      }
    } catch (e) {
      //LogService.e(" ----> error on branch repo  : ${e.toString()}");
      return left(handleError(e));
    }
  }

  @override
  Future<Either<ResponseFailure, List<AwardsModel>>> fetchAwards() async {
    try {
      final response = await apiService.getAwards();
      //LogService.d('Response Status: ${response.statusCode}');
      //LogService.d('Response Body: ${response.body}');

      if (response.isSuccessful && response.body != null) {
        final branches = response.body!;
        return right(branches.toList());
      } else {
        return left(InvalidCredentials(message: 'invalid_credential'.tr()));
      }
    } catch (e) {
      //LogService.e(" ----> error on branch repo  : ${e.toString()}");
      return left(handleError(e));
    }
  }

  @override
  Future<Either<ResponseFailure, EducationModel>> fetchStudy() async {
    try {
      final response = await studyService.getStudy();
      //LogService.d('Response Status: ${response.statusCode}');
      //LogService.d('Response Body: ${response.body}');

      if (response.isSuccessful && response.body != null) {
        final study = response.body!;
        return right(study);
      } else {
        return left(InvalidCredentials(message: 'invalid_credential'.tr()));
      }
    } catch (e) {
      //LogService.e(" ----> error on branch repo  : ${e.toString()}");
      return left(handleError(e));
    }
  }

  @override
  Future<Either<ResponseFailure, OfferModel>> getOfferta() async {
    try {
      final response = await companyService.getOfferta();
      //LogService.d('Response Status: ${response.statusCode}');
      //LogService.d('Response Body: ${response.body}');

      if (response.isSuccessful && response.body != null) {
        final offerta = response.body!;
        return right(offerta);
      } else {
        return left(InvalidCredentials(message: 'invalid_credential'.tr()));
      }
    } catch (e) {
      //LogService.e(" ----> error on branch repo  : ${e.toString()}");
      return left(handleError(e));
    }
  }

  @override
  Future<Either<ResponseFailure, MedionModel>> getMedionActivity() async {
    try {
      final response = await companyService.getMedionActivity();
      //LogService.d('Response Status: ${response.statusCode}');
      //LogService.d('Response Bod y: ${response.body}');

      if (response.isSuccessful && response.body != null) {
        final getMedionActivity = response.body!;
        return right(getMedionActivity);
      } else {
        return left(InvalidCredentials(message: 'invalid_credential'.tr()));
      }
    } catch (e) {
      //LogService.e(" ----> error on branch repo  : ${e.toString()}");
      return left(handleError(e));
    }
  }

  @override
  Future<Either<ResponseFailure, BranchDetailModel>> getBranchDetail({required int id}) async {
    try {
      final result = await apiService.getBranchDetail(id);
      if (result.isSuccessful && result.body != null) {
        return right(result.body!);
      } else {
        return left(InvalidCredentials(message: 'invalid_credential'.tr()));
      }
    } catch (e) {
      return left(handleError(e));
    }
  }

  @override
  Future<Either<ResponseFailure, void>> postReview({required PostReviewModel review}) async {
    try {
      final res = await studyService.postReviews(review: review);
      if (res.isSuccessful && res.body != null) {
        return right(null);
      } else {
        return left(InvalidCredentials(message: 'invalid_credential'.tr()));
      }
    } catch (e) {
      return left(handleError(e));
    }
  }

  @override
  Future<Either<ResponseFailure, List<GetReviewModel>>> getReview() async {
    try {
      final res = await studyService.getReviews();
      if (res.isSuccessful && res.body != null) {
        List<GetReviewModel> model = (res.body?.toList()) ?? <GetReviewModel>[];
        return right(model);
      } else {
        return left(InvalidCredentials(message: 'invalid_credential'.tr()));
      }
    } catch (e) {
      return left(handleError(e));
    }
  }

  @override
  Future<Either<ResponseFailure, StudyLeadResult>> studyLead({required StudyLead report}) async {
    try {
      final response = await studyService.studyLead(report: report);
      if (response.isSuccessful && response.body != null) {
        final study = response.body!;
        return right(study);
      } else {
        return left(InvalidCredentials(message: 'invalid_credential'.tr()));
      }
    } catch (e) {
      //LogService.e(" ----> error on branch repo  : ${e.toString()}");
      return left(handleError(e));
    }
  }
}
