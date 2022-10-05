import 'package:ecommerce/view/screen/Auth/login_page.dart';
import 'package:get/get.dart';

abstract class SuccessResetPasswordController extends GetxController{
  goToPageLogin();

}

class SuccessResetPasswordControllerImp extends SuccessResetPasswordController{
  @override
  goToPageLogin() {
    Get.offAll(const LoginPage());
         Get.delete<SuccessResetPasswordControllerImp>();


  }

}