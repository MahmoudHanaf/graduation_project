
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/theme.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  int CurrentIndex = 0;
  List<String> labels = [
    '\ngfdghfhjhhjgjhkhkjklkjlkhkjjkllkjl\njjjghfhtdrtxdtrfytfyugyugtuytgiuguygiugugu\nm',
    'Data'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.isDarkMode ? darkThemeColor : Colors.white,
      // appBar: AppBar(backgroundColor: Colors.white,
      //   leading: Icon(Icons.arrow_back),
      //   title: Text('privacy Policy'),
      //   elevation: 0.0,
      // ),
      appBar: AppBar(
        backgroundColor: Get.isDarkMode ? darkThemeColor : Colors.white,
        foregroundColor: !Get.isDarkMode ? darkThemeColor : Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'Privacy Policay',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            Container(
              child: Text(labels[CurrentIndex]),
            )
          ],
        ),
      ),
    );
  }
}
