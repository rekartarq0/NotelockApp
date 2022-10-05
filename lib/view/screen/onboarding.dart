import 'package:ecommerce/core/constant/coloronboarding.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/data/datasource/static/static.dart';
import 'package:ecommerce/view/screen/Auth/signuppage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    PageController pageViewController=PageController(viewportFraction: 0.8);
    return Scaffold(
      backgroundColor: Coloronboarding.backGroundColor,
      body:SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                controller: pageViewController,
                itemCount: onBoardingModelList.length,
                itemBuilder: (context, index) => Column(
                children: [
                  Image.asset(onBoardingModelList[index].image!,width: double.infinity,height: 350,fit: BoxFit.contain,),
                  const SizedBox(height: 80,),
                  
                  Text(onBoardingModelList[index].title!,style: Theme.of(context).textTheme.displayLarge),
                  const SizedBox(height: 30,),
                  Text(onBoardingModelList[index].body!,textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge ),
                ],
              ),),
            ),

            Expanded(child: Column(
              children: [

                  SmoothPageIndicator(
                    controller: pageViewController,
                     count: onBoardingModelList.length,
                     effect: const ExpandingDotsEffect(
                      dotHeight: 6,dotWidth: 6,
                      spacing: 4,
                      activeDotColor: Coloronboarding.primarycolor
                     ),
                     ),
                    
                      const SizedBox(height: 40,),

                      
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [

                        //Login Button
                         Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25)
                        ),
                        margin: const EdgeInsets.only(bottom:15 ),
              height: 40,
              width: MediaQuery.of(context).size.width/2,

              child: MaterialButton(
                
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                elevation: 2.2,
                textColor: Colors.white,
                color: Coloronboarding.primarycolor,
                padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 0),
                onPressed: (){
                  Get.toNamed(AppRoute.login);
                },
                child:  Text("9".tr,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                ),
            ),
            
            //Sign Up Button
                    Container(
                        
                        margin: const EdgeInsets.only(bottom:15 ),
              height: 40,
            width: MediaQuery.of(context).size.width/2,

              child: MaterialButton(
                
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    width: 1.2,
                    color: Coloronboarding.grey
                  ),
                  borderRadius: BorderRadius.circular(25)),
                elevation: 2.2,
                textColor: Coloronboarding.grey,
                
                padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 0),
                onPressed: (){
                 
             Get.to(const SignUpPage());

                },
                child: Text("17".tr,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                ),
            ),
                      ],
                     ),
            
              ],

            )),

           
          ],
        ),
      )
    );
  }
}
