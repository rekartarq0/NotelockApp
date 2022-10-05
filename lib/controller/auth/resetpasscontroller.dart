import 'package:ecommerce/view/screen/Auth/ForgetPassword/succesresetpassword.dart';
import 'package:ecommerce/view/screen/Auth/login_page.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class ResetPassword extends GetxController{
      resetPassword();
      goToSuccessResetPassword();

}

class ResetPasswordImp extends ResetPassword{ 
 late TextEditingController password;
  late TextEditingController newPassword;
  @override
  resetPassword() {
    Get.to(const LoginPage());
     Get.delete<ResetPasswordImp>();

  }
  
  @override
  goToSuccessResetPassword() {
      Get.to(const SuccessResetPassword());
     Get.delete<ResetPasswordImp>();

  }
  @override
  void onInit() {
    password=TextEditingController();
     newPassword=TextEditingController();
      super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    newPassword.dispose();
      super.dispose();
  }
}

