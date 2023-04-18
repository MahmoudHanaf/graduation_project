// ignore_for_file: prefer_const_constructors




import 'dart:ui';

import 'package:graduation_project/utils/size_config.dart';
import 'package:graduation_project/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/io_client.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../widgets/tips_container_screen.dart';

class TipsScreen extends StatelessWidget {
  TipsScreen({Key? key}) : super(key: key);

  List<Map<String,dynamic>> Amublance_Data =
  [
    {
      'item_text':'البدء باسعاف الحالات الأشد خطرا مثل النزف أو توقف التنفس أو بالحوادث الكبيرة',
      'item_photo':'assets/images/aa5.png',
    },
    {
      'item_text':'الاستمرار في المعاينة والأسعاف حتى وصول الطبيب أو ايصال الحالة للمشفى بكل امن وسلام',
      'item_photo':'assets/images/aa4.png',
    },
    {
      'item_text':'اسعافات الجروح هو ايقاف النزيف وحماية الجرح من التلوث بالضغط المباشر على الجرح بقطعة قماش نظيفة ومعقم',
      'item_photo':'assets/images/aa3.png',
    },
    {
      'item_text':'عدم نقل المصاب من مكانة إذا كان هناك احتمال وجود كسور في العمود الفقري أو القفص الصدري الا في حالة ابعاده عن الخطر',
      'item_photo':'assets/images/aa2.png',
    },
    {
      'item_text':'يجب التأكد من عدم تقييد مرور الهواء للتنفس في حال تعرض المصاب للغرق أو ابتلع شيئا. في حالة الغرق، يمكنك وضع الشخص على ظهره والضغط عليه لدفع الماء للخارج',
      'item_photo':'assets/images/aa1.png',
    },

  ];


  List<Map<String,dynamic>> Fight_Data =
  [
    {
      'item_text':'إذا كانت النيران فى بداية اشتعالها ومحدودة يمكن السيطرة عليها طبقا لنوع الحريق باستخدام الطفاية. ',
      'item_photo':'assets/images/aaa4.png',
    },
    {
      'item_text':'إذا كان الهروب من موقع الحريق يستلزم اختراق منطقة بها نيران فيمكن تغطية الجسم بمفرش أو بطانية مبللة مع مراعاة تغطية الفم والأنف بقماش مبلل لتقليل أثر الدخان',
      'item_photo':'assets/images/mm15.png',
    },
    {
      'item_text':'إذا اضطررت للصعود لأعلى فى حالة نشوب حريق يجب الوصول إلى سطح المبنى ولا تقترب من أسوار السطح، لأنها المسار الطبيعى للدخان والحرارة. ',
      'item_photo':'assets/images/aaa2.png',
    },
    {
      'item_text':'فى حالة حدوث اشتعال النيران فى شقتك تجنب استعمال المصعد اثناء عملية الهروب و الإخلاء للمبنى تحسبا لانقطاع أسلاك المصعد. ',
      'item_photo':'assets/images/aaa3.png',
    },
    {
      'item_text':'غلق مصادر الغاز والكهرباء فى حالة نشوب حريق والإسراع فى مغادرة شقتك مع اشتعال النيران لمنع وقوع إصابات',
      'item_photo':'assets/images/mm17.png',
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            appBar: AppBar(
              foregroundColor: Colors.black,
              elevation: 1,
              title: Text(
                'نصائح الامان',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w800
                    ),
              ),
              leading: IconButton(
                icon: Icon (
                Icons.arrow_back,
                size: 30,
                ),
                onPressed: () => 
                {
                  Navigator.pop(context)
                }, 
                ),
              actions: 
              [
                Image.asset(
                'assets/images/mm8.png',
                 width: 60,
                 height: 60,
                 fit: BoxFit.contain,
                ),
              ],
              centerTitle: true,
              backgroundColor: Colors.white,
            ),
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height:10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'الاسعافات الاولية  :',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: mainColor
                      ),
                    ),
                  ),
                  Column(
                    children: Amublance_Data.map((e) => 
                      TipsContainerScreen(text: e['item_text'], photo: e['item_photo'],)
                    ).toList()
                  ),

                   SizedBox(height:10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'الحرائق  :',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: mainColor
                      ),
                    ),
                  ),
                  Column(
                    children: Fight_Data.map((e) => 
                      TipsContainerScreen(text: e['item_text'], photo: e['item_photo'],)
                    ).toList()
                  ),
                ],
              ),
            )));
  }
}
