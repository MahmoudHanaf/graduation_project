// ignore_for_file: prefer_const_constructors

import 'package:graduation_project/cache_helper/cache_helper.dart';
import 'package:graduation_project/routes/routes.dart';
import 'package:graduation_project/view/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../logic/controllers/auth_controller.dart';
import '../../../utils/theme.dart';
import '../../widgets/auth/auth_button.dart';
import '../../widgets/auth/auth_text_formFeild.dart';
import '../../widgets/auth/containerunder.dart';
import '../../widgets/auth/my_string.dart';
import '../../widgets/text_utils.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    // TODO: implement initState

    setData();
    getData();
  }

  final formKey = GlobalKey<FormState>();

  final controller = Get.find<AuthController>();
  String? email = '';
  String password = '';

  final TextEditingController emailcontroller = TextEditingController();

  final TextEditingController passcontroller = TextEditingController();

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
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.only(left: 25, right: 25, top: 20),
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
                              text: "LOG",
                              underline: TextDecoration.none),
                          const SizedBox(
                            width: 2.5,
                          ),
                          Textutils(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                              text: "IN",
                              underline: TextDecoration.none)
                        ],
                      ),
                      SizedBox(
                        height: 30,
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
                        
                          prefixIcon: Image.asset("assets/images/email.png",
                              color: Color.fromRGBO(215, 32, 32, 1)),
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
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GetBuilder<AuthController>(
                        builder: (_) {
                          return Directionality(textDirection:TextDirection.rtl,
                            child: AuthTextFormField(
                              type: TextInputType.text,
                              controller: passcontroller,
                              obscureText: controller.isVisibility ? false : true,
                              prefixIcon: Image.asset("assets/images/lock.png",
                                  color: Color.fromRGBO(215, 32, 32, 1)),
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
                                  return "Password  6 characters";
                                } else {
                                  return null;
                                }
                              },
                              hintText: "كلمة المرور",
                            ),
                          );
                        },
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                            onPressed: () {},
                            child: Textutils(
                                color: Colors.grey.shade600,
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                text: "هل نسيت الرقم السرى ؟",
                                underline: TextDecoration.none)),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      GetBuilder<AuthController>(builder: (_) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: AuthButton(
                            text: 'تسجيل دخول',
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                String email = emailcontroller.text.trim();
                                String password = passcontroller.text;
                               
                                
                                controller.Login(
                                  password: password,
                                  email: email,
                                );
                                 CacheHelper.setString('email', email);
                                CacheHelper.setString('password', password);
                                controller.editProfile(email);
                                CacheHelper.setLogin(true);
                               
                                
                              }
                        
                              // final SharedPreferences pref =await SharedPreferences.getInstance();
                              // pref.setString('email', emailcontroller.text);
                              // Get.toNamed(Routes.mainScreen);
                            },
                          ),
                        );
                      }),
                      SizedBox(
                        height: 20,
                      ),
                      Textutils(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          text: "OR",
                          underline: TextDecoration.none),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                              onTap: () {},
                              child:
                                  Container(
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
            SizedBox(height: 10,),
            Center(
              child: ContainerUnder(
                onPressed: () {
                  Get.offNamed(Routes.SignUpScreen);
                },
                text: "  ليس لديك حساب ؟",
                textType: "انشاء حساب جديد",
              ),
            ),
          ],
        ),
      ),
    ));
  }

  setData() async {
    if (email == emailcontroller.text && password == passcontroller.text) {
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString('email', emailcontroller.text);
      pref.setString('password', passcontroller.text);
      // Get.toNamed(Routes.mainScreen);
    }
  }

  getData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    setState(() {
      email = pref.getString('email').toString();
      password = pref.getString('password').toString();
    });
  }
}
