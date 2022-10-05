import 'package:ecommerce/core/constant/coloronboarding.dart';
import 'package:flutter/material.dart';

ThemeData themeEnglish= ThemeData(
        fontFamily: "PlayfairDisplay",
        textTheme:  const TextTheme(

          // ignore: deprecated_member_use
          headline1:  TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Coloronboarding.black), 
          // ignore: deprecated_member_use
          bodyText1:  TextStyle(height: 1.5,color: Coloronboarding.grey,fontWeight: FontWeight.bold,fontSize: 17),
          
        ), colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(background: Coloronboarding.primarycolor),
      );

      ThemeData themeArabic= ThemeData(
        fontFamily: "cairo",
        textTheme:  const TextTheme(
                    // ignore: deprecated_member_use
          headline1:  TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Coloronboarding.black), 
          // ignore: deprecated_member_use
          bodyText1:  TextStyle(height: 1.5,color: Coloronboarding.grey,fontWeight: FontWeight.bold,fontSize: 17),
          
        ), colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(background: Coloronboarding.primarycolor),
      );