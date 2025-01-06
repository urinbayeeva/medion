import 'package:built_collection/built_collection.dart';
import 'package:dartz/dartz.dart';
import 'package:medion/domain/common/failure.dart';
import 'package:medion/domain/models/news_model/news_model.dart';

abstract class INewsFacade {
  Future<Either<ResponseFailure, List<News>>> getNews();
}
