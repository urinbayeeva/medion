import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

part 'profile_bloc.freezed.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ImagePicker _picker = ImagePicker();
  final Dio _dio = Dio();

  ProfileBloc() : super(const ProfileState()) {
    on<_PickImage>(_pickImage);
    on<_UploadImage>(_uploadImage);
  }

  Future<void> _pickImage(_PickImage event, Emitter<ProfileState> emit) async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final croppedFile = await _cropImage(File(pickedFile.path));
      if (croppedFile != null) {
        emit(state.copyWith(pickedImagePath: croppedFile.path));
        add(const ProfileEvent.uploadImage());
      }
    }
  }

  Future<File?> _cropImage(File imageFile) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Crop Image',
          toolbarColor: Colors.black,
          toolbarWidgetColor: Colors.white,
          lockAspectRatio: true,
        ),
        IOSUiSettings(
          title: 'Crop Image',
          aspectRatioLockEnabled: true,
        ),
      ],
    );
    return croppedFile != null ? File(croppedFile.path) : null;
  }

  Future<void> _uploadImage(_UploadImage event, Emitter<ProfileState> emit) async {
    if (state.pickedImagePath == null) return;

    try {
      File imageFile = File(state.pickedImagePath!);
      List<int> imageBytes = await imageFile.readAsBytes();
      String base64Image = base64Encode(imageBytes);

      Response response = await _dio.post(
        'https://his.uicgroup.tech/apiweb/profile/patient_image',
        options: Options(
          headers: {
            'accept': 'application/json',
            'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxNTIwNSIsImV4cCI6MTc0MjU1ODk4Mn0.hRFSKs8Db6sjv1hxJV25FnDSRjTYGMlW1mqWsP9XjSQ',
            'Content-Type': 'application/json',
          },
        ),
        data: {'image_base64': base64Image},
      );

      if (response.statusCode == 200) {
        print('Image uploaded successfully: ${response.data}');
      } else {
        print('Failed to upload image: ${response.statusCode}');
      }
    } catch (e) {
      print('Error uploading image: $e');
    }
  }
}
