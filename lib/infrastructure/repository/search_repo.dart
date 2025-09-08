import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:medion/domain/abstract_repo/search/i_search_repo.dart';
import 'package:medion/domain/common/failure.dart';
import 'package:medion/domain/models/search/search_model.dart';
import 'package:medion/infrastructure/apis/apis.dart';

import 'package:medion/infrastructure/services/log_service.dart';

class SearchRepository implements ISearchRepository {
  final SearchService searchService;

  SearchRepository(this.searchService);

  @override
  Future<Either<ResponseFailure, List<MedionResponseSearchText>>> searchData(SearchReqModel request) async {
    try {
      final response = await searchService.getBranchInfo(request);

      // if (response == null) {
      //   //LogService.e('Search response is null');
      //   return left(InvalidCredentials(message: 'empty_response'.tr()));
      // }

      //LogService.d('Search Response Status: ${response.statusCode}');
      //LogService.d('Search Response Body: ${response.body}');

      if (response.isSuccessful) {
        if (response.body == null) {
          //LogService.w('Search response body is null');
          return right([]); // Return empty list for null response
        }
        // Wrap the single object in a list
        return right([response.body!]);
      } else {
        //LogService.e('Search request failed with status: ${response.statusCode}');
        return left(InvalidCredentials(message: 'invalid_credential'.tr()));
      }
    } catch (e) {
      //LogService.e(" ----> error on search repo  : ${e.toString()}");
      return left(handleError(e));
    }
  }
}
