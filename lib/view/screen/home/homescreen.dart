import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:ecommerce/controller/task/taskinputcontroller.dart';
import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/core/constant/linkedapi.dart';
import 'package:ecommerce/core/services/notificationservices.dart';
import 'package:ecommerce/core/services/theme_service.dart';
import 'package:ecommerce/data/model/task.dart';
import 'package:ecommerce/main.dart';
import 'package:ecommerce/themes/themes.dart';
import 'package:ecommerce/view/screen/additeam/tasktile.dart';
import 'package:ecommerce/view/widget/taskinput/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../calender/calenderpage.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);
  @override
  State<Homescreen> createState() => _HomescreenState();
}
class _HomescreenState extends State<Homescreen>with Crud {
   TaskControllerImp controller=Get.put(TaskControllerImp());

     deleteTask()async{
     var response=await postdata(linkdeleteTask, {
      
        "task_id":sharepref.getString("id").toString() ,
    });
    if (response["status"]=="success") {
      setState(() {
        Get.back();
      });
     
      
    }
    else{
      Get.snackbar("تەواو بوونی کارەکانت", "هـــەڵەیەک بــوونی هــەیە دووبارە هــەوڵ بدەرەوە",
       backgroundColor: bluishClr,
            colorText: white,
            duration: const Duration(milliseconds: 1000),
            snackPosition: SnackPosition.BOTTOM,
            margin: const EdgeInsets.only(bottom: 20)
      );
    }
  }

  getTask()async{
    var response=await getdata(linkViewTask);
    return response;
    
  }

  

