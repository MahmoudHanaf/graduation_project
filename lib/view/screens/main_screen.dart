// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:graduation_project/logic/controllers/main_controller.dart';
import 'package:graduation_project/routes/routes.dart';
import 'package:graduation_project/utils/theme.dart';
import 'package:graduation_project/view/screens/Home_screen.dart';
import 'package:graduation_project/view/screens/profile_screen.dart';
import 'package:graduation_project/view/screens/setting_screen.dart';
import 'package:graduation_project/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/io_client.dart';

import '../../logic/controllers/auth_controller.dart';
import '../../services/category_service.dart';

class mainScreen extends StatefulWidget {
  mainScreen({Key? key}) : super(key: key);

  @override
  State<mainScreen> createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  List imgList = [
     'assets/images/mm4.png',
    'assets/images/m8.png',
    'assets/images/m3.png',
    'assets/images/m10.png',
  ];
  List<Widget> screens = <Widget>[
    HomeScreen(),
    SettingsScreen(),
  ];

  int? currentIndex;
  int? itemIndex = 1;
  final controller = Get.find<mainConrtoller>();
  
  @override
  void initState() {
   
    CategoryService.getHomePageCategories();
    
    super.initState();
    Get.put(mainConrtoller());
    Get.put(AuthController());
  }


  
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
          // backgroundColor: Colors.white,
          body: IndexedStack(
            index: controller.itemIndex.value,
            children: controller.items.value,
          ),
          bottomNavigationBar: ConvexAppBar(
            elevation: 2,
            backgroundColor: Colors.grey[50],
            activeColor: mainColor,
            style: TabStyle.fixedCircle,
            color: mainColor,
            top: -25,
            height: 55,
            items: [
              TabItem(
                icon:Icon( Icons.tips_and_updates_outlined,size: 30,color: Colors.grey[600]),
                title: ' النصائح',
              ),
              TabItem(icon: Icons.home_outlined, title: '', ),
              TabItem(icon: Icon(Icons.settings_outlined,size: 30, color: Colors.grey[600],), title: 'الاعدادات'),
            ],
            initialActiveIndex: 1,
            onTap: (index) {
              if (index == 0) {
                Get.toNamed(Routes.TipsScreen);
              } else if (index == 2) {
                Get.toNamed(Routes.SettingsScreen);
              }
            },
    
          ));
    });
  }

  Container buildContainer(index) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: currentIndex == index ? Colors.red : Colors.grey.shade300),
    );
  }
  // void changeItem(int index){
  //   print(itemIndex);
  //   setState(() {

  //     itemIndex=index;

  //   });
  // }
}
