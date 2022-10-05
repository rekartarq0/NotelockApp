
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomAuthTextFormField extends StatelessWidget {
  
  final String hinit;
  final String label;
  final IconData iconData;
  final TextEditingController? controller;
  final String? Function(String?) valid;
  final bool? obscureText;
  TextInputType? keyboardType;
  final void Function()? onTapIcon;

   CustomAuthTextFormField(
      {Key? key,
      required this.obscureText,
      required this.onTapIcon,
      required this.hinit,
      required this.label,
      required this.iconData,
      required this.controller,
      required this.valid,
      required this.keyboardType
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        obscureText: obscureText == null || obscureText == false ? false : true,
        keyboardType: keyboardType,
        validator: valid,
        controller: controller,
        decoration: InputDecoration(
            hintText: hinit,
            hintStyle: const TextStyle(fontSize: 14),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
            label: Container(
                margin: const EdgeInsets.symmetric(horizontal: 9),
                child: Text(label)),
            suffixIcon:InkWell(onTap: onTapIcon, child: Icon(iconData),),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
      ),
    );
  }
}