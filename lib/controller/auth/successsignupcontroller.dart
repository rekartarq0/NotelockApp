import 'package:ecommerce/view/screen/Auth/login_page.dart';
import 'package:get/get.dart';

abstract class SuccessSignUpController extends GetxController{
  goToPageLogin();
}
class SuccessSignUpControllerImp extends SuccessSignUpController{
  @override
  goToPageLogin() {
    Get.offAll(const LoginPage()); 
  }
}