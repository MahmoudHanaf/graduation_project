import 'dart:convert';

import 'package:http/http.dart' as http;

import '../cache_helper/cache_helper.dart';
import '../utils/request_header.dart';

class SelectProfileData {
  static  Map profileData = {};
  static void SelectData() async {
    try {
      final response = await http.post(
          Uri.parse('${request_header}/select_profile.php'),
          body: jsonEncode({
            'user_id': CacheHelper.getString('user_id'),
          }));

      if (response.statusCode != 200) profileData = {};
      // profileData = Map.from(jsonDecode(response.body));
       profileData = Map.from(
            jsonDecode(response.body));
     
      CacheHelper.setString('name',profileData['user_name']);
      CacheHelper.setString('phone',profileData['user_phone']);
    } catch (e) {
      print(e);
      profileData = {};
    }
  }
}
