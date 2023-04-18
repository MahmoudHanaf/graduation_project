// ignore_for_file: prefer_const_constructors, sort_child_properties_last


import 'dart:io';
import 'dart:ui';

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:graduation_project/logic/controllers/auth_controller.dart';
import 'package:graduation_project/routes/routes.dart';
import 'package:graduation_project/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/category_service.dart';
import '../widgets/category_card.dart';
import '../widgets/text_utils.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List imgList = [
    'assets/images/mm4.png',
    'assets/images/m8.png',
    'assets/images/m3.png',
    'assets/images/m10.png',
  ];
  int? currentIndex;

  final controller = Get.find<AuthController>();

  final Connectivity _connectivity = Connectivity();
  
   bool connection = true ;
   initialdata () async
   {
     _connectivity.onConnectivityChanged.listen((event) {
         if(event == ConnectivityResult.none)
         {
            setState(() {
              connection =false;
            });
         }else{
            setState(() {
              connection =true;
            });
         }
      },);
   }


  @override
  void initState() {
    initialdata();
     
    super.initState();

  }

  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Get.toNamed(Routes.ProfileScreen);
                },
                icon: controller.profilePhoto == 'Empty'
                    ? CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey[300],
                      child: Icon(
                          Icons.person,
                          size: 27,
                          color: Colors.grey[100],
                        ),
                    )
                    : Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 0.1),
                            image: DecorationImage(
                                image: FileImage(File(controller.profilePhoto)),
                                fit: BoxFit.fitWidth)),
                      )),
            backgroundColor: Colors.white,
            title: Textutils(
                color: Colors.black,
                fontSize: 34,
                fontWeight: FontWeight.bold,
                text: 'طارئ',
                underline: TextDecoration.none),
            centerTitle: true,
            elevation: .5,
            actions: 
            [
              // IconButton(
              //   icon: Icon (
              //     Icons.phone_enabled,
              //      size: 38,
              //      color: mainColor,
              //     ),
              //   onPressed: () async
              //   {
                 
              //   },
              //   )

               PopupMenuButton(
                    constraints: BoxConstraints(minWidth: 150),
                    icon: Icon(
                      Icons.call,
                      color: Colors.red,
                      size: 36,
                    ),
                    itemBuilder: (context) => [
                          PopupMenuItem(
                              child: Row(children: [
                                Text(180.toString()),
                                Spacer(),
                                Text('المطافيء')
                              ]),
                              onTap: () {
                                // if (controller.firstPhone != null ||
                                //     controller.firstPhone!.isNotEmpty) {
                                //   launchUrl(Uri.parse("tel://180"));
                                // }
                              }),
                          PopupMenuItem(
                              child: Row(
                                children: [
                                  Text(122.toString()),
                                  Spacer(),
                                  Text('الشرطة')
                                ],
                              ),
                              onTap: () {
                                // if (controller.secondPhone != null ||
                                //     controller.secondPhone!.isNotEmpty) {
                                //   launchUrl(Uri.parse("tel://122"));
                                // }
                              }),
                          PopupMenuItem(
                              child: Row(
                                children: [
                                  Text(123.toString()),
                                  Spacer(),
                                  Text('الإسعاف')
                                ],
                              ),
                              onTap: () {
                                // if (controller.thirdPhone != null ||
                                //     controller.thirdPhone!.isNotEmpty) {
                                //   launchUrl(Uri.parse("tel://123"));
                                // }
                              }),
                        ])
            ],
            // ignore: prefer_const_literals_to_create_immutables
          ),
          body: ListView(
            scrollDirection: Axis.vertical,
            
            children: [
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 15),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(10)),
                    height: 210,
                    child: CarouselSlider.builder(
                        itemCount: imgList.length,
                        itemBuilder: (context, index, realIndex) {
                          return Container(
                              width: double.infinity,
                              margin: EdgeInsets.symmetric(horizontal: 0),
                              child: ClipRRect(
                                child: Image.asset(
                                  imgList[index],
                                  fit: BoxFit.fill,
                                  width: double.infinity,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ));
                        },
                        options: CarouselOptions(
                            height: 190,
                            initialPage: 0,
                            autoPlay: true,
                            onPageChanged: (index, _) {
                              setState(() {
                                currentIndex = index;
                              });
                            },
                            enlargeCenterPage: true,
                            autoPlayCurve: Curves.linear)),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildContainer(0),
                      SizedBox(
                        width: 5,
                      ),
                      buildContainer(1),
                      SizedBox(
                        width: 5,
                      ),
                      buildContainer(2),
                       SizedBox(
                        width: 5,
                      ),
                      buildContainer(3),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  connection == false ?
                  Center(
                    child: 
                    Column(
                      children: [
                        SizedBox(height: 30,),
                        Image.asset(
                          "assets/images/wifi.png",
                           fit: BoxFit.fill,
                           width: 80,
                           height: 80,
                          ),
                        Text(
                          "لا يتوفر اتصال بالانترنت",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800
                          ),
                        ),
                      ],
                    )
                    )
                  :
                  CategoryService.category == null ||
                          CategoryService.category.isEmpty
                      ? Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 25,
                              ),
                              CircularProgressIndicator(color: mainColor),
                            ],
                          ),
                        )
                      : Wrap(
                          spacing: 15,
                          runSpacing: 0,
                          children: CategoryService.category
                              .map((e) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CategoryCard(
                                      category: e,
                                    ),
                                  ))
                              .toList(),
                        ),
                    SizedBox(height: 20,),    
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildContainer(index) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: currentIndex == index ? Colors.red : Colors.grey.shade400),
    );
  }
}
