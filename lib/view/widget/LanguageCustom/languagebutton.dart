
import 'package:ecommerce/core/constant/coloronboarding.dart' show Coloronboarding;
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LanguageCustom extends StatelessWidget {
  final String text;
  void Function()? onPressed;
  LanguageCustom({
    Key? key,
    required this.text,
    required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
              color: Coloronboarding.primarycolor,
              margin: const EdgeInsets.only(bottom: 15),
              child: MaterialButton(onPressed: onPressed,
              textColor: Colors.white,child: Text(text),
              ),
            );
  }
}
