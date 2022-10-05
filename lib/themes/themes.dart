
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/constant/coloronboarding.dart';

const Color yellowClr=Color(0xFFFFB746);
const Color pinkClr=Color(0xFFff4667);
const Color orange=Color(0xCFFF9746);

const Color white=Colors.white;
const Color darkGreyClr=Color(0xFF121212);
const Color  darkHeaderClr=Color(0xFF424242);
const Color bluishClr=Coloronboarding.primarycolor;

class Themes{
  static final light=ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: white
    ),
    scaffoldBackgroundColor: Colors.white,
    primaryColor: bluishClr,
    brightness: Brightness.light
  );
    static final dark=ThemeData(
      appBarTheme: const AppBarTheme(
      backgroundColor: darkGreyClr
    ),
    scaffoldBackgroundColor: darkGreyClr,
    // ignore: deprecated_member_use
    backgroundColor: darkGreyClr,
    primaryColor: darkGreyClr,
    brightness: Brightness.dark
  );

  TextStyle get subHeadingStyle{
    return GoogleFonts.lato(
      textStyle:  TextStyle(
        fontSize: 24,fontWeight: FontWeight.bold,
        color: Colors.grey.shade400
      )
    );
  }

  
  TextStyle get headingStyle{
    return GoogleFonts.lato(
      textStyle: const TextStyle(
        fontSize: 30,fontWeight: FontWeight.bold
      )
    );
  }

  TextStyle get headingtask{
    return GoogleFonts.lato(
      textStyle:  TextStyle(
        color: Get.isDarkMode?Colors.white:Colors.grey[400],
        fontSize: 24,fontWeight: FontWeight.bold
      )
    );
  }

   
  TextStyle get buttoncalender{
    return GoogleFonts.lato(
      textStyle:  const TextStyle(
        fontSize: 18,fontWeight: FontWeight.bold,
color: Colors.white,      )
    );
  }
  
  TextStyle get datetextpiker{
    return GoogleFonts.lato(
              textStyle:  const TextStyle(
              fontSize: 20,fontWeight: FontWeight.w600,
              color: Colors.grey)
            );
  }


   TextStyle get daytextpiker{
    return  GoogleFonts.lato(
              textStyle:  const TextStyle(
              fontSize: 16,fontWeight: FontWeight.w600,
              color:Colors.grey,),
            );
  }


   TextStyle get monthtextpiker{
    return  GoogleFonts.lato(
              textStyle:  const TextStyle(
              fontSize: 14,fontWeight: FontWeight.w600,
              color: Colors.grey,),
            );
  }

   TextStyle get bottomnavigationbar{
    return  GoogleFonts.lato(
              textStyle: const TextStyle(
              fontSize: 14,fontWeight: FontWeight.w600,
              color: bluishClr),
            );
  }

    TextStyle get titlestyle{
    return  GoogleFonts.lato(
              textStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Get.isDarkMode?Colors.white:Colors.black),
            );
  }

  
    TextStyle get todoiscomplete{
    return  GoogleFonts.lato(
              textStyle: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color:Colors.white),
            );
  }


    TextStyle get todoTimestart{
    return  GoogleFonts.lato(
              textStyle:  TextStyle(
              fontSize: 13,
              color:Colors.grey[100]),
            );
  }


      TextStyle get subtitlestyle{
    return  GoogleFonts.lato(
              textStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Get.isDarkMode?Colors.grey[100]:Colors.grey[600]),
            );
  }

   TextStyle get noteTitle{
    return GoogleFonts.lato(
      textStyle: TextStyle(
        fontSize: 30,fontWeight: FontWeight.bold,
        color: Get.isDarkMode?Colors.white:Colors.black,
      )
    );
  }

   TextStyle get notecontent{
    return GoogleFonts.lato(
      textStyle: TextStyle(
        fontSize: 22,fontWeight: FontWeight.w400,
        color: Get.isDarkMode?Colors.white:Colors.black,
      )
    );
  }
   TextStyle get cardtitle{
    return GoogleFonts.lato(
      textStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Get.isDarkMode?Colors.white:Colors.black,
      )
    );
  }
  
}
