
import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/core/constant/linkedapi.dart';
import 'package:ecommerce/main.dart';
import 'package:ecommerce/themes/themes.dart';
import 'package:ecommerce/view/screen/Notes/noteargumentpages.dart';
import 'package:ecommerce/view/screen/home/bottomnavigationbar.dart';
import 'package:ecommerce/view/screen/home/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';


class NotesPage extends StatefulWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> with Crud{
  
  deletenote() async {
    
     var response=await postdata(linkDeleteNote, {
      
        "note_id":sharepref.getString("id").toString() ,
    });
    if (response["status"]=="success") {
      setState(() {
       Get.to(const BottomNavigation());
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


  getNote()async{
    var response=await getdata(linkViewNote);
    return response;  
  }

// ama tanha serchy pey akain bawagyan
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
            return Scaffold(
              floatingActionButton: FloatingActionButton(
                backgroundColor: bluishClr,
                onPressed: (){},
                child: const Icon(Icons.add,color: white,size: 40,)
                ),
              body: Center(
               child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Image.network("$linkserverName/upload/empty.png",height: 330,),
                   Text("No Note here yet",style: Themes().subHeadingStyle,)
                ],
               )),
            );
          }
             return  AnimationLimiter(
               child: MasonryGridView.builder(
               scrollDirection: Axis.vertical,
               crossAxisSpacing: 8,
               mainAxisSpacing: 6,
               gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
               crossAxisCount: 2,  
               ),
               itemCount: snapshot.data["data"].length,
               itemBuilder: (BuildContext context,int index) {
                  List list=snapshot.data["data"];
                 return AnimationConfiguration.staggeredGrid(
                  duration: const Duration(milliseconds: 975),
                  position: index,
                  columnCount: 2,
                   child: ScaleAnimation(
                     child: FadeInAnimation(
                       child: GestureDetector(

                         onTap: () {
                           sharepref.setString("id", "${snapshot.data["data"][index]["note_id"]}");
                           Get.offAll(
                             const NoteargumentsPage(),
                             arguments: {"id":snapshot.data["data"][index]["note_id"]}
                             );
                                  
                         },
                         onLongPress: (){
                        sharepref.setString("id", "${snapshot.data["data"][index]["note_id"]}");
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
                        buildBottomSheet(
                                     label: "Delete Task", 
                                     onTab: ()async{
                                    await deletenote();
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
                                  
                         },
                         child: ClipRRect(
                           borderRadius: BorderRadius.circular(10),
                           child: Container(
                             padding: const EdgeInsets.all(10),
                             decoration:  BoxDecoration(
                               color: getbGclr(list[index]["color"])
                             ),
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children:  [
                                     ReadMoreText("${list[index]["note_content"]}",
                                     trimLines: 3,
                                     textAlign: TextAlign.left,
                                     trimMode: TrimMode.Line,
                       
                                     ),
                                    Text("${list[index]["date"]}",style: Themes().titlestyle,),
                       
                               ],
                             ),
                           ),
                         ),
                       ),
                     ),
                   ),
                 );
               },
               ),
             );
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator.adaptive(),);
                }
                return const Center(child: CircularProgressIndicator.adaptive(),);}
         )));  
  }
  

  getbGclr(int? color) {
    switch(color){
      case 0:
      return bluishClr;     
       case 1:
      return pinkClr;    
        case 2:
      return orange;
        case 3:
        return bluishClr;
    }
  }

appbarextra(){
  
  return AppBar(
        elevation: 0.0,
        title: Text("Notes",style: Themes().noteTitle,),
        actions: [
          Container(
            margin: const EdgeInsets.all(3),
            decoration:  BoxDecoration(
              color: darkHeaderClr,
              borderRadius: BorderRadius.circular(7)
            ),
            child: IconButton(
              onPressed: (){
                  showSearch(context: context, delegate: SerchData());
              },
            icon: const Icon(Icons.search,color: Colors.white,size: 34,)),
          )
        ],   
      );


}
}


class SerchData extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: (){
        query = "";
      },
       icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: (){
        close(context, null);
      },
     icon: const Icon(
      Icons.arrow_back,
     ));
  }

  @override
  Widget buildResults(BuildContext context) {

    // return natejay aw shta ka serchy bo akain
   return const Text("data");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
   return const Text("Suggestion");
  }

}