// ignore_for_file: avoid_print, avoid_unnecessary_containers

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:fluttertest/mycontroller.dart';
import 'package:get/get.dart';

class Calculator extends StatelessWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.lightBlue,
        appBar: AppBar(
            backgroundColor: Colors.blueAccent,
            title: const Text("Calculator")),
        body: Column(
          children: [
            Container(
              alignment: Alignment.topRight,
              child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GetBuilder<MyController>(
                    dispose: (controller) {
                      log("dispose");
                      Future.delayed(const Duration(seconds: 0), () {
                        MyController.to.devNameCtrl.value.text = "";
                      });
                    },
                    builder: (s) => TextFormField(
                      initialValue: MyController.to.counter.value,
                      onChanged: (ss) {
                        MyController.to.counter.value = ss;
                      },
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: LayoutGrid(
                areas: '''
                    7 8 9 x
                    4 5 6 -
                    1 2 3 +
                    % 0 d =
                  ''',
                columnSizes: const [auto, auto, auto, auto],
                rowSizes: const [auto, auto, auto, auto],
                columnGap: 12,
                rowGap: 12,
                children: [
                  gridArea('7').containing(Container(
                    child: ElevatedButton(
                        onPressed: () {
                          print(7);
                          // MyController.to.devNameCtrl.value.text = "";
                        },
                        child: const Text("7")),
                  )),
                  gridArea('8').containing(Container(
                    child: ElevatedButton(
                        onPressed: () => {print(8)}, child: const Text("8")),
                  )),
                  gridArea('9').containing(Container(
                    child: ElevatedButton(
                        onPressed: () => {print(9)}, child: const Text("9")),
                  )),
                  gridArea('x').containing(Container(
                    child: ElevatedButton(
                        onPressed: () => {print("X")}, child: const Text("X")),
                  )),
                  gridArea('4').containing(Container(
                    child: ElevatedButton(
                        onPressed: () => {print("4")}, child: const Text("4")),
                  )),
                  gridArea('5').containing(Container(
                    child: ElevatedButton(
                        onPressed: () => {print("5")}, child: const Text("5")),
                  )),
                  gridArea('6').containing(Container(
                    child: ElevatedButton(
                        onPressed: () => {print("6")}, child: const Text("6")),
                  )),
                  gridArea('-').containing(Container(
                    child: ElevatedButton(
                        onPressed: () => {print("-")}, child: const Text("-")),
                  )),
                  gridArea('1').containing(Container(
                    child: ElevatedButton(
                        onPressed: () => {print("1")}, child: const Text("1")),
                  )),
                  gridArea('2').containing(Container(
                    child: ElevatedButton(
                        onPressed: () => {print("2")}, child: const Text("2")),
                  )),
                  gridArea('3').containing(Container(
                    child: ElevatedButton(
                        onPressed: () => {print("3")}, child: const Text("3")),
                  )),
                  gridArea('+').containing(Container(
                    child: ElevatedButton(
                        onPressed: () => {print("+")}, child: const Text("+")),
                  )),
                  gridArea('%').containing(Container(
                    child: ElevatedButton(
                        onPressed: () => {print("%")}, child: const Text("%")),
                  )),
                  gridArea('0').containing(Container(
                    child: ElevatedButton(
                        onPressed: () => {print("0")}, child: const Text("0")),
                  )),
                  gridArea('d').containing(Container(
                    child: ElevatedButton(
                        onPressed: () => {print(".")}, child: const Text(".")),
                  )),
                  gridArea('=').containing(Container(
                    child: ElevatedButton(
                        onPressed: () => {print("=")}, child: const Text("=")),
                  )),
                ],
              ),
            )
          ],
        ));
  }
}
