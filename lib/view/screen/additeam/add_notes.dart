import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/core/constant/linkedapi.dart';
import 'package:ecommerce/core/function/validateinput.dart';
import 'package:ecommerce/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/task/taskinputcontroller.dart';

class AddNotes extends StatefulWidget {
  const AddNotes({Key? key}) : super(key: key);

  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> with Crud{

        final TaskControllerImp controller=Get.put(TaskControllerImp());
      GlobalKey<FormState> formstate=GlobalKey<FormState>();
  
      Future addNotes()async{
        if (formstate.currentState!.validate()) { 
    var response=await postdata(linkAddNote, {
      
       "title": controller.title_note.text,
        "note":controller.note_note.text,
        "color":controller.selectedColor.toString(),
    });
      
      if (response["status"]=="success") {
            controller.gotoHomescreen();
            Get.snackbar("تــێبینیەکانم", "ئـــەزیزم ئــەوە تێبینییەکت زیادکرد :) بــەختەوەر بیت",
            backgroundColor: bluishClr,
            colorText: white,
            duration: const Duration(milliseconds: 1000),
            snackPosition: SnackPosition.BOTTOM,
            margin: const EdgeInsets.only(bottom: 20)
            );
    }
        }   
    else{
        Get.snackbar("تــێبینیەکانم", " خـــانــەکــە پــڕبــکــەرەوە لـــەزیزم",
            backgroundColor: bluishClr,
            colorText: white,
            duration: const Duration(milliseconds: 2000),
            snackPosition: SnackPosition.BOTTOM,
            icon: const Icon(Icons.note_alt_outlined),
            // onTap: (snack) => Get.of,
            margin: const EdgeInsets.only(bottom: 20)
            );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
           padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 12.0),
          child: Form(
            key: formstate,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  validator: (val) => validatorInput(val!, 3, 1000, "text"),
                  controller: controller.title_note,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Title"
                  ),
                  style: Themes().headingtask,
                ),
                 Expanded(
                  flex: 1,
                  child: TextFormField(
                  validator: (val) => validatorInput(val!, 3, 1000, "text"),
                    controller: controller.note_note,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "start typing"
                  ),
                )),
                colorpalette(),
                const SizedBox(height: 15,)
              ],
            ),
          ),
        ),
      ),


      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
         setState(() {
              addNotes();
         });
        }, label: Text("Save Note",style: Themes().titlestyle,),
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

}