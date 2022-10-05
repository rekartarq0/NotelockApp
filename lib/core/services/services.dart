import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Myservices extends GetxService{

  late SharedPreferences sharepref;

  Future<Myservices>init()async{
    sharepref =await SharedPreferences.getInstance();
    return this;
  }
}

initializServices()async{
   await Get.putAsync(() => Myservices().init());
}
