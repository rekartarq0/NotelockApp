import 'package:flutter/material.dart';

class Calenderpage extends StatelessWidget {
  const Calenderpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Calender"),
      ),
    );
  }
}