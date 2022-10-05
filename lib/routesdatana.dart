import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/middlware/mymiddleware.dart';
import 'package:ecommerce/view/screen/Auth/ForgetPassword/forget_password.dart';
import 'package:ecommerce/view/screen/Auth/ForgetPassword/succesresetpassword.dart';
import 'package:ecommerce/view/screen/Auth/ForgetPassword/verifycodepage.dart';
import 'package:ecommerce/view/screen/Auth/ForgetPassword/resetpasswordpage.dart';
import 'package:ecommerce/view/screen/Auth/ForgetPassword/verifycodesignup.dart';
import 'package:ecommerce/view/screen/Auth/login_page.dart';
import 'package:ecommerce/view/screen/Auth/signuppage.dart';
import 'package:ecommerce/view/screen/Auth/successignup.dart';
import 'package:ecommerce/view/screen/languge/languge.dart';
import 'package:ecommerce/view/screen/onboarding.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page: () => const LanguagePage() , middlewares: [
    Mymiddleware()
  ]),
  GetPage(name: AppRoute.login, page: () =>  const LoginPage()),
  GetPage(name: AppRoute.signUp, page: () => const SignUpPage()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPasswordPage()),
  GetPage(name: AppRoute.verfiyCode, page: () => const VerifyCodePage()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPasswordPage()),
  GetPage(name: AppRoute.successResetpassword, page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccesSignUpPage()),
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),
  GetPage(name: AppRoute.verfiyCodeSignUp, page: () => const VerifyCodeSignUpPage()),
];
 