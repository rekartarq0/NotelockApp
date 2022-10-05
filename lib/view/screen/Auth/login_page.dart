import 'package:ecommerce/controller/auth/logincontroller.dart';
import 'package:ecommerce/core/constant/coloronboarding.dart';
import 'package:ecommerce/core/function/alertexit.dart';
import 'package:ecommerce/core/function/validateinput.dart';
import 'package:ecommerce/view/widget/Auth/textFormFieldCustom/LoginCustomBody.dart';
import 'package:ecommerce/view/widget/Auth/textFormFieldCustom/LoginCustomTitle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widget/Auth/textFormFieldCustom/textFormField.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginpageeImp controller=Get.put(LoginpageeImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Text("9".tr,style: const TextStyle(color: Coloronboarding.grey),),
        elevation: 0.0,
        backgroundColor: Coloronboarding.backGroundColor,
      ),
      body:WillPopScope(onWillPop: alertExitApp, child:  Container(
        padding: const EdgeInsets.all(15),
        child: Form(
          key:  controller.formstate,
          child: ListView(
            children:    [
                const Icon(Icons.emergency_share_outlined,size: 100,color: Coloronboarding.primarycolor,),
              const SizedBox(height: 18,),
               LoginCustomTitle(text: "10".tr),
              const SizedBox(height: 20,),
               LoginCustomBody(text: "11".tr),
              const SizedBox(height: 40,),
              CustomAuthTextFormField(
                 onTapIcon: () {
                  
                },
                obscureText: null,
                keyboardType: TextInputType.emailAddress,
                valid:(val) {
                return validatorInput(val!, 5, 100, "email");
              }, hinit:"12".tr, controller: controller.email, label: "18".tr, iconData: Icons.email_outlined),
              CustomAuthTextFormField(
                 onTapIcon: () {
                  
                },
                obscureText: true,
               keyboardType: TextInputType.visiblePassword,
                valid: (val){
                return validatorInput(val!, 8, 100, "password");
              },hinit: "13".tr, controller: controller.password, label: "19".tr, iconData: Icons.lock_outlined),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Spacer(),
                              InkWell(
                                onTap: () {
                                controller.goToForgetPassword();
                                },
                                
                                child: Text("14".tr,style: const TextStyle(color: Coloronboarding.primarycolor,fontWeight: FontWeight.bold),))

                  ],
                ),
              ),

              Container(
                margin:  const EdgeInsets.only(top: 14),
                padding: const EdgeInsets.all(3),
                decoration:  BoxDecoration(
                  color: Coloronboarding.primarycolor,
                  borderRadius: BorderRadius.circular(25)
                ),
                child: MaterialButton(
                  onPressed: (){
                   controller.login();
                  },
                child:  Text(
                  "15".tr,style: const TextStyle(
                    color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17),),),
              ),
              const SizedBox(height: 5,),

      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Container(
          margin: const EdgeInsets.all(10),
          child:  Text("16".tr,style: const TextStyle(color: Coloronboarding.grey),),),
           InkWell(
            onTap: () {
                          controller.goToSignUp();},
             child: Text("17".tr,style: const TextStyle(color: Coloronboarding.primarycolor,fontWeight: FontWeight.bold),),
           )
          ],
      ),
     

            ],
          ),
        ),
      ))   );
  }
}