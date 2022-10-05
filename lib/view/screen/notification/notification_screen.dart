import 'package:ecommerce/core/constant/coloronboarding.dart';
import 'package:ecommerce/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({
    Key? key,
    required this.paylod,
  }) : super(key: key);
  final String paylod;
  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  String _payload="";
  @override
  void initState() {
    super.initState();
    _payload=widget.paylod;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(_payload.toString().split("|")[0],style:Themes().headingtask ),
        leading:IconButton(onPressed: ()=>Get.back()
        ,icon: Icon(Icons.arrow_back_ios_new,   color: Get.isDarkMode?Colors.white:Colors.black,)),
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20,),
            Text("Hellou,Rekar",style: TextStyle(
              fontSize: 26,fontWeight: FontWeight.w900,
              color: Get.isDarkMode?Colors.white:darkGreyClr
            ),),
            const SizedBox(height: 10,),
             Text("You have a new remender",style: TextStyle(
              fontSize: 26,fontWeight: FontWeight.w300,
              color: Get.isDarkMode?Colors.white:darkGreyClr
            ),),
            const SizedBox(height: 20,),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              margin: const EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Coloronboarding.primarycolor
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,  
                  children: [
                    const SizedBox(height: 50,),
                    Row(children:  const [
                      Icon(Icons.text_format,size: 30,color: Colors.white,),
                      SizedBox(width: 20,),
                      Text("Title",style: TextStyle(
                     color: Colors.white,fontSize: 30)),
                    ],),
                    Text(_payload.toString().split("|")[0],style: const TextStyle(
          color: Colors.white
        )),
                    const SizedBox(height: 20,),
                    Row(children:  const [
                      Icon(Icons.description,size: 30,color: Colors.white,),
                      SizedBox(width: 20,),
                      Text("Description",style: TextStyle(
                     color: Colors.white,fontSize: 30)),
                    ],),
                     Text(_payload.toString().split("|")[1],style: const TextStyle(
          color: Colors.white,
        ),textAlign: TextAlign.justify,),
                  const SizedBox(height: 20,),
                    Row(children:  const [
                      Icon(Icons.calendar_today_outlined,size: 30,color: Colors.white,),
                      SizedBox(width: 20,),
                      Text("Date",style: TextStyle(
                     color: Colors.white,fontSize: 30)),
                    ],),
                    Text(_payload.toString().split("|")[2],style: const TextStyle(
          color: Colors.white,
        ),textAlign: TextAlign.justify,),
                 const SizedBox(height: 50,),


                  ],
                ),
              ),
            ),
            const SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }
}