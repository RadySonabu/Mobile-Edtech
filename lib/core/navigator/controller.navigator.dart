import 'package:app/features/dashboard/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomNavigatorController extends GetxController {
  var option = 0.obs;

  void setPage(item) {
    option.value = item;
  }
}
