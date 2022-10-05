
import 'package:ecommerce/themes/themes.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DateCustomInput extends StatelessWidget {
  
  final String hinit;
  final String title;
  final IconData iconData;
  final TextEditingController? controller;
  TextInputType? keyboardType;
  final void Function()? onTapIcon;

   DateCustomInput(
      {Key? key,
      required this.onTapIcon,
      required this.title,
      required this.hinit,
      required this.iconData,
      required this.controller,
      required this.keyboardType
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(title,style: Themes().titlestyle,),

          const SizedBox(height: 5,),

            Container(
              margin: const EdgeInsets.only(top: 8),
              padding: const EdgeInsets.only(left: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.grey.shade400
                )
              ),
              child: TextFormField(
                keyboardType: keyboardType,
                autofocus: false,
                controller: controller,
                style: Themes().subtitlestyle,
                decoration:  InputDecoration(
                  hintStyle: Themes().subtitlestyle,
                  contentPadding: const EdgeInsets.all(10),
                  hintText: hinit,
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: bluishClr,
                      width: 0
                    
                    )
                  ),
                  suffixIcon:InkWell(onTap: onTapIcon, child: Icon(iconData),),
                  // border: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(12))
                ),
              ),
            )
        ],
      ),
    );
  }
}


// Container(
//       margin: const EdgeInsets.only(bottom: 20),
//       child: TextFormField(
//         keyboardType: keyboardType,
//         controller: controller,
//         decoration: InputDecoration(
//             hintText: hinit,
//             hintStyle: const TextStyle(fontSize: 14),
//             floatingLabelBehavior: FloatingLabelBehavior.always,
//             contentPadding:
//                 const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
//             label: Container(
//                 margin: const EdgeInsets.symmetric(horizontal: 9),
//                ),
//             suffixIcon:InkWell(onTap: onTapIcon, child: Icon(iconData),),
//             border:
//                 OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
//       ),
//     );