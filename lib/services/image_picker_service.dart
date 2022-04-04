import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:truyou/components/components.dart';

//Picks and crops image from gallery
class ImagePickerService {
  //TODO:Add the following keys to your Info.plist file, located in <project root>/ios/Runner/Info.plist:
  // NSPhotoLibraryUsageDescription - describe why your app needs permission for the photo library. This is called Privacy - Photo Library Usage Description in the visual editor.
  // NSCameraUsageDescription - describe why your app needs access to the camera. This is called Privacy - Camera Usage Description in the visual editor.
  // NSMicrophoneUsageDescription - describe why your app needs access to the microphone, if you intend to record videos. This is called Privacy - Microphone Usage Description in the visual editor.

  ImagePicker _imagePicker = new ImagePicker();
  ImageCropper _imageCropper = new ImageCropper();

  Future<File?> pickImage() async {
    XFile? _imageFromGallery = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        imageQuality: Constants.IMAGE_QUALITY,
        maxHeight: Constants.IMAGE_MAXHEIGHT,
        maxWidth: Constants.IMAGE_MAXWIDTH);

    return await _imageCropper.cropImage(
        sourcePath: _imageFromGallery!.path,
        maxHeight: 1920,
        maxWidth: 1080,
        androidUiSettings: AndroidUiSettings(
          toolbarTitle: 'Crop Image',
          toolbarColor: Constants.background_color,
          toolbarWidgetColor: Colors.white,
          statusBarColor: Constants.background_color,
          activeControlsWidgetColor: Constants.sky_blue,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
        iosUiSettings: IOSUiSettings(title: 'Crop Image'));
  }
}
