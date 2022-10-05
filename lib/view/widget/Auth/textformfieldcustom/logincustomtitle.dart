// ignore: file_names
import 'package:flutter/widgets.dart';

class LoginCustomTitle extends StatelessWidget {
  final String text;
  const LoginCustomTitle({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Text(text,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 22,),textAlign: TextAlign.center,);
  }
}

