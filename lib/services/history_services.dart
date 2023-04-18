import 'dart:convert';

import 'package:http/http.dart' as http;

import '../utils/request_header.dart';



class HistoryServices 
{
  static List history_data =[];

  static Future select_history_data (String user_id)async
  {
     try {
      final response = await http.post(
          Uri.parse('${request_header}/orders_history.php'),
          body: jsonEncode({
            'order-user-id': user_id,
          }));
       print(jsonDecode(response.body));
      if (response.statusCode != 200) history_data = [];
        history_data = jsonDecode(response.body);
     
    } catch (e) {
      print(e);
      history_data = [];
    }
  }

   
   static Future<bool> delete_history_item (String order_id) async
   {
    try {
      final response = await http.post(
          Uri.parse('${request_header}/delete_order.php'),
          body: jsonEncode({
            'order-id': order_id,
          }));

      if (response.statusCode != 200) return false;
       
       return true ;
     
    } catch (e) {
      print(e);
     return false;
    }
   }


  }
