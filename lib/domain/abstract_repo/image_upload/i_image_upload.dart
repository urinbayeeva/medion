import 'package:dartz/dartz.dart';
import 'package:medion/domain/common/failure.dart';
import 'package:medion/domain/upload_image/upload_image.dart';


abstract class IImageUpload {
  Future<Either<ResponseFailure, List<ImageUploadResponseModel?>>> uploadImage(
      {required List<String> pickedImagePath});
}
