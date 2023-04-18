// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:graduation_project/logic/controllers/auth_controller.dart';
import 'package:graduation_project/routes/routes.dart';
import 'package:graduation_project/utils/theme.dart';
import 'package:graduation_project/view/widgets/auth/auth_button.dart';
import 'package:graduation_project/view/widgets/auth/auth_checkWidget.dart';
import 'package:graduation_project/view/widgets/auth/auth_text_formFeild.dart';
import 'package:graduation_project/view/widgets/auth/containerunder.dart';
import 'package:graduation_project/view/widgets/auth/my_string.dart';
import 'package:graduation_project/view/widgets/text_utils.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../cache_helper/cache_helper.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();

  final controller = Get.find<AuthController>();

  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passcontroller = TextEditingController();
  final TextEditingController phonecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.only(left: 25, right: 25, top: 5),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Textutils(
                              color: mainColor,
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                              text: "SIGN",
                              underline: TextDecoration.none),
                          const SizedBox(
                            width: 2.5,
                          ),
                          Textutils(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                              text: "UP",
                              underline: TextDecoration.none)
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: AuthTextFormField(
                          type: TextInputType.name,
                          controller: namecontroller,
                          obscureText: false,
                          prefixIcon: Image.asset(
                            "assets/images/user.png",
                            color: Color.fromRGBO(215, 32, 32, 1),
                          ),
                          suffixIcon: Text(''),
                          validator: (value) {
                            if (value.toString().length <= 4) {
                              return "Enter valid Name";
                            } else {
                              return null;
                            }
                          },
                          hintText: "الاسم",
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: AuthTextFormField(
                          type: TextInputType.emailAddress,
                          controller: emailcontroller,
                          obscureText: false,
                          prefixIcon: Image.asset(
                            "assets/images/email.png",
                            color: Color.fromRGBO(215, 32, 32, 1),
                          ),
                          suffixIcon: Text(''),
                          validator: (value) {
                            if (!RegExp(validationEmail).hasMatch(value)) {
                              return "Invalid Email";
                            } else {
                              return null;
                            }
                          },
                          hintText: "البريد الالكترونى",
                        ),
                      ),SizedBox(height: 20,),
                      GetBuilder<AuthController>(
                        builder: (_) {
                          return Directionality(textDirection: TextDirection.rtl,
                            child: AuthTextFormField(
                              type: TextInputType.phone,
                              controller: phonecontroller,
                              obscureText: false,
                              prefixIcon: Icon(
                                Icons.phone_android,
                                color: Colors.red,
                              ),
                              suffixIcon: Text(''),
                              validator: (value) {
                                String validationNumber = r'^[0-9 ]+$';
                                if (!RegExp(validationNumber).hasMatch(value)) {
                                  return "Invalid Phone ";
                                } else {
                                  return null;
                                }
                              },
                              hintText: "التليفون",
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GetBuilder<AuthController>(
                        builder: (_) {
                          return Directionality(
                            textDirection: TextDirection.rtl,
                            child: AuthTextFormField(
                              type: TextInputType.text,
                              controller: passcontroller,
                              obscureText:
                                  controller.isVisibility ? false : true,
                              prefixIcon: Image.asset(
                                "assets/images/lock.png",
                                color: Color.fromRGBO(215, 32, 32, 1),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  controller.visibility();
                                },
                                icon: controller.isVisibility
                                    ? Icon(
                                        Icons.visibility_off,
                                        color: Colors.black,
                                      )
                                    : Icon(
                                        Icons.visibility,
                                        color: Colors.black,
                                      ),
                              ),
                              validator: (value) {
                                if (value.toString().length < 6) {
                                  return "Password should be longer or equal 6 characters";
                                } else {
                                  return null;
                                }
                              },
                              hintText: "كلمة المرور",
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      GetBuilder<AuthController>(builder: (_) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Expanded(
                            child: AuthButton(
                                text: 'انشاء حساب',
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    String name = namecontroller.text;
                                    String email = emailcontroller.text.trim();
                                    String password = passcontroller.text;
                                    String phone = phonecontroller.text;
                                   
                                    
                                    controller.isCheckBox = true;
                                    CacheHelper.setString('name', name);
                                    CacheHelper.setString('email', email);
                                    CacheHelper.setString('password', password);
                                    controller.editProfile(
                                        email,);
                                    CacheHelper.setLogin(true);
                                    // Get.offNamed(Routes.mainScreen);
                                      
                                     controller.SingUp(
                                        name: name,
                                        password: password,
                                        email: email, 
                                        phone: phone,
                                        );
                                  }
                                }),
                          ),
                        );
                      }),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                              onTap: () {},
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.grey[100]
                                ),
                                child: 
                                Image.asset("assets/images/facebook.png"))),
                          SizedBox(
                            width: 20,
                          ),
                          InkWell(
                              onTap: () {},
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.grey[100]
                                ),
                                child: Image.asset(
                                  "assets/images/google.png",
                                ),
                              )),
                          SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ContainerUnder(
              onPressed: () {
                Get.offNamed(Routes.LoginScreen);
              },
              text: " هل لديك حساب بالفعل ؟",
              textType: "تسجيل دخول",
            ),
          ],
        ),
      ),
    ));
  }
}
