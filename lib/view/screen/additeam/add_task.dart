import 'package:ecommerce/controller/task/taskinputcontroller.dart';
import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/core/constant/linkedapi.dart';
import 'package:ecommerce/core/function/validateinput.dart';
import 'package:ecommerce/themes/themes.dart';
import 'package:ecommerce/view/widget/taskinput/input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> with Crud{

      final TaskControllerImp controller=Get.put(TaskControllerImp());
      GlobalKey<FormState> formstate=GlobalKey<FormState>();

      Future addtask()async{
        if (formstate.currentState!.validate()) { 
    var response=await postdata(linkAddTask, {
      
       "title":controller.title.text,
        "note":controller.note.text,
        "date":controller.selectedDate.toString(),
        "starttime": controller.startTime,
        "endtime":controller.endTime,
        "reminde":controller.selectedRemind,
        "repeat":controller.selectedRepet,
        "color":controller.selectedColor.toString(),
        "is_completed":0.toString()
    });
      
      if (response["status"]=="success") {
            controller.gotoHomescreen();
            Get.snackbar("کـــارەکانم", "ئـــەزیزم ئــەوە تــاسکێکت زیادکرد :) بــەختەوەر بیت",
            backgroundColor: bluishClr,
            colorText: white,
            duration: const Duration(milliseconds: 1000),
            snackPosition: SnackPosition.BOTTOM,
            margin: const EdgeInsets.only(bottom: 20)
            );
    }
        }   
    else{
        Get.snackbar("کـــارەکانم", " خـــانــەکــە پــڕبــکــەرەوە لـــەزیزم",
            backgroundColor: bluishClr,
            colorText: white,
            duration: const Duration(milliseconds: 2000),
            snackPosition: SnackPosition.BOTTOM,
            icon: const Icon(Icons.troubleshoot_outlined),
            // onTap: (snack) => Get.of,
            margin: const EdgeInsets.only(bottom: 20)
            );
    }
  }
  @override
  Widget build(BuildContext context) { 
    return  Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: SingleChildScrollView(
          child: Form(
            key: formstate,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:   [
                 Text("Add Task",style: Themes().headingtask,),
                 
                 InputFieldAddTask(
                  valid: (val) {
                    return validatorInput(val!, 5, 1000, "text");
                  },
                  title: "Title", hinit: "Enter Your Title",controller: controller.title),
                 InputFieldAddTask(
                  valid: (val) {
                    return validatorInput(val!, 5, 1000, "text");
                  },
                  title: "Note", hinit: "Enter Your Note",controller: controller.note,),
                 InputFieldAddTask(
                  valid: (val) {
                    return null;
                  },
                  title: "Date", hinit: controller.selectedDate.toString(),
                 widget: IconButton(onPressed: (){
                 getDatefromUser();
                 }, icon: const Icon(Icons.calendar_today_outlined,color: Colors.grey,)),
                 ),
                  Row(
                    children: [
                      Expanded(child: InputFieldAddTask(
                        valid: (val) {
                    return null;
                  },
                        title: "Start Time", hinit: controller.startTime,
                 widget: IconButton(onPressed: (){
                  getTimefromUser(isStartTime: true);
                 }, icon: const Icon(Icons.access_time_rounded,color: Colors.grey,)),
                 ), ),
                 const SizedBox(width: 20,),
                 Expanded(child: InputFieldAddTask(
                  valid: (val) {
                    return null;
                  },
                  title: "End Time", hinit: controller.endTime,
                 widget: IconButton(onPressed: (){
                  getTimefromUser(isStartTime: false);
                 }, icon: const Icon(Icons.access_time_rounded,color: Colors.grey,)),
                 ), )
                 
                 ],
                  ),
          
                   InputFieldAddTask(
                    valid: (val) {
                    return null;
                  },
                    title: "Remind", hinit:"${controller.selectedRemind} minutes early",
                 widget:DropdownButton(
                  underline: const SizedBox(),
                  dropdownColor: Get.isDarkMode?darkHeaderClr:bluishClr,
                  items: controller.remindList.map((int value) => DropdownMenuItem(
                    value: value.toString(),
                    child: Text("$value",style:const TextStyle(color: Colors.white),))).toList(),
                    icon: const Icon(Icons.keyboard_arrow_down,color: Colors.grey,),
                    iconSize: 32,
          
                   onChanged: (String? newvalue) {
                     setState(() {
                       controller.selectedRemind= newvalue.toString();
                     });
                   },)
                 ),
                 
                  InputFieldAddTask(
                     valid: (val) {
                    return null;
                  },
                    title: "Repid", hinit: controller.selectedRepet,
                  widget:DropdownButton(
                  underline: const SizedBox(),
                  dropdownColor: Get.isDarkMode?darkHeaderClr:bluishClr,
                  items: controller.repeatList.map((String value) => DropdownMenuItem(
                    value: value,
                    child: Text(value,style:const TextStyle(color: Colors.white),))).toList(),
                    icon: const Icon(Icons.keyboard_arrow_down,color: Colors.grey,),
                    iconSize: 32,
                    style: Themes().subtitlestyle,
          
                   onChanged: (String? newvalue) {
                     setState(() {
                       controller.selectedRepet= newvalue!;
                     });
                   },)
                 ),
                 const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    colorpalette(),
                   

                  
                  ],
                ),
                 const SizedBox(height: 200,)
                ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: ()async{
           await addtask();
        }, label: Text("create Task",style: Themes().titlestyle,),
        icon: const Icon(Icons.save_as_outlined),
        backgroundColor: bluishClr,
        ),
    );
  }




  Column colorpalette() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Color",style: Themes().titlestyle,),
                   Wrap(
                    direction: Axis.horizontal,
                    children: List<Widget>.generate(3, (int index) =>   GestureDetector(
                        onTap: (){
                          setState(() {
                            controller.selectedColor = index;
                          });
                        },

                         child: Padding(
                           padding:  const EdgeInsets.only(right:8.0),
                           child: CircleAvatar(
                            backgroundColor: index==0?bluishClr:index==1? pinkClr :orange,
                            radius: 14,
                            child: 
                            controller.selectedColor == index?
                             const Icon(Icons.done,size: 16,color: Colors.white,):null
                           )
                         ),
                       ),)
                   )
                  ],
                );
  }

  getDatefromUser()async{
 DateTime? pickDate= await showDatePicker(
    context: context, 
    initialDate: DateTime.now(), 
    firstDate: DateTime(2015), 
    lastDate: DateTime(2030)
    );
if (pickDate != null) {
      setState(() => controller.selectedDate = pickDate);

}
}

   getTimefromUser({required bool isStartTime}) async{
   TimeOfDay? pickertime=await showTimePicker(
    initialEntryMode: TimePickerEntryMode.dial,
    context: context, 
    initialTime: isStartTime?TimeOfDay.fromDateTime(DateTime.now()) : TimeOfDay.fromDateTime(DateTime.now().add(const Duration(minutes: 15)))
    );
    // ignore: use_build_context_synchronously
    String formatdate= pickertime!.format(context);
    if (isStartTime) {
      setState(() => controller.startTime = formatdate);
    }
   else if (!isStartTime) {
      setState(() => controller.endTime = formatdate);
    }
  }

}




