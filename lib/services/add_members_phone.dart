// import 'dart:convert';

// import 'package:http/http.dart' as http;

// class AddMembersPhone 
// {

//   static Future<bool> add_members_phone(double longitude ,double latitude ) async {
 
//     try {
//       final response = await 
//               http.post(Uri.parse('http://192.168.1.2/Graduation_Project/order.php'),
//               body: jsonEncode({
//               'oder_user_id':CacheHelper.getString('user_id'),
//               'oder_category_id': CategoryService.category_id,
//               'oder_longitude': longitude,
//               'oder_latitude': latitude,
//             }));
          
//       if (response.statusCode != 200) return false;

//        print(jsonDecode(response.body).runtimeType);
//        print(jsonDecode(response.body));
//        if(jsonDecode(response.body)*0 ==0)
//        {
//          return true;
//        }else{
//          return false;
//        }
//      return true;
//     } catch (e) {
//       print(e);
//       return false;
//     }
//   }

// }