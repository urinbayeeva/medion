import 'package:dartz/dartz.dart';
import 'package:medion/domain/abstract_repo/main/i_main_facade.dart';
import 'package:medion/domain/common/failure.dart';
import 'package:medion/domain/models/news_model/news_model.dart';
import 'package:medion/domain/models/service_model/service_model.dart';
import 'package:medion/infrastructure/apis/apis.dart';
import 'package:medion/infrastructure/services/log_service.dart';

class MainRepository implements IMainFacade {
  final MedService _service;

  MainRepository(this._service);

  @override
  Future<Either<ResponseFailure, List<ServiceResResult>>> getServiceTypes({
    String? title,
    String? info,
    bool? forChildren,
    bool? link,
    String? color,
  }) async {
    try {
      final response = await _service.getServiceTypes(
        title,
        info,
        forChildren,
        link,
        color,
      );

      if (response.isSuccessful && response.body != null) {
        return right(response.body!);
      } else {
        return left(const InvalidCredentials(message: 'invalid_credential'));
      }
    } catch (e) {
      LogService.e(" ----> error on repo  : ${e.toString()}");
      return left(handleError(e));
    }
  }

  @override
  Future<Either<ResponseFailure, List<News>>> getNews() async {
    try {
      final response = await _service.getNews();

      if (response.isSuccessful && response.body != null) {
        return right(response.body!.toList());
      } else {
        return left(const InvalidCredentials(message: 'invalid_credential'));
      }
    } catch (e) {
      LogService.e(" ----> error on repo  : ${e.toString()}");
      return left(handleError(e));
    }
  }
}
