import 'package:ecommerce/controller/auth/forgetpasscontroller.dart';
import 'package:ecommerce/core/function/validateinput.dart';
import 'package:ecommerce/view/widget/Auth/textFormFieldCustom/LoginCustomBody.dart';
import 'package:ecommerce/view/widget/Auth/textFormFieldCustom/LoginCustomTitle.dart';
import 'package:ecommerce/view/widget/Auth/textFormFieldCustom/textFormField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constant/coloronboarding.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    ForgetPasswordImp controller=Get.put(ForgetPasswordImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Coloronboarding.backGroundColor,
        centerTitle: true,
        title:  Text("14".tr,style: const TextStyle(color: Coloronboarding.grey),),
        elevation: 0.0,
      ),

      body: SafeArea(child: Container(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: controller.formstate,
          child: ListView(
            children: [

              const Icon(Icons.sign_language_sharp,size: 80,color: Coloronboarding.primarycolor,),
              const SizedBox(height: 18,),
              LoginCustomTitle(text: "27".tr),
              const SizedBox(height: 20,),
              LoginCustomBody(text: "29".tr),
              const SizedBox(height: 20,),
              CustomAuthTextFormField(
                onTapIcon: () {
                  
                },
                obscureText: null,
                keyboardType: TextInputType.emailAddress,
                valid:(val) {
                  return validatorInput(val!, 5, 100, "email");
                },hinit: "12".tr, controller: controller.email, label: "18".tr, iconData: Icons.person),
              Container(
                margin:  const EdgeInsets.only(top: 22,right: 10,left: 10),
                padding: const EdgeInsets.all(3),
                decoration:  BoxDecoration(
                  color: Coloronboarding.primarycolor,
                  borderRadius: BorderRadius.circular(25)
                ),
                child: MaterialButton(onPressed: (){
                  controller.checkemail();
                  
                },child: Text("30".tr,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),),
              ),
            ],
          ),
        ),
      )),
    );
  }
}