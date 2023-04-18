// ignore_for_file: unused_local_variable

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedController extends GetxController{
  String ?email;
  String ?password;

  setData()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('email',email! );
    pref.setString('password',password! );
    update();

  }

   getData()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
   
    
  email=   pref.getString('email' );
    password= pref.getString('password' );
    
update();
  }


}