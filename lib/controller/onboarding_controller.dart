import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/static/static.dart';
import 'package:ecommerce/view/screen/Auth/login_page.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class OnboardingController extends GetxController{

  next();
  onPageChanged(int index);

}
class OnboardingControllerImp extends OnboardingController{

  late PageController pageController;
  int currentPage=0;
  Myservices myServices = Get.find() ; 


  @override
  next() {
    currentPage++;

     if (currentPage > onBoardingModelList.length - 1) {
       Myservices().sharepref.setString("Onboarding", "1");
       Get.off(const LoginPage()) ; 
    } else {
      pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    }
  }
  
  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController =PageController();
      super.onInit();
  }

  }
