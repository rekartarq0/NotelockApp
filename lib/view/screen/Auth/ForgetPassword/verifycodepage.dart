import 'package:ecommerce/controller/auth/verifycodecontroller.dart';
import 'package:ecommerce/core/constant/coloronboarding.dart';
import 'package:ecommerce/view/widget/Auth/textFormFieldCustom/LoginCustomBody.dart';
import 'package:ecommerce/view/widget/Auth/textFormFieldCustom/LoginCustomTitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VerifyCodePage extends StatelessWidget {
  const VerifyCodePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
VerifycodeImp controller=Get.put(VerifycodeImp());    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Coloronboarding.backGroundColor,
        centerTitle: true,
        title: const Text("verification code",style: TextStyle(color: Coloronboarding.grey),),
        elevation: 0.0,
      ),

      body: SafeArea(child: Container(
        padding: const EdgeInsets.all(15),
        child: Form(
          child: ListView(
            children: [

              const Icon(Icons.verified_outlined,size: 80,color: Coloronboarding.primarycolor,),
              const SizedBox(height: 18,),
              const LoginCustomTitle(text: "OTP Code"),
              const SizedBox(height: 20,),
              const LoginCustomBody(text: "Please enter the verification code we\nsent to your email address"),
              const SizedBox(height: 20,),
             
               OtpTextField(
          numberOfFields: 6,
          fieldWidth: 50,
          borderRadius: BorderRadius.circular(25),
          //set to true to show as box or false to show as dash
          showFieldAsBox: true, 
          //runs when a code is typed in
          onCodeChanged: (String code) {
              //handle validation or checks here           
          },
          //runs when every textfield is filled
          onSubmit: (String verificationCode){

            controller.goToSuccessSignUp();
             
          }, // end onSubmit
    ),
            ],
          ),
        ),
      )),
    );
  }
}