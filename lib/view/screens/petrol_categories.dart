

import 'dart:ui';

import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

import '../widgets/petrol_category_card.dart';
import '../widgets/text_utils.dart';

class PetrolCategories extends StatelessWidget {
   PetrolCategories({super.key});
  
 final List Categories =
 [
  {
   "name":"بنزين 80",
   "image":"assets/images/hh10.png"
  },
  {
   "name":"بنزين 92",
   "image":"assets/images/hh7.png"
  },
  {
   "name":"بنزين 95",
   "image":"assets/images/hh4.png"
  },
  {
   "name":"سولار",
   "image":"assets/images/hh5.png"
  },
  {
   "name":"غاز طبيعى",
   "image":"assets/images/hh3.png"
  },
  {
   "name":"زيت المحرك",
   "image":"assets/images/hh6.png"
  },
 ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        foregroundColor: Colors.black,
        title: Textutils(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            text: 'خدمات الوقود',
            underline: TextDecoration.none),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Wrap (
            spacing: 15,
            runSpacing: 0,
            children: 
             Categories.map((e) => 
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
                   child: PetrolCategoryCard(category: e,),
                 )
             ).toList(),
          ),
        ),
      ),
    );
  }
}