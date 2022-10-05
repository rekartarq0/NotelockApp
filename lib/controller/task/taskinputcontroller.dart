import 'package:ecommerce/data/model/task.dart';
import 'package:ecommerce/view/screen/home/bottomnavigationbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

abstract class TaskController extends GetxController{

gotoHomescreen();

addTask({TaskmodelData? task});
}

class TaskControllerImp extends TaskController{
  
  final List<TaskmodelData> taskList=<TaskmodelData>[
    
     TaskmodelData(
      id: 1,
      title: "Goto Shopping And buy something to my Love",
      note: "Note Something",
      isComplete: 0,
      startTime: DateFormat('hh:mm a')
      .format(DateTime.now().add(const Duration(minutes: 1))).toString(),
      endtime: DateFormat('hh:mm a')
      .format(DateTime.now().add(const Duration( minutes: 20))),
      color: 1
    )
  ];

  

   

 late TextEditingController title;
  late TextEditingController note;

   // ignore: non_constant_identifier_names
   late TextEditingController title_note;
  // ignore: non_constant_identifier_names
  late TextEditingController note_note;


  //
    DateTime selectedDate=DateTime.now();
    String startTime=DateFormat('hh:mm a').format(DateTime.now()).toString();
    String endTime=DateFormat('hh:mm a').format(DateTime.now().add(const Duration(minutes: 15))).toString();
    String selectedRemind=5.toString();
    List<int> remindList=[5,10,15,20];
    String selectedRepet='None';
    List<String> repeatList=['none','Daily','Weekly','Monthly'];

    int selectedColor=0;
    
    
  @override
  void onInit() {
    title = TextEditingController();
    note = TextEditingController();
    title_note = TextEditingController();
    note_note = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    title.dispose();
    note.dispose();
    title_note.dispose();
    note_note.dispose();
    super.dispose();
  }
  
  @override
  addTask({TaskmodelData? task}) {
    throw UnimplementedError();
  }
  
  @override
  gotoHomescreen() {
     Get.offAll(const BottomNavigation());
     Get.delete<TaskControllerImp>();

  }

}