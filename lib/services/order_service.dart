import 'dart:convert';

import 'package:http/http.dart' as http;

import '../cache_helper/cache_helper.dart';
import '../utils/request_header.dart';
import 'category_service.dart';

class OrderService 
{

  static String? petrol_category ; 
  static Future<bool> SendOrder(double longitude ,double latitude ) async {
 
    try {
      final response = await 
              http.post(Uri.parse('${request_header}/order.php'),
              body: jsonEncode({
              'oder_user_id':CacheHelper.getString('user_id'),
              'oder_category_id': CategoryService.category_id,
              'oder_longitude': longitude,
              'oder_latitude': latitude,
              "petrol_category":petrol_category,
            }));
          print(jsonDecode(response.body));
      if (response.statusCode != 200) return false;

       print(jsonDecode(response.body).runtimeType);
       print(jsonDecode(response.body));
       if(jsonDecode(response.body)*0 ==0)
       {
         petrol_category ='';
         return true;
       }else{
         return false;
       }
     return true;
    } catch (e) {
      print(e);
      return false;
    }
  }


}