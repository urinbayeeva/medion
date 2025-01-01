import 'dart:async';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:medion/domain/models/auth/auth.dart';
import 'package:medion/domain/upload_image/upload_image.dart';
import 'package:medion/infrastructure/repository/auth_repo.dart';
import 'package:medion/infrastructure/services/image_service/camera_picker/wechat_camera_picker.dart';
import 'package:medion/infrastructure/services/image_service/image_service.dart';
import 'package:medion/infrastructure/services/log_service.dart';
import 'package:medion/presentation/component/easy_loading.dart';
import 'package:medion/utils/constants.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'profile_bloc.freezed.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final AuthRepository _repositoryAuth;
  final dynamic _repositoryImageUpload;

  ProfileBloc(
      this._repositoryAuth,
    this._repositoryImageUpload,
  ) : super( ProfileState()) {
  
    on<_PickImage>(_pickImage);

  }


  FutureOr<void> _pickImage(
    _PickImage event,
    Emitter<ProfileState> emit,
  ) async {
    List<AssetEntity>? imagePaths = await ImageService.showPicker(event.context,
        cropStyle: CropStyle.rectangle,
        maxAssets: 1,
        selectedAssets: [],
        aspectRatioPresets: [CropAspectRatioPreset.square]);
    if (imagePaths != null && imagePaths.isNotEmpty) {
      File? file = await imagePaths.first.originFile;

      emit(state.copyWith(pickedImagePath: file?.path));
    }
  }

  Future<String> uploadImage(String path) async {
    List<String> paths = [path];

    List<ImageUploadResponseModel?> images = [];
    final res2 =
        await _repositoryImageUpload.uploadImage(pickedImagePath: paths);

    res2.fold((error) async {
      EasyLoading.showError(error.message);
    }, (data) async {
      LogService.i(data.toString());
      images = data;
    });

    return images.firstOrNull?.urls?.original ?? "";
  }
  

  
}
