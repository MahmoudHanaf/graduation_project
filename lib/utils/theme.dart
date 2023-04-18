// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

const Color mainColor = Color.fromRGBO(215, 32, 32, 1);
const Color darkGreyClr = Color(0xFF121212);
const Color pinkClr = Color(0xFFff4667);
const Color kCOlor1 = Color(0xff685959);
const Color kCOlor2 = Color(0xffADA79B);
const Color kCOlor3 = Color(0xffA5947F);
const Color kCOlor4 = Color(0xff738B71);
const Color kCOlor5 = Color(0xff6D454D);
const Color darkSettings = Color(0xff6132e4);
const Color accountSettings = Color(0xff73bc65);
const Color logOutSettings = Color(0xff5f95ef);
const Color notiSettings = Color(0xffdf5862);
const Color languageSettings = Color(0xffCB256C);
const Color darkThemeColor = Color(0xff313636);
const MaterialColor darkColor = MaterialColor(50, {50: darkThemeColor});
const MaterialColor lightColor = MaterialColor(50, {50: Colors.white});

class ThemesApp {
  static final light = ThemeData(
    primaryColor: mainColor,
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        showSelectedLabels: true,
        showUnselectedLabels: true),
  );

  static final dark = ThemeData(
    primaryColor: darkGreyClr,
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: darkThemeColor,
          statusBarIconBrightness: Brightness.light),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: darkThemeColor,
        showSelectedLabels: true,
        showUnselectedLabels: true),
  );
}
