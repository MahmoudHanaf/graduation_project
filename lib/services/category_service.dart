import 'dart:convert';

import 'package:http/http.dart' as http;

import '../utils/request_header.dart';

class CategoryService 
{

  static List<Map<String, dynamic>> category =[];
  static String ? category_id ;

  static void getHomePageCategories() async {
    try {
      var response = await http
          .get(Uri.parse('${request_header}/Category.php'))
          .timeout(Duration(seconds: 12));

      if (response.statusCode == 200) {
        print(jsonDecode(response.body) );
        category = List<Map<String, dynamic>>.from(
            jsonDecode(response.body));
        print(category);
      } else {
        category = [];
      }
     
    } catch (e) {
      category = [];
     
      print(e);
    }
  }
}