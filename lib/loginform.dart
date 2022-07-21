import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertest/homepage.dart';
import 'package:fluttertest/mycontroller.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

class LoginForm extends StatelessWidget {
  LoginForm({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        log("onwillpop");
        _formKey.currentState?.save();
        MyController.to.formVals.value = _formKey.currentState!.value;
        MyController.to.devName.value = _formKey.currentState!.value.toString();
        Get.offAll(() => HomePage());
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.blueAccent, title: const Text("Login")),
        body: Column(
          children: [
            FormBuilder(
                key: _formKey,
                autovalidateMode: AutovalidateMode.always,
                initialValue: MyController.to.formVals.value,
                onChanged: () {
                  _formKey.currentState?.save();
                  debugPrint(
                      _formKey.currentState!.value.toString());
                },
                child: Column(
                  children: [
                    FormBuilderFilterChip<String>(
                      name: 'filter_chip',
                      options: const [
                        FormBuilderChipOption<String>(
                          value: 'test1',
                          child: Text("test1"),
                        ),
                        FormBuilderChipOption<String>(
                          value: 'test2',
                          child: Text("test2"),
                        ),
                        FormBuilderChipOption<String>(
                          value: 'test3',
                          child: Text("test3"),
                        )
                      ],
                    ),
                    FormBuilderTextField(
                      name: "age",
                      decoration: const InputDecoration(labelText: "Age"),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.min(6),
                        FormBuilderValidators.max(125),
                        FormBuilderValidators.integer(errorText: "Invalid age"),
                      ]),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
