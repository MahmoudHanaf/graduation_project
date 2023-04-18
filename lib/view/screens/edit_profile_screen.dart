
// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:graduation_project/cache_helper/cache_helper.dart';
import 'package:graduation_project/utils/theme.dart';
import 'package:graduation_project/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../logic/controllers/auth_controller.dart';
import '../../routes/routes.dart';
import '../../services/select_profile_data.dart';
import '../../services/update_profile.dart';
import '../../utils/my_string.dart';
import '../widgets/auth/auth_button.dart';
import '../widgets/auth/auth_text_formFeild.dart';
import '../widgets/auth/containerunder.dart';

class EditProfileScreen extends StatefulWidget {

  EditProfileScreen({Key? key,}) : super(key: key);
 
  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final formKey = GlobalKey<FormState>();

  final controller = Get.find<AuthController>();

  final TextEditingController namecontroller = 
  TextEditingController (text: CacheHelper.getString('name').toString());

  final TextEditingController emailcontroller = 
  TextEditingController(text:CacheHelper.getString('email').toString());

  final TextEditingController phonecontroller =
   TextEditingController(text: CacheHelper.getString('phone').toString());
  

  @override
  void initState() {
    
    // TODO: implement initState
  }
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          foregroundColor: Colors.black,
          title: Textutils(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              text: 'تعديل الملف الشخصي',
              underline: TextDecoration.none),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.3,
                child: Padding(
                  padding: EdgeInsets.only(left: 25, right: 25, top: 40),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        AuthTextFormField(
                          type: TextInputType.name,
                          controller: namecontroller,
                          obscureText: false,
                          prefixIcon: Image.asset(
                            "assets/images/user.png",
                            color: Color.fromRGBO(215, 32, 32, 1),
                          ),
                          suffixIcon: Text(''),
                          validator: (value) {
                            if (value.toString().length <= 2 
                                ) {
                              return "Enter valid Name";
                            } else {
                              return null;
                            }
                          },
                          hintText: "اسم المستخدم",
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        AuthTextFormField(
                          type: TextInputType.emailAddress,
                          controller: emailcontroller,
                          obscureText: false,
                          prefixIcon: Image.asset(
                            "assets/images/email.png",
                            color: Color.fromRGBO(215, 32, 32, 1),
                          ),
                          suffixIcon: Text(''),
                          validator: (value) {
                            if (value == '') {
                              return "Invalid Email";
                            } else {
                              return null;
                            }
                          },
                          hintText: 'اليريد الالكترونى',
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        GetBuilder<AuthController>(
                          builder: (_) {
                            return AuthTextFormField(
                              type: TextInputType.phone,
                              controller: phonecontroller,
                              obscureText: false,
                              prefixIcon: Icon(
                                Icons.phone_android,
                                color: Colors.red,
                              ),
                              suffixIcon: Text(''),
                              validator: (value) {
                                if (value =='') {
                                  return "Invalid Phone ";
                                } else {
                                  return null;
                                }
                              },
                              hintText: "رقم الهاتف",
                            );
                          },
                        ),
                        SizedBox(
                          height: 70,
                        ),
                        GetBuilder<AuthController>(builder: (_) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: ElevatedButton(
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  String name = namecontroller.text;
                                  String email = emailcontroller.text.trim();
                                  String phone = phonecontroller.text;
                                  print(name);
                                  print(email);
                                  print(phone);
                                 var result= await UpdateProfile.update_profile_data(name,email,phone);
                                  
                                // if(result == 'Data Update Successfully')
                                // {
                                  CacheHelper.setString('email', email);
                                  CacheHelper.setString('name', name);
                                  CacheHelper.setString('phone', phone);
                                  controller.editProfile(email,);

                                 Get.back();
                                // }
                                  
                                }
                             
                              },
                              child: Textutils(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  text: 'حفظ',
                                  underline: TextDecoration.none),
                              style: ElevatedButton.styleFrom(
                                  minimumSize: Size(150, 50),
                                  backgroundColor: mainColor),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
