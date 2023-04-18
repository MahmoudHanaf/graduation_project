

import 'dart:convert';

import 'package:http/http.dart' as http;

import '../cache_helper/cache_helper.dart';
import '../utils/request_header.dart';
import 'category_service.dart';

class UpdateProfile 
{

  static Future<String> update_profile_data(String name, String email ,String phone ) async {
    
    try {
      final response = await 
              http.post(Uri.parse('${request_header}/Update-profile.php'),
              body: jsonEncode({
              'user_id':CacheHelper.getString('user_id'),
              'user_name': name,
              'user_email':email,
              'user_phone':phone,  
              'user_image':'',   
            }));
         print(jsonDecode(response.body));
      if (response.statusCode == 200){
         print(jsonDecode(response.body));
         return jsonDecode(response.body);
      }
      return '';
    } catch (e) {
      print(e);
      return '';
    }
  }



  static Future<String> update_profile_image(String imageName,String base64 ) async {
    
    try {
      final response = await 
              http.post(Uri.parse('${request_header}/Update-profile.php'),
              body: jsonEncode({
              'user_id':CacheHelper.getString('user_id'),
              'user_name': '',
              'user_email':'',
              'user_phone':'',  
              'user_image':imageName,  
              'base64':base64,
            }));
            print(jsonDecode(response.body));
      if (response.statusCode == 200){
         print(jsonDecode(response.body));
         return jsonDecode(response.body);
      }
      return '';
    } catch (e) {
      print(e);
      return '';
    }
  }

}


