import 'package:get/get.dart';

class MyController extends GetxController {
  var counter = "".obs;
  var devName = "".obs;
  final RxMap<String, dynamic> formVals = <String, dynamic>{}.obs;

  MyController() {
    // _connectListener();
  }

  // _connectListener(){
  //   devNameCtrl.value.addListener(() {
  //     // log("listener. ${devNameCtrl.value.text}");
  //     devName.value = devNameCtrl.value.text;
  //     // log("devName: ${devName.value}");
  //   });
  // }

  static MyController get to => Get.find();
}
