// ignore_for_file: prefer_const_constructors

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

import 'package:graduation_project/logic/controllers/shared_controller.dart';
import 'package:graduation_project/routes/routes.dart';
import 'package:graduation_project/view/screens/auth/onBoarding_screen.dart';

import '../../cache_helper/cache_helper.dart';
import '../../logic/controllers/main_controller.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late String nextWidget;

  @override
  void initState() {
    super.initState();
    ScreensDirectipon();
  }

  void ScreensDirectipon ()
  {
  
     bool? isBoarding = CacheHelper.getBoardingScreen();
    bool? isLogin = CacheHelper.getBoolean('isLogin');
    bool? isOtp = CacheHelper.getBoolean('isOtp');

    if (isBoarding != null) {
      if (isOtp != null) {
        if (isOtp) {
          if (isLogin != null) {
            if (isLogin) {
              Get.put(mainConrtoller());
              nextWidget = Routes.mainScreen;
            //  nextWidget = Routes.WelcomeScreen;
            } else {
              nextWidget = Routes.WelcomeScreen;
            }
          } else {
            nextWidget = Routes.WelcomeScreen;
          }
        } else {
          nextWidget = Routes.OtpForm;
        }
      } else {
        nextWidget = Routes.OtpForm;
      }
    } else {
      nextWidget = Routes.OnBoardingScreen;
    }
   }

  @override
  Widget build(BuildContext context) {
    Get.put(SharedController());
    return Scaffold(
      //  body:EasySplashScreen(logo: Image.asset('assets/images/ambulance.png'),navigator: WelcomeScreen()),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: AnimatedSplashScreen(
                //  splash: 'assets/images/ambulance.png',
                splash: Lottie.asset('assets/images/81399-alerta.json'),
                nextScreen: OnBoardingScreen(),
                splashIconSize: 240,
                splashTransition: SplashTransition.slideTransition,
                nextRoute: nextWidget,
                duration: 1000,
                pageTransitionType: PageTransitionType.leftToRight,
                animationDuration: Duration(seconds: 1,milliseconds: 400),
                centered: true,
              ),
            ),
          ),
         
        ],
      ),
    );
  }
}