    updateTask()async{
     var response=await postdata(linkupdateTask, {
      
        "task_id":sharepref.getString("id").toString() ,
        "is_completed":1.toString()
    });
    if (response["status"]=="success") {
      setState(() {
        Get.back();
      });
      
    }
    else{
      Get.snackbar("تەواو بوونی کارەکانت", "هـــەڵەیەک بــوونی هــەیە دووبارە هــەوڵ بدەرەوە",
       backgroundColor: bluishClr,
            colorText: white,
            duration: const Duration(milliseconds: 1000),
            snackPosition: SnackPosition.BOTTOM,
            margin: const EdgeInsets.only(bottom: 20)
      );
    }
  }
  @override
  Widget build(BuildContext context) {

  late NotifyHelper notifyHealper;
  @override
  // ignore: unused_element
  void initState() {
    super.initState();
     notifyHealper=NotifyHelper();
     notifyHealper.initializeNotification();
     notifyHealper.requestIOSPermissions();
  }
    return Scaffold(
      appBar: appbarextra(),

      body: Column(
      children: [
      addCalender(),
      dateTimeSelectExtra(),
      const SizedBox(height: 6,),
      Expanded(child: 
      FutureBuilder(
        future: getTask(),
        builder:(BuildContext context,AsyncSnapshot snapshot) {
         
         if (snapshot.hasData) {
          if (snapshot.data["status"]=="failure") {
            return Center(
               child:Column(
                children: [
                  const SizedBox(height: 40,),
                   Image.network("$linkserverName/upload/empty.png",height: 330,),
                   Text("No Task here yet",style: Themes().subHeadingStyle,)
                ],
               ));
          }
         return AnimationLimiter(
           child: ListView.builder(
              itemCount: snapshot.data["data"].length,
              itemBuilder: (BuildContext context, int index) {
              List list=snapshot.data["data"];
                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 975),
                  child: ScaleAnimation(
                    child: FadeInAnimation(
                      child: GestureDetector(
                       onTap: () { 
                       sharepref.setString("id", "${snapshot.data["data"][index]["task_id"]}").toString();
                        Get.bottomSheet(
                                 SingleChildScrollView(
                                   child: Container(
                       padding:  const EdgeInsets.only(top: 4),
                       decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  topRight: Radius.circular(25)
                                ),
                                color: Get.isDarkMode? darkHeaderClr : Colors.white
                       ),
                       child: Column(
                                children:  [
                                  Container(
                                  height: 6,
                                  width: 120,
                                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Get.isDarkMode ? Colors.grey[600] : Colors.grey[300],
                             
                                  ),
                                  ),
                                  const SizedBox(height: 20,),
                                  snapshot.data["data"][index]["is_completed"] == 1?
                                  Container():buildBottomSheet(
                      label: "TaskComplte", 
                      onTab: (){
                        updateTask();
                      },
                        clr: bluishClr),
                             
                        buildBottomSheet(
                      label: "Delete Task", 
                      onTab: (){
                       deleteTask();
                      },
                        clr: pinkClr),
                             
                       Divider(color: Get.isDarkMode?Colors.grey:darkGreyClr,),
                        buildBottomSheet(
                      label: "Cancle", 
                      onTab: (){
                        Get.back();
                      },
                        clr: bluishClr),
                             
                        const SizedBox(height: 20,),
                        
                                ],
                       ),
                                   ),
                                 )
                               );
                       },
                             
                       child: Tasktile(
                        color: list[index]["color"],
                          starttime: "${list[index]["start_time"]}",
                           endtime: "${list[index]["end-time"]}",
                            title: "${list[index]["title"]}",
                            note: "${list[index]["note"]}",
                            iscomplete: list[index]["is_completed"])
                             
                      ),
                    ),
                  ),
                );
              },
            ),
         );

  //             return AnimationConfiguration.staggeredList(
  //               position: index,
  //              duration: const Duration(milliseconds: 1375),
  //               child: SlideAnimation(
  //               horizontalOffset: 300,
  //                 child: GestureDetector(
  //                   onTap: (){
  //                        sharepref.setString("id", "${snapshot.data["data"][index]["task_id"]}").toString();
  //                        Get.bottomSheet(
  //   SingleChildScrollView(
  //     child: Container(
  //       padding:  const EdgeInsets.only(top: 4),
  //       decoration: BoxDecoration(
  //         borderRadius: const BorderRadius.only(
  //           topLeft: Radius.circular(25),
  //           topRight: Radius.circular(25)
  //         ),
  //         color: Get.isDarkMode? darkHeaderClr : Colors.white
  //       ),
  //       child: Column(
  //         children:  [
  //           Container(
  //           height: 6,
  //           width: 120,
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(10),
  //             color: Get.isDarkMode ? Colors.grey[600] : Colors.grey[300],

  //           ),
  //           ),
  //           const SizedBox(height: 20,),
  //           snapshot.data["data"][index]["is_completed"] == 1?
  //           Container():buildBottomSheet(
  //             label: "TaskComplte", 
  //             onTab: (){
  //               updateTask();
  //             },
  //               clr: bluishClr),

  //               buildBottomSheet(
  //             label: "Delete Task", 
  //             onTab: (){
  //              deleteTask();
  //             },
  //               clr: pinkClr),

  //              Divider(color: Get.isDarkMode?Colors.grey:darkGreyClr,),
  //               buildBottomSheet(
  //             label: "Cancle", 
  //             onTab: (){
  //               Get.back();
  //             },
  //               clr: bluishClr),

  //               const SizedBox(height: 20,)
  //         ],
  //       ),
  //     ),
  //   )
  // );

  //                   },
  //                   child: Tasktile(
  //                     color: list[index]["color"], 
  //                     starttime: "${list[index]["start_time"]}", 
  //                     endtime: "${list[index]["end_time"]}", 
  //                     title: "${list[index]["title"]}", 
  //                     note: "${list[index]["note"]}", 
  //                     iscomplete: list[index]["is_completed"]),
  //                 ),
  //               ),
  //             );
  //               },
  //               );
  
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: Text("loading"),);
                }
                return const Center(child: Text("loading..."),);
        }
        ,))
      ],
      ),
     );
  }
}
showTask(){
 TaskControllerImp controller=Get.put(TaskControllerImp());
  return Expanded(
    child: ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount:controller.taskList.length,
      itemBuilder: (BuildContext context, int index) {
       var task=  controller.taskList[index];
       // ignore: unused_local_variable
       var hour=task.startTime.toString().split(":")[0];
       // ignore: unused_local_variable
       var minute=task.startTime.toString().split(":")[1];

       var date=DateFormat.jm().parse(task.startTime!);
       var myTime=DateFormat('HH:mm').format(date);

       NotifyHelper().scheduledNotification(
          int.parse(myTime.toString().split(":")[0]),
          int.parse(myTime.toString().split(":")[1]),
          task);

        return AnimationConfiguration.staggeredList(
          duration: const Duration(milliseconds: 1375),
          position: index,
          child: SlideAnimation(
            horizontalOffset: 300,
            child: FadeInAnimation(
              
              child: GestureDetector(
              onTap: (){
               showshettbottom(task);
              },
              child: const Tasktile(color: 0, starttime: "starttime", endtime: "endtime", title: "title", note: "note", iscomplete: 1),
                ),
            ),
          ),
        );
      },
    ),
  );


}

