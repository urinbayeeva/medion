import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:medion/infrastructure/services/image_service/camera_picker/wechat_camera_picker.dart';
import 'package:medion/infrastructure/services/image_service/image_service.dart';


part 'profile_bloc.freezed.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {


  ProfileBloc(
    
  ) : super( const ProfileState()) {
  
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



  
}
