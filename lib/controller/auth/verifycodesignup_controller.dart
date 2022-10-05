import 'package:ecommerce/view/screen/Auth/successignup.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';

abstract class VerifycodeSignup extends GetxController{
      checkemail();
      goToVerifyRestPassword();

}

class VerifycodeSignupImp extends VerifycodeSignup{ 
 late TextEditingController email;
  late TextEditingController phone;
  @override
  checkemail() {

  }
  
  @override
  goToVerifyRestPassword() {
      Get.to(const SuccesSignUpPage());
  }
  @override
  void onInit() {
    email=TextEditingController();
     phone=TextEditingController();
      super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    phone.dispose();
      super.dispose();
  }
}