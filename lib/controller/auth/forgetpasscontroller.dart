import 'package:ecommerce/view/screen/Auth/ForgetPassword/verifycodepage.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class ForgetPassword extends GetxController{
      checkemail();
      goToVerifyCode();

}

class ForgetPasswordImp extends ForgetPassword{ 
  GlobalKey<FormState>formstate=GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController phone;
  @override
 checkemail() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
    } else {
    }
  }
  
  @override
  goToVerifyCode() {
      Get.to(const VerifyCodePage());
            Get.delete<ForgetPasswordImp>();

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

