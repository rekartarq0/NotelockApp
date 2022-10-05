import 'package:ecommerce/themes/themes.dart';
import 'package:ecommerce/view/screen/Notes/notespage.dart';
import 'package:ecommerce/view/screen/additeam/tabbarpages.dart';
import 'package:ecommerce/view/screen/calender/calenderpage.dart';
import 'package:ecommerce/view/screen/home/homescreen.dart';
import 'package:ecommerce/view/screen/persondetail.dart/persondetail.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
   int currentpage=0;
  List<Widget>widgetPages=[
    const Homescreen(),
        const NotesPage(), 

    const TabbarPage(),
        const Calenderpage(),
    const PersonDetail(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       bottomNavigationBar: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25)
        ),
         child: GNav(
          activeColor: bluishClr,
          tabBackgroundColor: Colors.grey.shade400,
          gap: 8,   
          textStyle: Themes().bottomnavigationbar,
          color: Colors.grey.shade400,
          onTabChange: (value) {
            setState(() {
            currentpage=value;
          });
          },
          padding: const EdgeInsets.all(8),
          tabs:   const [
            GButton(icon: Icons.home,text: "Home"),
                        GButton(icon: Icons.note_alt_outlined,text: "note"),

            GButton(icon: Icons.add_circle_outline_outlined,text: "add",),
                        GButton(icon: Icons.calendar_month,text: "calender"),

            GButton(icon: Icons.person,text: "person"),
            
          ]),
       ),

        body: widgetPages.elementAt(currentpage),
    );
  }
}