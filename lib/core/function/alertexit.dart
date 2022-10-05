import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertExitApp(){
   Get.defaultDialog(
      cancel: ElevatedButton(onPressed: (){Get.back();}, child: const Text("No")),
      confirm: ElevatedButton(onPressed: (){exit(0);}, child: const Text("Yes")),
    title: "Alert",
    middleText: "Are you sure exit this App",
    
  );
  return Future.value(true);
}