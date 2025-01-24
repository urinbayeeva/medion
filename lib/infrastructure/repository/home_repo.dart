import 'package:dartz/dartz.dart';

import 'package:easy_localization/easy_localization.dart';

import 'package:medion/domain/common/failure.dart';

import 'package:medion/domain/failurs/news/i_news_facade.dart';
import 'package:medion/domain/models/medical_services/medical_services.dart';
import 'package:medion/domain/models/news_model/news_model.dart';
import 'package:medion/infrastructure/apis/apis.dart';

import 'package:medion/infrastructure/services/log_service.dart';

class HomeRepository implements INewsFacade {
  // final DBService _dbService;
  final HomePageService _homePageService;

  HomeRepository(
    // this._dbService,
    this._homePageService,
  );

  @override
  Future<Either<ResponseFailure, List<News>>> getNews() async {
    try {
      final response = await _homePageService.getNews();
      LogService.d('Response Status: ${response.statusCode}');
      LogService.d('Response Body: ${response.body}');

      if (response.isSuccessful && response.body != null) {
        final bookingTypes = response.body!.toList();
        return right(bookingTypes);
      } else {
        return left(InvalidCredentials(message: 'invalid_credential'.tr()));
      }
    } catch (e) {
      LogService.e(" ----> error on repo  : ${e.toString()}");
      return left(handleError(e));
    }
  }

  @override
  Future<Either<ResponseFailure, List<DiseaseModle>>> getDiseases() async {
    try {
      final response = await _homePageService.getDisease();
      LogService.d('Response Status: ${response.statusCode}');
      LogService.d('Response Body: ${response.body}');

      if (response.isSuccessful && response.body != null) {
        final diseases = response.body!.toList();
        return right(diseases);
      } else {
        return left(InvalidCredentials(message: 'invalid_credential'.tr()));
      }
    } catch (e) {
      LogService.e(" ----> error on repo : ${e.toString()}");
      return left(handleError(e));
    }
  }

  @override
  Future<Either<ResponseFailure, List<AdModel>>> getAds() async {
    try {
      final response = await _homePageService.getAds();
      LogService.d('Response Status: ${response.statusCode}');
      LogService.d('Response Body: ${response.body}');

      if (response.isSuccessful && response.body != null) {
        final ads = response.body!.toList();
        return right(ads);
      } else {
        return left(InvalidCredentials(message: 'invalid_credential'.tr()));
      }
    } catch (e) {
      LogService.e(" ----> error on repo : ${e.toString()}");
      return left(handleError(e));
    }
  }
}
