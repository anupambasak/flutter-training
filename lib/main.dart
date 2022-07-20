import 'package:flutter/material.dart';
import 'package:fluttertest/homepage.dart';
import 'package:fluttertest/mycontroller.dart';
import 'package:get/get.dart';

void main() {
  Get.put(MyController());
  runApp(const GetMaterialApp(home: HomePage()));
}