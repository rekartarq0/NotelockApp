import 'package:ecommerce/controller/auth/succesresetpasscontroller.dart';
import 'package:ecommerce/core/constant/coloronboarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SuccessResetPasswordControllerImp controller=Get.put(SuccessResetPasswordControllerImp());
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Coloronboarding.backGroundColor,
        centerTitle: true,
        title: const Text("Success",style: TextStyle(color: Coloronboarding.grey),),
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
              const Text("- - - -"),
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

              },child: const Text("Go To Login",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),),
            ),
            const SizedBox(height: 30,)
            ],
          ),
        ),
      ),
    );
  }
}