addCalender(){
  return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(DateFormat.yMMMd().format(DateTime.now()),style: Themes().subHeadingStyle,),
                   Text("Today",style: Themes().headingStyle,)
                ],
              ),
            )
          ,Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: MyButton(label: "+ Calender", onTab: (){
            Get.snackbar("پــەڕەی ڕۆژ ژمــێر", "لــە درووستــکردندایە چــاوەڕێــکە پەپولەی بێباڵ",
            backgroundColor: bluishClr,
            icon: const Icon(Icons.calendar_month_outlined),
            colorText: white,
            duration: const Duration(milliseconds: 2500),
            snackPosition: SnackPosition.BOTTOM,
            margin: const EdgeInsets.only(bottom: 20)
            );

              Get.to(const Calenderpage());}))
          ],
        );

}

dateTimeSelectExtra(){
  
      // ignore: unused_local_variable
      DateTime selectedDate=DateTime.now();

  return 
      Container(
        margin: const EdgeInsets.only(top: 20,),
        child: DatePicker(
          DateTime.now(),
          height:90,
          width: 70,
          initialSelectedDate: DateTime.now(),
          selectionColor: bluishClr,
          selectedTextColor: Colors.white,

          dateTextStyle: Themes().datetextpiker,
          dayTextStyle:Themes().daytextpiker,
          
          monthTextStyle:Themes().monthtextpiker,
          onDateChange: (date) {
            selectedDate=date;
          },
        ),
      );
}


showshettbottom(TaskmodelData task){
  Get.bottomSheet(
    SingleChildScrollView(
      child: Container(
        padding:  const EdgeInsets.only(top: 4),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25)
          ),
          color: Get.isDarkMode? darkHeaderClr : Colors.white
        ),
        child: Column(
          children:  [
            Container(
            height: 6,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Get.isDarkMode ? Colors.grey[600] : Colors.grey[300],

            ),
            ),
            const SizedBox(height: 20,),
            task.isComplete == 1?
            Container():buildBottomSheet(
              label: "TaskComplte", 
              onTab: (){

                Get.back();
              },
                clr: bluishClr),

                buildBottomSheet(
              label: "Delete Task", 
              onTab: (){
                Get.back();
              },
                clr: pinkClr),

               Divider(color: Get.isDarkMode?Colors.grey:darkGreyClr,),
                buildBottomSheet(
              label: "Cancle", 
              onTab: (){
                Get.back();
              },
                clr: bluishClr),

                const SizedBox(height: 20,)
          ],
        ),
      ),
    )
  );
}

buildBottomSheet(
  {
    required String label,
    required Function() onTab,
    required Color clr,
    bool isClose=false
  }
){
  return GestureDetector(
    onTap: onTab,
    child: Container(
      margin:const EdgeInsets.symmetric(vertical: 4),
      height: 65,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: isClose?Get.isDarkMode?
          Colors.grey[600]!
          :Colors.grey[300]!:clr
        ),
        borderRadius: BorderRadius.circular(20),
        color: isClose?Colors.transparent:clr,
      ),
  child: Center(
    child: Text(label,
    style:isClose? Themes().titlestyle:
     Themes().titlestyle.copyWith(
      color: Colors.white
    ),),
  ),
    ),
  );
}



appbarextra(){
  
  return AppBar(
        elevation: 0.0,
        leading: IconButton(onPressed: (){
          ThemeService().switchTheme();
        }, icon:  Icon(Icons.wb_sunny_outlined,
        color:Colors.grey.shade400,
        )),
        actions: [
          IconButton(onPressed: (){},
          icon:  Icon(Icons.person,
          color: Colors.grey.shade400,))
        ],   
      );


}