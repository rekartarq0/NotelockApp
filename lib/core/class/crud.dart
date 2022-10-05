import 'dart:convert';

import 'package:http/http.dart' as http;

class Crud{

  getdata(String url)async{
    var response=await http.get(Uri.parse(url));
    if (response.statusCode ==200) {
      var responsebody=jsonDecode(response.body);
       return responsebody;
    }
  }

  postdata(String url , Map data)async{
    var response=await http.post(Uri.parse(url),body: data);
    if (response.statusCode ==200) {
      var responsebody=jsonDecode(response.body);
      return responsebody;
    }
  }

  
}