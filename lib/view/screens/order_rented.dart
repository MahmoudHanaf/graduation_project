





import 'package:graduation_project/utils/theme.dart';
import 'package:graduation_project/view/widgets/auth/containerunder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/io_client.dart';

import '../../routes/routes.dart';

class OrderRented extends StatelessWidget {


  const OrderRented({Key? key}) : super(key: key);

   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
       body: Column(
         children: [
           Container(
            width: MediaQuery.of(context).size.width*.92,
            // color: Colors.amber,
             child: Directionality(
              textDirection: TextDirection.rtl,
               child: InkWell(
                 child: Text(
                    "تواصل مع اقاربك",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[800]
                    ),
                    ),
               ),
             ),
           ),
           Expanded(
             child: Center(
               child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Container(
                    child: Icon(
                      Icons.check_circle_outline,
                      size: 120,
                      color: mainColor,
                      )
                    ),
                    SizedBox(height: 5,),
                    Text(
                      "تم تاكيد الطلب",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: Colors.black
                        ),
                    ),
                 ],
               ),
             ),
           ),

            Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            width: double.infinity,
            height: 45,
            decoration: BoxDecoration(
              color: mainColor,
              borderRadius: BorderRadius.circular(10)
            ),
            child: MaterialButton(
              onPressed: () async
              {
                 Get.toNamed(Routes.mainScreen);
    
              },
              child: Text(
                "الصفحة الرئيسية",
                 style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: Colors.white
                 ),
                ),
            ),
          ),
        ),
       SizedBox(height: 20,),

         ],
       ),
    );
  }
}
