// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'dart:io';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/view/screens/prevOrder.dart';

import '../../cache_helper/cache_helper.dart';
import '../../logic/controllers/auth_controller.dart';
import '../../routes/routes.dart';
import '../../services/select_profile_data.dart';
import '../../utils/theme.dart';
import '../widgets/profile_content.dart';
import '../widgets/text_utils.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late AuthController controller;

  @override
  void initState() {
    SelectProfileData.SelectData();
    controller = Get.find<AuthController>();
    super.initState();
  }

  // File? file;
  // String? a = CacheHelper.getString('profilePhoto');
  // Future pickerImage() async {
  //   final myfile = await ImagePicker().pickImage(source: ImageSource.gallery);
  //   setState(() {
  //     file = File(myfile!.path);
  //      CacheHelper.setString('profilePhoto', file.toString());
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.isDarkMode ? darkThemeColor : Colors.white,
      appBar: AppBar(
        backgroundColor: Get.isDarkMode ? darkThemeColor : Colors.white,
        foregroundColor: Get.isDarkMode ? Colors.white : darkThemeColor,
        elevation: 0,
        centerTitle: true,
        title: Textutils(
            color: Get.isDarkMode ? Colors.white : darkThemeColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            text: 'الصفحة الشخصية ',
            underline: TextDecoration.none),
      ),
      body: GetBuilder(
        init: AuthController(),
        builder: (AuthController controller) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      CircleAvatar(
                        radius: 59,
                        backgroundColor: mainColor,
                        child: CircleAvatar(
                          backgroundColor: Colors.grey[200],
                          foregroundColor: Color.fromARGB(255, 156, 108, 108),
                          radius: 55,
                          child: controller.profilePhoto == 'Empty'
                              ? GestureDetector(
                                  onTap: () {
                                    controller.pickProfileImage();
                                    controller.Upload();
                                  },
                                  child: Icon(
                                    Icons.person,
                                    size: 48,
                                    color: Colors.grey,
                                  ),
                                )
                              : GestureDetector(
                                  onTap: () {
                                    controller.pickProfileImage();
                                    controller.Upload();
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            fit: BoxFit.contain,
                                            image: FileImage(File(
                                                controller.profilePhoto)))),
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Center(
                  child: Text(
                    CacheHelper.getString('email').toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: ProfileContent(
                    icon: Icons.person,
                    text: CacheHelper.getString('name').toString(),
                    color: Colors.grey,
                  ),
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: ProfileContent(
                    icon: Icons.phone_android_outlined,
                    text: controller.firstPhone ?? '',
                    color: Colors.grey,
                  ),
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: ProfileContent(
                    icon: Icons.location_on,
                    text: 'بسيون - غربية',
                    color: Colors.grey,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PrevOrder()));
                  },
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: ProfileContent(
                        text: "الطلبات السابقة",
                        icon: Icons.shopping_cart,
                        color: Colors.grey),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // showDialog(
                    //     context: context,
                    //     builder: (context) => AlertDialog(
                    //           actions: [EditPhones()],
                    //         ));
                  },
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: ProfileContent(
                      icon: Icons.call,
                      text: 'اتصل بأقاربك',
                      color: Colors.grey,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.offNamedUntil('/welcomeScreen', (route) => false);
                    CacheHelper.setLogin(false);
                  },
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: ProfileContent(
                        text: "تسجيل خروج",
                        icon: Icons.logout,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .05,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    width: double.infinity,
                    height: 45,
                    decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: MaterialButton(
                      onPressed: () async {
                        Get.toNamed(
                          Routes.EditProfileScreen,
                        );
                      },
                      child: Text(
                        "تعديل الملف الشخصى",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
