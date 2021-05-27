import 'dart:io';

import 'package:app/features/dashboard/controller.home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);
  final HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Obx(() => controller.selectedImagePath.value == ''
                    ? Text('Select Image')
                    : Image.file(File(controller.selectedImagePath.value))),
                Text('Home page'),
                ElevatedButton(
                    onPressed: () {
                      controller.openCamera(ImageSource.camera);
                    },
                    child: Text('Camera'))
              ],
            ),
          )),
    );
  }
}
