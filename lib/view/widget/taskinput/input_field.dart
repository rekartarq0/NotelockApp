

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ecommerce/themes/themes.dart';

class InputFieldAddTask extends StatelessWidget {
  const InputFieldAddTask({
    Key? key,
    required this.title,
    required this.hinit,
    required this.valid,
    this.controller,
    this.widget,
  }) : super(key: key);
  final String title;
  final String hinit;
  final String? Function(String?) valid;
  final TextEditingController? controller;
  final Widget? widget;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top:6 ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,style: Themes().titlestyle,
          ),

          Row(
            children: [
              Expanded
              (child: TextFormField(
                autofocus: false,
                validator: valid,
                readOnly: widget == null ?false:true,
                cursorColor: Get.isDarkMode?Colors.grey[100]:Colors.grey[700],
                controller: controller,
                style: Themes().subtitlestyle,
                decoration: InputDecoration(
                  hintText: hinit,
                  hintStyle:Themes().subtitlestyle ,
                   floatingLabelBehavior: FloatingLabelBehavior.auto,
                   labelText: hinit,
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: bluishClr
                    )
                  )
                ),
              )
              ),
              widget??Container()
          
            ],
          )
        ],
      ),
    );
  }
}





// import 'package:ecommerce/themes/themes.dart';
// import 'package:flutter/material.dart';

// // ignore: must_be_immutable
// class MyinputField extends StatefulWidget {
  
//   final String hinit;
//   final String title;
//   final TextEditingController? controller;
//   TextInputType? keyboardType;

//    MyinputField(
//       {Key? key,
//       required this.hinit,
//       required this.controller,
//       required this.keyboardType,
//       required this.title
//       })
//       : super(key: key);

//   @override
//   State<MyinputField> createState() => _MyinputFieldState();
// }

// class _MyinputFieldState extends State<MyinputField> {
  
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [

//           Text(widget.title,style: Themes().titlestyle,),

//           const SizedBox(height: 5,),

//             Container(
//               margin: const EdgeInsets.only(top: 8),
//               padding: const EdgeInsets.only(left: 14),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(12),
//                 border: Border.all(
//                   color: Colors.grey.shade400
//                 )
//               ),
//               child: TextFormField(
//                 keyboardType: widget.keyboardType,
//                 autofocus: false,
//                 controller: widget.controller,
//                 style: Themes().subtitlestyle,
//                 decoration:  InputDecoration(
//                   hintStyle: Themes().subtitlestyle,
//                   contentPadding: const EdgeInsets.all(10),
//                   hintText: widget.hinit,
//                   focusedBorder: const UnderlineInputBorder(
//                     borderSide: BorderSide(
//                       color: bluishClr,
//                       width: 0
                    
//                     )
//                   ),
//                   // border: OutlineInputBorder(
//                   //   borderRadius: BorderRadius.circular(12))
//                 ),
//               ),
//             )
//         ],
//       ),
//     );
//   }
// }