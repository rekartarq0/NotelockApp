import 'package:get/get.dart';

validatorInput(String val,int min, int max,String type) {

  if (type == "text") {
    if (GetUtils.isNull(val)) {
      return "not valid text";
    }
  } 
  
  if (type == "num") {
    if (!GetUtils.isNum(val)) {
      return "not valid num";
    }
  } 
  
  if (type == "Date") {
    if (!GetUtils.isDateTime(val)) {
      return "not valid Date";
    }
  }

  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "not valid username";
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "not valid email";
    }
  }

  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "not valid phone";
    }
  }

  if (val.isEmpty) {
    return "can't be Empty";
  }

  if (val.length < min) {
    return "can't be less than $min";
  }

  if (val.length > max) {
    return "can't be larger than $max";
  }
}