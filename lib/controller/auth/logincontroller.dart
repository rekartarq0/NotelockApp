import 'package:ecommerce/view/screen/Auth/ForgetPassword/forget_password.dart';
import 'package:ecommerce/view/screen/Auth/signuppage.dart';
import 'package:ecommerce/view/screen/home/homescreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class Loginpagee extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
}

class LoginpageeImp extends Loginpagee {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;

  @override
  login() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      Get.offAll(const Homescreen());
    } else {
    }
  }

  @override
  goToSignUp() {
    Get.off(const SignUpPage());
   Get.delete<LoginpageeImp>();

  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.to(const ForgetPasswordPage());
    Get.delete<LoginpageeImp>();

  }
}