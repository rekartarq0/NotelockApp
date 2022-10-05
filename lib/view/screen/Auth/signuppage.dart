import 'package:ecommerce/controller/auth/signupcontroller.dart';
import 'package:ecommerce/core/constant/coloronboarding.dart';
import 'package:ecommerce/core/function/alertexit.dart';
import 'package:ecommerce/core/function/validateinput.dart';
import 'package:ecommerce/view/widget/Auth/textFormFieldCustom/LoginCustomBody.dart';
import 'package:ecommerce/view/widget/Auth/textFormFieldCustom/LoginCustomTitle.dart';
import 'package:ecommerce/view/widget/Auth/textFormFieldCustom/textFormField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     LoginControllerImp controller=Get.put(LoginControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Coloronboarding.backGroundColor,
        centerTitle: true,
        title: Text("17".tr,style: const TextStyle(color: Coloronboarding.grey),),
        elevation: 0.0,
      ),

      body: WillPopScope(onWillPop: alertExitApp, child: SafeArea(child: Container(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: controller.formstate,
          child: ListView(
            children: [

                const Icon(Icons.sign_language_sharp,size: 80,color: Coloronboarding.primarycolor,),
              const SizedBox(height: 18,),
               LoginCustomTitle(text: "10".tr),
              const SizedBox(height: 20,),
               LoginCustomBody(text: "24".tr),
              const SizedBox(height: 20,),
              CustomAuthTextFormField(
                obscureText: null,onTapIcon: (){},
                keyboardType: TextInputType.emailAddress,
                valid:(val) {
                  return validatorInput(val!, 5, 100, "username");
                },hinit: "23".tr, controller: controller.username, label: "20".tr, iconData: Icons.person),
              CustomAuthTextFormField(
                onTapIcon: (){},
                obscureText: null,
                keyboardType: TextInputType.emailAddress,
                valid:(val) {
                  return validatorInput(val!, 5, 100, "email");
                },hinit: "12".tr, controller: controller.email, label: "18".tr, iconData: Icons.email_outlined),
              CustomAuthTextFormField(
                obscureText: null,onTapIcon: (){},
                keyboardType: TextInputType.phone,
                valid:(val) {
                  return validatorInput(val!, 5, 100, "phone");
                },hinit: "22".tr, controller: controller.phone, label: "21".tr, iconData: Icons.phone_android),
             GetBuilder<LoginControllerImp>(builder: (controller) =>  CustomAuthTextFormField(
                obscureText: controller.isShowPassword,
                onTapIcon: (){
                  controller.showPassword();
                },
                keyboardType: TextInputType.visiblePassword,
                valid:(val) {
                  return validatorInput(val!, 5, 100, "password");
                },hinit: "13".tr, controller: controller.password, label: "19".tr, iconData: Icons.lock_outline_rounded),),
             
              Container(
                margin:  const EdgeInsets.only(top: 14),
                padding: const EdgeInsets.all(3),
                decoration:  BoxDecoration(
                  color: Coloronboarding.primarycolor,
                  borderRadius: BorderRadius.circular(25)
                ),
                child: MaterialButton(onPressed: (){
                  controller.signup();
                },child: Text("17".tr,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),),
              ),


              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                     Text("25".tr),
                    InkWell(
                      onTap: () {
                        controller.goTologin();
                      },
                      child:  Text("9".tr,style: const TextStyle(color: Coloronboarding.primarycolor,fontWeight: FontWeight.bold),))
                  ],
                ),
              )
            ],
          ),
        ),
      )))   );
  }
}