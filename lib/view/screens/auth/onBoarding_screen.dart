// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'dart:async';

import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:graduation_project/cache_helper/cache_helper.dart';
import 'package:graduation_project/routes/routes.dart';
import 'package:graduation_project/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
      Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarBrightness: Brightness.dark,
          ),
        backgroundColor: Colors.white, elevation: 0, actions: [
        TextButton(
            onPressed: () {
              Timer(Duration(seconds: 2), () {
                CacheHelper.setBoardingScreen(true);
                Get.offNamed(Routes.WelcomeScreen);
              });
            },
            // ignore: prefer_const_constructors
            child: Text(
              "تخطى",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ))
      ]),
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: IntroductionScreen(
          
          pages: [
            PageViewModel(
              
              decoration:PageDecoration (pageColor: Colors.white) ,
              title: "In an urgant situation ? ",
              bodyWidget: 
                  // Text("In an urgant situation ? "),
                  Center(
                    child: Container(
                      // color: Colors.amber,
                      width: MediaQuery.of(context).size.width * .6,
                      child: Text(
                        "Post your case now and get a hand from others around you",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500
                        ),
                        ),
                    ),
                  ),
               
              image: Center(
                  child: Image.asset(
                filterQuality: FilterQuality.low,
                "assets/images/intro1.jpg",
                fit: BoxFit.fill,
              )),
            ),
            PageViewModel(
              decoration:PageDecoration (pageColor: Colors.white) ,
              title: "Call now for help !",
              bodyWidget: Center(
                    child: Container(
                      // color: Colors.amber,
                      width: MediaQuery.of(context).size.width * .6,
                      child: Text(
                        "You can call easily to help you in urgant situation ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500
                        ),
                        ),
                    ),
                  ),
              image: Center(
                  child: Image.asset(
                'assets/images/intro2.png',
              )),
            ),
            PageViewModel(
              decoration:PageDecoration (pageColor: Colors.white) ,
              title: "Safty Score",
              bodyWidget: Center(
                    child: Container(
                      // color: Colors.amber,
                      width: MediaQuery.of(context).size.width * .7,
                      child: Text(
                        "Stay updated with the safe and unsafe areas in and around your location ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500
                        ),
                        ),
                    ),
                  ),
              image: Center(
                child: Image.asset('assets/images/intro3.png',
                    colorBlendMode: BlendMode.color),
              ),
            ),
          ],
          onDone: () {
            Timer(Duration(seconds: 2), () {
              CacheHelper.setBoardingScreen(true);
              Get.offNamed(Routes.WelcomeScreen);
            });
          },
          onSkip: () {
            CacheHelper.setBoardingScreen(true);
          },
          showBackButton: false,
          showNextButton: true,
          next: Container(
            color: Colors.white,
            child: CircleAvatar(
              radius: 24,
              backgroundColor: mainColor,
              child: const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.white,
                size: 25,
              ),
            ),
          ),
          done: GestureDetector(
            child: Container(
              color: Colors.white,
              child: const Text("تم",
                  style: TextStyle(fontWeight: FontWeight.w700, color: mainColor, fontSize: 18)),
            ),
          ),
          dotsDecorator: DotsDecorator(
              size: const Size.square(10.0),
              activeSize: const Size(20.0, 10.0),
              activeColor: mainColor,
              color: Colors.black26,
              spacing: const EdgeInsets.symmetric(horizontal: 3.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0))),
        ),
      ),
    );
  }
}
