// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_const_constructors_in_immutables



import 'package:graduation_project/routes/routes.dart';
import 'package:graduation_project/utils/theme.dart';
import 'package:graduation_project/view/screens/auth/login_screen.dart';
import 'package:graduation_project/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height *.1,
          ),
          Center(
            child: Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.fill,
              width: 200,
              height: 200,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          // Textutils(
          //     color: Colors.black,
          //     fontSize: 50,
          //     fontWeight: FontWeight.bold,
          //     text: 'طارئ',
          //     underline: TextDecoration.none),
          SizedBox(
            height: 70,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: ElevatedButton(
                onPressed: () {
                  Get.offNamed(Routes.LoginScreen);
                  //  Get.offNamed(Routes.OtpForm);
                },
                child: Textutils(
                    color: Colors.white,
                    fontSize: 21,
                    fontWeight: FontWeight.w800,
                    text: 'تسجيل الدخول',
                    underline: TextDecoration.none),
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(238, 70),
                    backgroundColor: Color.fromRGBO(60, 54, 54, 1)),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: ElevatedButton(
              onPressed: () {
                Get.offNamed(Routes.SignUpScreen);
              },
              child: Textutils(
                  color: Colors.white,
                  fontSize: 21,
                  fontWeight: FontWeight.w800,
                  text: 'انشاء حساب',
                  underline: TextDecoration.none),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(238, 70),
                backgroundColor: Color.fromRGBO(215, 32, 32, 1),
              ),
            ),
          ),
          SizedBox(
            height: 70,
          ),
          // Textutils(
          //     color: Color.fromRGBO(199, 22, 22, 1),
          //     fontSize: 20,
          //     fontWeight: FontWeight.normal,
          //     text: 'continue without any account?',
          //     underline: TextDecoration.none)
        ],
      ),
    );
  }
}
