import 'package:dartz/dartz.dart';
import 'package:extended_image/extended_image.dart';
import 'package:http_parser/http_parser.dart';
import 'package:medion/domain/abstract_repo/image_upload/i_image_upload.dart';
import 'package:medion/domain/upload_image/upload_image.dart';
import 'package:mime/mime.dart';
import 'package:medion/domain/common/failure.dart';
import 'package:medion/infrastructure/apis/apis.dart';
import 'package:medion/infrastructure/services/log_service.dart';

class ImageUploadRepo implements IImageUpload {
  final UploadImage _uploadImage;

  ImageUploadRepo(this._uploadImage);

  @override
  Future<Either<ResponseFailure, List<ImageUploadResponseModel?>>> uploadImage(
      {required List<String> pickedImagePath}) async {
    try {
      List<ImageUploadResponseModel?> urls = [];
      List<Future<ImageUploadResponseModel?>> uploadFutures = [];
      for (int index = 0; index < pickedImagePath.length; index++) {
        uploadFutures.add(getImageUpload(path: pickedImagePath[index]));
      }
      urls = await Future.wait(uploadFutures);
      return Right(urls);
    } catch (e) {
      //LogService.e(" ----> error on repo  : ${e.toString()}");
      return left(handleError(e));
    }
  }

  Future<ImageUploadResponseModel?> getImageUpload({required String path}) async {
    //LogService.i("$path ${lookupMimeType(path)}");
    try {
      MultipartFile multipartFile = await MultipartFile.fromPath(
        "file",
        path,
        contentType: MediaType('image', 'jpeg'),
      );
      final res = await _uploadImage.imageUpload(multipartFile);
      if (res.isSuccessful && res.body != null) {
        return res.body;
      } else {
        return null;
      }
    } catch (e) {
      //LogService.e(" ----> error on repo  : ${e.toString()}");
      rethrow;
    }
  }
}
