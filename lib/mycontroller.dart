import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyController extends GetxController {
  var counter = "".obs;
  var devName = "".obs;

  var devNameCtrl = TextEditingController(text: "").obs;

  MyController() {
    log("MyController const.");
    _connectListener();
  }

  _connectListener(){
    devNameCtrl.value.addListener(() {
      // log("listener. ${devNameCtrl.value.text}");
      devName.value = devNameCtrl.value.text;
      // log("devName: ${devName.value}");
    });
  }

  static MyController get to => Get.find();
}
