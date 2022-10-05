import 'package:ecommerce/themes/themes.dart';
import 'package:flutter/material.dart';


class Tasktile extends StatelessWidget {
  const Tasktile({
    Key? key,
    this.onTap,
   required this.color,
   required this.starttime,
   required this.endtime,
   required this.title,
   required this.note,
   required this.iscomplete
  }) : super(key: key);
final void Function()? onTap;
final int color;
final int iscomplete;

final String title;
final String note;
final String starttime;
final String endtime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal:  
          4),
          child: InkWell(
            onTap: onTap,
            child: Container(
               margin: const EdgeInsets.only(bottom: 12),
               child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: getbGclr(color)
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Text(title,style: Themes().todoTimestart,),

                          
          
                          const SizedBox(height: 12,), 
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children:   [
                          Icon(Icons.access_time_rounded,
                          color: Colors.grey[200],
                          size: 18,
                          ),
                          const SizedBox(width: 12,),
                           Text("$starttime - $endtime",
                          style: Themes().todoTimestart,
                          ),                       
                            ],
                          ),
                          const SizedBox(height: 12,),
                          Text(note,style: Themes().todoTimestart,)
                        ],
                      ),
                    )),
                    Container(
                     margin: const EdgeInsets.symmetric(horizontal: 10),
                     height: 60,
                     width: 0.5,
                     color: Colors.grey[200]!.withOpacity(0.7), 
                    ),
                    const RotatedBox(quarterTurns: 5,
                 ),
          
                      Container(
                     margin: const EdgeInsets.symmetric(horizontal: 10),
                     height: 60,
                     width: 0.5,
                     color: Colors.grey[200]!.withOpacity(0.7), 
                    ),
          
                    RotatedBox(quarterTurns: 3,
                    child: Text(iscomplete==0?"TODO":"Complete",
                    style: Themes().todoiscomplete,
                    ),
                    ),
                  ],
                ),
               ),
            ),
          ),
    );
  }
  
  getbGclr(int? color) {
    switch(color){
      case 0:
      return bluishClr;     
       case 1:
      return pinkClr;    
        case 2:
      return orange;
        case 3:
        return bluishClr;
    }
  }
}
