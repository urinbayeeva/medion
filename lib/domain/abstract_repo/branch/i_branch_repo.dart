import 'package:dartz/dartz.dart';
import 'package:medion/domain/common/failure.dart';
import 'package:medion/domain/models/branch/branch_model.dart';

abstract class IBranchRepository {
  Future<Either<ResponseFailure, List<BranchModel>>> fetchBranches();

  Future<Either<ResponseFailure, BranchDetailModel>> getBranchDetail({required int id});

  Future<Either<ResponseFailure, List<AwardsModel>>> fetchAwards();

  Future<Either<ResponseFailure, EducationModel>> fetchStudy();

  Future<Either<ResponseFailure, StudyLeadResult>> studyLead({required StudyLead report});

  Future<Either<ResponseFailure, OfferModel>> getOfferta();

  Future<Either<ResponseFailure, MedionModel>> getMedionActivity();

  Future<Either<ResponseFailure, List<GetReviewModel>>> getReview();

  Future<Either<ResponseFailure, void>> postReview({required PostReviewModel review});
}
