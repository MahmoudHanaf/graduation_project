// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:io';

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:graduation_project/cache_helper/cache_helper.dart';
import 'package:graduation_project/routes/routes.dart';

import '../../services/update_profile.dart';
import '../../services/users_service.dart';
import 'main_controller.dart';

class AuthController extends GetxController {
  bool isVisibility = false;
  bool isCheckBox = false;
  var displayName = '';
  // FirebaseAuth auth = FirebaseAuth.instance;
  String? email = CacheHelper.getString('email') ?? '....';
  String? name = CacheHelper.getString('name') ?? '....';
  String? phone = CacheHelper.getString('phone') ?? '....';
  String? firstPhone = CacheHelper.getString('first phone') ?? '....';
  String? secondPhone = CacheHelper.getString('second phone') ?? '....';
  String? thirdPhone = CacheHelper.getString('third phone') ?? '....';

  String profilePhoto = CacheHelper.getString('profile') ?? 'Empty';

  Future pickProfileImage() async {
    File _image;

    final Myfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    _image = File(Myfile!.path);

    // ignore: unnecessary_null_comparison
    if (_image != null) {
      profilePhoto = _image.path;
      CacheHelper.setString('profile', profilePhoto);
      update();

      return profilePhoto.toString();
    }
    return null;
  }

  Future Upload() async {
    if (File(profilePhoto) == null) return;
    String base64 = base64Encode(File(profilePhoto).readAsBytesSync());
    String imageName = File(profilePhoto).path.split('/').last;
    //  print(imageName);
    //  print(File(profilePhoto));

    UpdateProfile.update_profile_image(imageName, base64);
  }

  void visibility() {
    isVisibility = !isVisibility;
    update();
  }

  void checkBox() {
    isCheckBox = !isCheckBox;
    update();
  }

  void editProfile(String email) {
    this.email = email;
    // this.name = name;
    // this.phone = phone;
    update();
  }

  void SingUp({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    try {
      var result = await UserService.SignUpData(email, password, name, phone);
      print(result);

      String title = "";
      String message = '';
      if (result != null) {
        update();
        Get.offAllNamed(Routes.OtpForm);
        CacheHelper.setString('user_id', result.toString());
        // message ="Welcome to Your App";
      }
      // Get.snackbar(title, message,
      //     snackPosition: SnackPosition.BOTTOM,
      //     padding: EdgeInsets.all(20),
      //     backgroundColor: Colors.grey[200],
      //     duration: Duration(seconds: 3),
      //     colorText: Colors.grey[700]);
    } catch (error) {
      Get.snackbar('Error', error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.blue,
          colorText: Colors.white);
    }
  }

  void Login({required String email, required String password}) async {
    var result = await UserService.LogInData(email, password);
    print(result);

    String title = "";
    String message = '';
    if (result == true) {
      // Get.lazyPut(()=>AuthController());
      message = "Welcome to Your App";
      await Get.offAllNamed(Routes.mainScreen);

      CacheHelper.setString(
          'user_id', UserService.userData['user-id'].toString());
      update();
    } else {
      message =
          "Account doesn't exist .... Please Create an account by sign up";
    }
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        padding: EdgeInsets.all(10),
        backgroundColor: Colors.grey[350],
        duration: Duration(seconds: 4),
        colorText: Colors.grey[850]);
  }

  void GoogleUsingFireBase() {}
  void FaceBookUsingFireBase() {}
  void singOutUsingFireBase() {}

  var imagePath = "";
  var isImagePathSet = false;

  void setImagePath(String path) {
    imagePath = path;
    isImagePathSet = true;
  }

  Future<void> editPhones(
      TextEditingController firstPhoneController,
      TextEditingController secondPhoneController,
      TextEditingController thirdPhoneController) async {
    await CacheHelper.setString('first phone', firstPhoneController.text);
    await CacheHelper.setString('second phone', secondPhoneController.text);
    await CacheHelper.setString('third phone', thirdPhoneController.text);
    firstPhone = CacheHelper.getString('first phone');
    secondPhone = CacheHelper.getString('second phone');
    thirdPhone = CacheHelper.getString('third phone');
    update();
  }
}


