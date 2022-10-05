
import 'package:ecommerce/controller/auth/resetpasscontroller.dart';
import 'package:ecommerce/core/function/validateinput.dart';
import 'package:ecommerce/view/widget/Auth/textFormFieldCustom/LoginCustomBody.dart';
import 'package:ecommerce/view/widget/Auth/textFormFieldCustom/LoginCustomTitle.dart';
import 'package:ecommerce/view/widget/Auth/textFormFieldCustom/textFormField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/Coloronboarding.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
ResetPasswordImp controller=Get.put(ResetPasswordImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Coloronboarding.backGroundColor,
        centerTitle: true,
        title: const Text("Reset Password",style: TextStyle(color: Coloronboarding.grey),),
        elevation: 0.0,
      ),

      body: SafeArea(child: Container(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [

            const Icon(Icons.sign_language_sharp,size: 80,color: Coloronboarding.primarycolor,),
            const SizedBox(height: 18,),
            const LoginCustomTitle(text: "New Password"),
            const SizedBox(height: 20,),
            const LoginCustomBody(text: "Please enter your new password"),
            const SizedBox(height: 20,),
            CustomAuthTextFormField(
               onTapIcon: () {
                  
                },
              obscureText: true,
               keyboardType: TextInputType.visiblePassword,
              valid:(val) {
                return validatorInput(val!, 5, 100, "password");
              },hinit: "Enter New Password", controller: controller.password, label: "Password", iconData: Icons.lock_outline),
            CustomAuthTextFormField(
               onTapIcon: () {
                  
                },
              obscureText: true,
                keyboardType: TextInputType.visiblePassword,
              valid:(val) {
                return validatorInput(val!, 5, 100, "password");
              },hinit: "Confirm Password", controller: controller.newPassword, label: "Password", iconData: Icons.lock_outline),
           
            Container(
              margin:  const EdgeInsets.only(top: 22,right: 10,left: 10),
              padding: const EdgeInsets.all(3),
              decoration:  BoxDecoration(
                color: Coloronboarding.primarycolor,
                borderRadius: BorderRadius.circular(25)
              ),
              child: MaterialButton(onPressed: (){
                controller.goToSuccessResetPassword();
              },child: const Text("Save",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),),
            ),


          
          ],
        ),
      )),
    );
  }
}