import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fluttertest/homepage.dart';
import 'package:fluttertest/mycontroller.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

void main() {
  Get.put(MyController());
  runApp(GetMaterialApp(localizationsDelegates: const [
    FormBuilderLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ], home: HomePage()));
}
