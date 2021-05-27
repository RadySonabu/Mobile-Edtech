import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HomeController extends GetxController {
  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;
  void openCamera(ImageSource imageSource) async {
    final pickedImage = await ImagePicker().getImage(source: imageSource);
    if (pickedImage != null) {
      selectedImagePath.value = pickedImage.path;
      selectedImageSize.value =
          ((File(selectedImagePath.value)).lengthSync() / 1024 / 1024)
                  .toStringAsFixed(2) +
              " Mb";
    } else {
      Get.snackbar('Error', 'No image captured');
    }
  }
}
