// ignore_for_file: prefer_const_constructors

import 'package:graduation_project/cache_helper/cache_helper.dart';
import 'package:graduation_project/logic/controllers/main_controller.dart';
import 'package:graduation_project/main.dart';
import 'package:graduation_project/routes/routes.dart';
import 'package:graduation_project/utils/theme.dart';
import 'package:graduation_project/view/screens/welcome_screen.dart';
import 'package:graduation_project/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
 
  bool noti_button = true ;
  bool darkButton = false ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Text(
          'الاعدادات',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        centerTitle: true,
        leading: IconButton(
                icon: Icon (
                Icons.arrow_back,
                size: 28,
                ),
                onPressed: () => 
                {
                 Get.toNamed(Routes.mainScreen)
                }, 
                ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () {},
              child: Directionality(
                textDirection: TextDirection.rtl ,
                child: ListTile(
                  leading: CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Icon(
                        Icons.help,
                        color: Colors.white,
                      )),
                  title: Text(
                    'الدعم والمساعدة',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ),
            ),
             SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {},
              child: Directionality(
                textDirection: TextDirection.rtl ,
                child: ListTile(
                  leading: CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Icon(
                        Icons.dark_mode_outlined,
                        color: Colors.white,
                      )),
                  title: Text(
                    'الوضع المظلم',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  trailing: Switch(
                    activeColor: mainColor,
                    value: darkButton,
                    activeTrackColor: Colors.grey,
                    onChanged: (value) => 
                    {
                    setState(() => darkButton = value)
                       
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {},
              child: Directionality(
                textDirection: TextDirection.rtl ,
                child: ListTile(
                  leading: CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                      )),
                  title: Text(
                    'سياسة الخصوصية',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {},
              child: Directionality(
                textDirection: TextDirection.rtl ,
                child: ListTile(
                  leading: CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Icon(
                        Icons.language,
                        color: Colors.white,
                      )),
                  title: Text(
                    'اللغة ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {},
              child: Directionality(
                textDirection: TextDirection.rtl ,
                child: ListTile(
                  leading: CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Icon(
                        Icons.notifications,
                        color: Colors.white,
                      )),
                  title: Text(
                    'الاشعارات',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  trailing: Switch(
                    activeColor: mainColor,
                    value: noti_button,
                    activeTrackColor: Colors.grey,
                    onChanged: (value) => 
                    {
                    setState(() => noti_button = value)
                       
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                // Get.offNamedUntil('/welcomeScreen', (route) => false);
                // CacheHelper.setLogin(false);
              },
              child: Directionality(
                textDirection: TextDirection.rtl ,
                child: ListTile(
                  leading: CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Icon(
                        Icons.share,
                        color: Colors.white,
                      )),
                  title: Text(
                    'مشاركة التطبيق',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
           
          ],
        ),
      ),
    );
  }
}
