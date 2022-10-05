
import 'package:ecommerce/view/screen/Auth/login_page.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../view/screen/Auth/ForgetPassword/verifycodepage.dart';

abstract class LoginController extends GetxController{
      signup();
      goTologin();


}

class LoginControllerImp extends LoginController{ 
  GlobalKey<FormState>formstate=GlobalKey<FormState>();
 late TextEditingController email;
  late TextEditingController password;
  late TextEditingController username;
  late TextEditingController phone;

  bool isShowPassword=false;

  showPassword(){
    isShowPassword= isShowPassword ==true?false:true;
    update();
  }
  @override
  signup() {
   var formdata= formstate.currentState;
    if (formdata!.validate()) {
      Get.to(const VerifyCodePage());
      Get.delete<LoginControllerImp>();
    }
    return "Not valid";
    }
  
  @override
  goTologin() {
      Get.to(const LoginPage());
     Get.delete<LoginControllerImp>();

  }
  @override
  void onInit() {
    email=TextEditingController();
    password=TextEditingController();
     username=TextEditingController();
     phone=TextEditingController();
      super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    phone.dispose();
    username.dispose();
      super.dispose();
  }
}

