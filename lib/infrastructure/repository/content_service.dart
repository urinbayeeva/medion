import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:medion/domain/abstract_repo/content/i_content_service.dart';
import 'package:medion/domain/common/failure.dart';
import 'package:medion/domain/models/branch/branch_model.dart';
import 'package:medion/infrastructure/apis/apis.dart';
import 'package:medion/infrastructure/services/log_service.dart';

class ContentServiceRepo implements IContentService {
  final ContentService _apiService;

  ContentServiceRepo(this._apiService);

  @override
  Future<Either<ResponseFailure, List<ContentModel>>> fetchContents(
      {required String type}) async {
    try {
      final response = await _apiService.getContentType(type);
      LogService.d('Response Status: ${response.statusCode}');
      LogService.d('Response Body: ${response.body}');

      if (response.isSuccessful && response.body != null) {
        final content = response.body!;
        return right(content.toList());
      } else {
        return left(InvalidCredentials(message: 'invalid_credential'.tr()));
      }
    } catch (e) {
      LogService.e(" ----> error on branch repo  : ${e.toString()}");
      return left(handleError(e));
    }
  }
}
