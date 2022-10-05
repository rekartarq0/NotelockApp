import 'package:ecommerce/themes/themes.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    Key? key,
    required this.label,
    required this.onTab,
  }) : super(key: key);
  final String label;
  final Function() onTab; 
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: bluishClr
        ),
        width: 100,
        height: 45,
        child: Text(label,style: const TextStyle(
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
