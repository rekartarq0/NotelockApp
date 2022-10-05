import 'package:ecommerce/core/function/check_interner.dart';
import 'package:flutter/material.dart';

class TestApp extends StatefulWidget {
  const TestApp({Key? key}) : super(key: key);

  @override
  State<TestApp> createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {

  // ignore: prefer_typing_uninitialized_variables
  var res;
 
 initaldata()async{
  res=await checkinternet();
 }

 @override
  void initState() {

    initaldata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(

    );
  }
}