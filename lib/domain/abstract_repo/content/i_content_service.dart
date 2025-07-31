import 'package:dartz/dartz.dart';
import 'package:medion/domain/common/failure.dart';
import 'package:medion/domain/models/branch/branch_model.dart';

abstract class IContentService {
  Future<Either<ResponseFailure, List<ContentModel>>> fetchContents({required String type});

  Future<Either<ResponseFailure, ContentModel>> fetchSingleContents({required int pk, required String type});
}
