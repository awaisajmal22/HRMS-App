import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../Model/icon_model.dart';

class UploadDocumentRecruiterViewModel extends GetxController {
  RxString parkingimage = ''.obs;
  final ImagePicker _picker = ImagePicker();
  Future<void> parkingTravelPickImage(ImageSource source) async {
    final pickedImage = await _picker.pickImage(source: source);
    if (pickedImage == null) return;

    parkingimage.value = pickedImage.path;
  }

  RxString generalExpImage = ''.obs;
  Future<void> generalExpPickImage(ImageSource source) async {
    final pickedImage = await _picker.pickImage(source: source);
    if (pickedImage == null) return;

    generalExpImage.value = pickedImage.path;
  }
}
