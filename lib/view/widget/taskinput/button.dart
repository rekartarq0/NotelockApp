import 'package:flutter/material.dart';

import 'package:ecommerce/themes/themes.dart';

class MyButton extends StatelessWidget {
  final String label;
  final Function()? onTab;
  const MyButton({
    Key? key,
    required this.label,
    required this.onTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        width: 100,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: bluishClr
        ),
        child: Center(child: Text(label,textAlign: TextAlign.center,style: Themes().buttoncalender,)),
      ) ,
    );
  }
}
