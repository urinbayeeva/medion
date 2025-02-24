import 'package:dartz/dartz.dart';
import 'package:medion/domain/common/failure.dart';
import 'package:medion/domain/models/branch/branch_model.dart';

abstract class IBranchRepository {
  Future<Either<ResponseFailure, List<BranchModel>>> fetchBranches();
  Future<Either<ResponseFailure, List<AwardsModel>>> fetchAwards();
  Future<Either<ResponseFailure, EducationModel>> fetchStudy();
}
