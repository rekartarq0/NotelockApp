import 'package:ecommerce/core/localization/changelocal.dart';
import 'package:ecommerce/core/services/notificationservices.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/core/services/theme_service.dart';
import 'package:ecommerce/themes/themes.dart';
import 'package:ecommerce/view/screen/home/bottomnavigationbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
late SharedPreferences sharepref;

void main()async {
WidgetsFlutterBinding.ensureInitialized();
sharepref=await SharedPreferences.getInstance();

NotifyHelper().initializeNotification();
await GetStorage.init();
await initializServices();
runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    LocaleController localeController=Get.put(LocaleController());
    return GetMaterialApp(
      // translations: TTranslations(),
      // locale: localeController.language,
      // fallbackLocale: const Locale('en', 'US'),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme:Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeService().theme,
     home: const BottomNavigation(),
    //  getPages: routes,      
    );
  }
}
