
import 'dart:convert';



import 'package:graduation_project/view/screens/main_screen.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:graduation_project/view/screens/main_screen.dart';
import 'package:get/get.dart';
import 'package:graduation_project/routes/routes.dart';
import 'package:http/http.dart' as http;

import '../model/user_data.dart';
import '../routes/routes.dart';
import '../utils/request_header.dart';
import '../view/screens/main_screen.dart';
import '../view/screens/main_screen.dart';
import '../view/screens/main_screen.dart';
import '../view/screens/main_screen.dart';
import '../view/screens/main_screen.dart';
import '../view/screens/main_screen.dart';
class UserService {
  // static Future <bool> getUser(String email,String password) async {
  //   try {
     
  //     var response = await 
  //     http.post(Uri.parse('http://localhost/Graduation_Project/authenticate/Restaurant_login.php'),
  //           body: jsonEncode({
  //             'user_email': email,
  //             'user_password': password,
  //           }));
  //           //http://localhost/Graduation_Project/authenticate/Restaurant_login.php/users?user_email=%22Mahmoud@gmail.com%22
  //         print(".lkjhgfdfghjkl;lkjhgfghjklkjhg");
  //      if (response.statusCode != 200) return false;
  //     var userData = List<UserData>.from(
  //         jsonDecode(response.body).map((e) => UserData.fromJson(e))).first;
  //        print(userData.user_email);
  //     return true;
  //   } catch (e) {
  //     print(e);
  //     return false;
  //   }
  // }

static Map userData ={};
static Future<bool> LogInData(String email,String password) async {
    try {
      final response = await 
      //http
          // .get(Uri.parse(
          //     'http://192.168.1.3/Graduation_Project/authenticate/Restaurant_login.php/users/user_email=${email}AND user_password=${password}'
          //     // 'https://jsonplaceholder.typicode.com/users?email=${email}'
          //     ))
          // .timeout(Duration(seconds: 12));
              http.post(Uri.parse('${request_header}/authenticate/Log_In.php'),
            body: jsonEncode({
              'user-email': email,
              'user-password': password,
            }));
         
      if (response.statusCode != 200) return false; 
       print(jsonDecode(response.body));
       if(jsonDecode(response.body).runtimeType  != String)
       {
         userData =jsonDecode(response.body) ;
         return true;
       }else{
         return false;
       }
     
    } catch (e) {
      print(e);
      return false;
    }
  }



static Future<int?> SignUpData(String email,String password, String name, String phone) async {
  print(phone);
    try {
      final response = await 
              http.post(Uri.parse('${request_header}/authenticate/Sign_Up.php'),
              body: jsonEncode({
              'user-name': name,
              'user-email': email,
              'user-password': password,
              'user-phone': phone,
            }));
          
      if (response.statusCode != 200) return null;

       print(jsonDecode(response.body).runtimeType);
       print(jsonDecode(response.body));
       if(jsonDecode(response.body) *0 ==0)
       {
         return jsonDecode(response.body);
       }else{
         return null;
       }
     
    } catch (e) {
      print(e);
      return null;
    }
  }

  


}