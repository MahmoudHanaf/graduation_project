// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/history_services.dart';
import '../../utils/theme.dart';
import '../widgets/text_utils.dart';

class PrevOrder extends StatefulWidget {
  const PrevOrder({super.key});

  @override
  State<PrevOrder> createState() => _PrevOrderState();
}

class _PrevOrderState extends State<PrevOrder> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> data = [
      {
        'item_photo': 'assets/images/mm4.png',
        'category': 'Ambulance',
        'date': 'Tues 3/21/2023 PM 04:00'
      },
      {
        'item_photo': 'assets/images/m8.png',
        'category': 'FireFighting',
        'date': 'Tues 3/21/2023 PM 04:00'
      },
      {
        'item_photo': 'assets/images/m3.png',
        'category': 'Winch',
        'date': 'Tues 3/21/2023 PM 04:00'
      },
      {
        'item_photo': 'assets/images/m10.png',
        'category': 'Ambulance',
        'date': 'Tues 3/21/2023 PM 04:00'
      },
    ];

     @override
     void initState() async { 
       super.initState();
      await  HistoryServices.select_history_data("62");
     }
     

    

    return Scaffold(
        backgroundColor: Get.isDarkMode ? darkThemeColor : Colors.white,
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? darkThemeColor : Colors.white,
          foregroundColor: !Get.isDarkMode ? darkThemeColor : Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
            ),
          ),
          title: Textutils(
            color: Get.isDarkMode ? Colors.white : darkThemeColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            text: 'الطلبات السابقة',
            underline: TextDecoration.none),
          centerTitle: true,
          elevation: 0,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: 
          [
            Center(
              child: Material(
                elevation: 3,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: MediaQuery.of(context).size.width *.92,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white
                  ),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 14),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: 
                        [
                          Image.asset(
                            "assets/images/m2.jpg",
                             width: 100,
                             height: 80,
                             fit: BoxFit.fill,
                            ), 
                            SizedBox(width: 18,),       
                          Column(
                            children: 
                            [
                              Text(
                                "طلب سيارة اسعاف ",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey[700],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Mon-2023-3  4:00pm",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[700],
                                ),
                              ),
                            ],
                          ), 
                                  
                                  
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
    );
  }
}

class ItemPrevOrder extends StatelessWidget {
  const ItemPrevOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      decoration: BoxDecoration(
          color: Colors.amber, borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          ListTile(
            leading: Image.asset('images/books.png'),
            title: Text(
                "Your Prev Order her.. \n This order about emergency vehicles....  "),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 250, top: 10),
            child: Text("Mon-2023-3  4:00pm"),
          )
        ],
      ),
    );
  }
}
