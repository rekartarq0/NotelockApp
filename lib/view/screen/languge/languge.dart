import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/localization/changelocal.dart';
import 'package:ecommerce/view/widget/LanguageCustom/languagebutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/state_manager.dart';

class LanguagePage extends GetView<LocaleController> {
  const LanguagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column( 
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              
              children: [  
                 Text("1".tr,style: const TextStyle(fontSize: 22),),
              const SizedBox(height: 20,),
         LanguageCustom(text: "Ar", onPressed: (){
            controller.changeLang("ar");
            Get.toNamed(AppRoute.onBoarding);
    }),
         LanguageCustom(text: "En", onPressed: (){
          controller.changeLang("en");
          Get.toNamed(AppRoute.onBoarding);
    }),
         LanguageCustom(text: "ku", onPressed: (){
          controller.changeLang("ku");
          Get.toNamed(AppRoute.onBoarding);   }),],
            )
          ],
        )


        
          
        ],
      ),
    );
  }
}