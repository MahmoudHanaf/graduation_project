// ignore_for_file: prefer_const_constructors, sort_child_properties_last



import 'package:graduation_project/routes/routes.dart';
import 'package:graduation_project/utils/theme.dart';
import 'package:graduation_project/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../cache_helper/cache_helper.dart';
import '../../utils/my_string.dart';

class OtpForm extends StatelessWidget {
  final TextEditingController Ph1controller = TextEditingController();
  final TextEditingController Ph2controller = TextEditingController();
  final TextEditingController Ph3controller = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // ignore: prefer_const_literals_to_create_immutables
      body: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Image.asset('assets/images/call2.jpg', height: 200),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15,),
                    child: TextFormField(
                      controller: Ph1controller,
                      onSaved: (_) {},
                      onChanged: (value) {},
                      validator: (value) {
                        if (!RegExp(validationNumber).hasMatch(value!)) {
                          return "Invalid Phone ";
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.left,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        hintText: 'ادخل رقم احد اقاربك',
                        prefixIcon: Icon(Icons.phone_android, color: mainColor),

                        fillColor: Colors.grey[100],

                        // ignore: prefer_const_constructors
                        hintStyle: TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15,),
                    child: TextFormField(
                      onSaved: (_) {},
                      controller: Ph2controller,
                      onChanged: (value) {},
                      validator: (value) {
                        if (!RegExp(validationNumber).hasMatch(value!)) {
                          return "Invalid Phone ";
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.left,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        fillColor: Colors.grey[100],
                        hintText: 'ادخل رقم احد اقاربك',
                        prefixIcon: Icon(Icons.phone_android, color: mainColor),

                        // ignore: prefer_const_constructors
                        hintStyle: TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15,),
                    child: TextFormField(
                      onSaved: (_) {},
                      validator: (value) {
                        if (!RegExp(validationNumber).hasMatch(value!)) {
                          return "Invalid Phone ";
                        } else {
                          return null;
                        }
                      },
                      controller: Ph3controller,
                      onChanged: (value) {},
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.left,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        fillColor: Colors.grey[100],
                        hintText: 'ادخل رقم احد اقاربك',
                        prefixIcon: Icon(Icons.phone_android, color: mainColor),

                        // ignore: prefer_const_constructors
                        hintStyle: TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * .22,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: ElevatedButton(
                            onPressed: () {
                              CacheHelper.setBoolean('isOtp', true);
                              Get.toNamed(Routes.mainScreen);
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                              child: Textutils(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  text: 'تخطى',
                                  underline: TextDecoration.none),
                            ),
                            style: ElevatedButton.styleFrom(
                                minimumSize: Size(70, 50),
                                backgroundColor: mainColor
                                ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .2,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                Get.toNamed(Routes.mainScreen);
                                CacheHelper.setBoolean('isOtp', true);
                                Get.snackbar(
                                  '', 'Welcome to Your App',
                                  snackPosition: SnackPosition.BOTTOM,
                                  padding: EdgeInsets.all(20),
                                  backgroundColor: Colors.grey[200],
                                  duration: Duration(seconds: 3),
                                  colorText: Colors.grey[700]);
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 5),
                              child: Textutils(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  text: 'تاكيد',
                                  underline: TextDecoration.none),
                            ),
                            style: ElevatedButton.styleFrom(
                                minimumSize: Size(70, 50),
                                backgroundColor: mainColor
                                ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
