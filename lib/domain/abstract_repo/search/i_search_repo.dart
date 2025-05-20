import 'package:dartz/dartz.dart';
import 'package:medion/domain/common/failure.dart';
import 'package:medion/domain/models/search/search_model.dart';

abstract class ISearchRepository {
  Future<Either<ResponseFailure, List<MedionResponseSearchText>>> searchData(
      SearchReqModel request);
}
