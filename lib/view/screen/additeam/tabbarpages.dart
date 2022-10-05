
import 'package:ecommerce/themes/themes.dart';
import 'package:ecommerce/view/screen/additeam/add_notes.dart';
import 'package:ecommerce/view/screen/additeam/add_task.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabbarPage extends StatefulWidget {
  const TabbarPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TabbarPageState createState() => _TabbarPageState();
}

class _TabbarPageState extends State<TabbarPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarextra(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              const SizedBox(height: 5,),
              Container(
                width: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: Get.isDarkMode?darkHeaderClr:bluishClr,
                    borderRadius: BorderRadius.circular(25)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: TabBar(
                        
                        unselectedLabelColor: Colors.grey.shade400,
                        labelColor: Colors.white,
                        indicatorColor: Colors.white,
                        indicatorWeight: 0.5,
                        indicator: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        controller: tabController,
                        tabs:  const [
                          Tab(

                            text: 'Task',
                            
                          ),
                          Tab(
                            text: 'Note',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: const [
                    AddTask(),
                    AddNotes()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


appbarextra(){
  return AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text("Add",style: Themes().subHeadingStyle,),
      );
}