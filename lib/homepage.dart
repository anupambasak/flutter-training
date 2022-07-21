import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertest/calculator.dart';
import 'package:fluttertest/loginform.dart';
import 'package:fluttertest/mycontroller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final TextEditingController devNameCtrl =
      TextEditingController(text: MyController.to.devName.value);

  @override
  Widget build(BuildContext context) {
    log("inside home build method");
    devNameCtrl.addListener(() {
      MyController.to.devName.value = devNameCtrl.value.text;
    });
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: const Text("CRIS Mobile App")),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
              padding: const EdgeInsets.all(5.0),
              child: Center(
                child: Column(
                  children: [
                    const Text(
                      "CRIS",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Image.asset(
                      "assets/crisimage.jpg",
                      width: 70,
                      height: 70,
                    )
                  ],
                ),
              )),
          const Divider(
            thickness: 2.0,
            color: Colors.white,
          ),
          const Align(
            alignment: Alignment.topLeft,
            child: Text(
              "About",
              style: TextStyle(color: Colors.black),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "CRIS (Centre for Railway Information Systems) is an organization under Ministry of Railways. CRIS is a unique combination of competent IT professionals and experienced Railway personnel enabling it to successfully deliver complex Railway IT systems in core areas. Since its inception, CRIS is developing/maintaining softwares for the following key functional areas of the Indian Railways.",
            textAlign: TextAlign.justify,
            style: GoogleFonts.raleway(
                textStyle: const TextStyle(color: Colors.white)),
          ),
          const Divider(
            thickness: 2.0,
            color: Colors.white,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  // print("hello11111111");
                  Get.snackbar(
                    "GeeksforGeeks",
                    "Hello everyone",
                    snackPosition: SnackPosition.BOTTOM,
                  );
                },
                child: Container(
                    color: Colors.teal[200],
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("hello"),
                    )),
              ),
              GestureDetector(
                onTap: () => {Get.to(() => const Calculator())},
                child: Container(
                    color: Colors.teal[200],
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("To Calculator"),
                    )),
              ),
              GestureDetector(
                onTap: () => {Get.to(() => LoginForm())},
                child: Container(
                    color: Colors.teal[200],
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Login From"),
                    )),
              )
            ],
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Obx(() => Text(MyController.to.devName.value))),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GetBuilder<MyController>(
              builder: (s) => TextFormField(
                // initialValue: s.devName.value,
                controller: devNameCtrl,
                decoration: const InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: EdgeInsets.all(12.0),
                    labelText: "Enter developer Name"),
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () => {}, child: const Text("Update developer Name"))
        ],
      ),
    );
  }
}
