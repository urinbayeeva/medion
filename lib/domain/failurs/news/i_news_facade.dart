import 'package:dartz/dartz.dart';
import 'package:medion/domain/common/failure.dart';
import 'package:medion/domain/models/booking/booking_type_model.dart';
import 'package:medion/domain/models/medical_services/medical_services.dart';
import 'package:medion/domain/models/news_model/news_model.dart';

abstract class INewsFacade {
  Future<Either<ResponseFailure, List<News>>> getNews();
  Future<Either<ResponseFailure, List<DiseaseModle>>> getDiseases();
  Future<Either<ResponseFailure, List<AdModel>>> getAds();
    Future<Either<ResponseFailure, List<DiagnosticsModel>>> getDiagnosis();
}
