import 'package:flutter/material.dart';

class PersonDetail extends StatelessWidget {
  const PersonDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("person"),
      ),
    );
  }
}