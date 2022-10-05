import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Mymiddleware extends GetMiddleware {
  @override
  int? get priority => 1;

  Myservices myServices = Get.find() ; 

  @override
  RouteSettings? redirect(String? route) {
     if(myServices.sharepref.getString("Onboarding")=="1"){
      return const RouteSettings(name: AppRoute.login) ; 
     }
     return const RouteSettings(name: AppRoute.login) ;
    
  }
}


