import 'package:ecommerce/core/constant/themedata.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class LocaleController extends GetxController {

Locale? language ;  

Myservices myServices = Get.find()  ;

ThemeData apptheme=themeEnglish;

changeLang(String langcode){
 Locale locale = Locale(langcode) ; 
 myServices.sharepref.setString("lang", langcode) ; 
 apptheme = langcode=="ar"?themeArabic:themeEnglish;
 Get.changeTheme(apptheme);
 Get.updateLocale(locale) ; 
}


@override
  void onInit() {

    String? sharedPrefLang = myServices.sharepref.getString("lang") ;  
    if (sharedPrefLang == "ar"){
      language = const Locale("ar")  ;
      apptheme =themeArabic;
    }else if (sharedPrefLang == "en"){
      language = const Locale("en")  ;
      apptheme = themeEnglish;
    }else if(sharedPrefLang == "ku"){
      language =const Locale("ku");
    }else {
      language = Locale(Get.deviceLocale!.languageCode) ; 
      apptheme =themeEnglish;
    }
    super.onInit();
  }


}