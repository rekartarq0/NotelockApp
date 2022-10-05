import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/core/constant/linkedapi.dart';
import 'package:ecommerce/main.dart';
import 'package:ecommerce/themes/themes.dart';
import 'package:ecommerce/view/screen/home/bottomnavigationbar.dart';
import 'package:ecommerce/view/screen/home/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoteargumentsPage extends StatefulWidget {
  const NoteargumentsPage({Key? key}) : super(key: key);

  @override
  State<NoteargumentsPage> createState() => _NoteargumentsPageState();
}

class _NoteargumentsPageState extends State<NoteargumentsPage> with Crud{
  
 
 Future getNote()async{
    var response=await postdata(linkViewNotewitharguments,{
      "note_id":sharepref.getString("id")
    });
    return response;
  }

  deletenote()async{
     var response=await postdata(linkDeleteNote, {
      
        "note_id":sharepref.getString("id").toString() ,
    });
    if (response["status"]=="success") {
      setState(() {
        Get.to(const Homescreen());
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
    return Scaffold(
      appBar:appbarextra(),
      body: Container(
        margin: const EdgeInsets.all(12),
       child:FutureBuilder(
         future: getNote(),
         builder: (BuildContext context, AsyncSnapshot snapshot) {
          // lerawa
             if (snapshot.hasData) {
          if (snapshot.data["status"]=="failure") {
            return Center(
               child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Image.network("$linkserverName/upload/empty.png",height: 330,),
                   Text("empty screen",style: Themes().subHeadingStyle,)
                ],
               ));
          }

          return ListView.builder(
            itemCount: snapshot.data["data"].length,
            itemBuilder: (BuildContext context, int index) {
     List list=snapshot.data["data"];
              return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children:  [
     Text("${list[index]["note_title"]}",style: Themes().noteTitle,),
     Text("${list[index]["date"]}",style: Themes().monthtextpiker,),

     Text("${list[index]["note_content"]}",style: Themes().notecontent,),
    
    ],
              );
            },
          );
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator.adaptive(),);
                }
                return const Center(child: CircularProgressIndicator.adaptive(),);}
         )));  
  }
  
 

appbarextra(){
  
  return AppBar(
        elevation: 0.0,
        leading: Container(
          margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.only(left: 6),
          decoration: BoxDecoration(
            color: darkHeaderClr,
            borderRadius: BorderRadius.circular(15)
          ),
          child: IconButton(
            onPressed: (){
              Get.offAll(const BottomNavigation());
          }, icon:  Icon(Icons.arrow_back_ios,
          color:Colors.grey.shade400,
          )),
        ),

// Save Button Edition

        actions: [

          // Delete Button work
           Container(
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: darkHeaderClr,
            borderRadius: BorderRadius.circular(15)
          ),
          child: IconButton(
            onPressed: ()async{
            await  deletenote();
            
          }, icon:  const Icon(Icons.delete,
          color:Colors.red,
          )),
        ),

        // Update Button Work
           Container(
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: darkHeaderClr,
            borderRadius: BorderRadius.circular(15)
          ),
          child: IconButton(
            onPressed: (){
            
          }, icon:  Icon(Icons.edit,
          color:Colors.grey.shade400,
          )),
        ),

        // Save Data 

         Container(
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: darkHeaderClr,
            borderRadius: BorderRadius.circular(15)
          ),
          child: IconButton(
            onPressed: (){
            
          }, icon:  Icon(Icons.save_as_outlined,
          color:Colors.grey.shade400,
          )),
        ),
        ],   
      );


}



}