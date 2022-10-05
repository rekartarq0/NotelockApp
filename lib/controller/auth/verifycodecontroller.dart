import 'package:ecommerce/view/screen/Auth/successignup.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';

abstract class Verifycode extends GetxController{
      checkemail();
      goToSuccessSignUp();

}

class VerifycodeImp extends Verifycode{ 
  GlobalKey<FormState>formstate=GlobalKey<FormState>();
 late TextEditingController email;
  late TextEditingController phone;
  @override
  checkemail() {
    var formdata=formstate.currentState;
    if (formdata!.validate()) {
      Get.to(goToSuccessSignUp());
    }
    return "Not valid";

  }
  
  @override
  goToSuccessSignUp() {
      Get.to( const SuccesSignUpPage());
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