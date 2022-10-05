import 'package:ecommerce/core/constant/coloronboarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/successsignupcontroller.dart';

class SuccesSignUpPage extends StatelessWidget {
  const SuccesSignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
SuccessSignUpControllerImp controller = Get.put(SuccessSignUpControllerImp());

    return Scaffold(
        appBar: AppBar(
        backgroundColor: Coloronboarding.backGroundColor,
        centerTitle: true,
        title:  Text("32".tr,style: const TextStyle(color: Coloronboarding.grey),),
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            children:  [
              const Center(
                child: Icon(Icons.verified_outlined,color: Coloronboarding.primarycolor,size: 200,),
              ),
               Text("37".tr,style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
               const SizedBox(height: 20,),
               Text("38".tr,style: const TextStyle(fontSize: 17,color: Coloronboarding.grey),),
              const Spacer(),
               Container(
                width: double.infinity,
              margin:  const EdgeInsets.only(top: 14),
              padding: const EdgeInsets.all(3),
              decoration:  BoxDecoration(
                color: Coloronboarding.primarycolor,
                borderRadius: BorderRadius.circular(25)
              ),
              child: MaterialButton(onPressed: (){
                controller.goToPageLogin();
                
              },child:  Text("31".tr,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),),
            ),
            const SizedBox(height: 30,)
              
           
            ],
          ),
        ),
      ),
    );
  }
}