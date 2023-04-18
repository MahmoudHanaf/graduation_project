import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Textutils extends StatelessWidget {
  Textutils(
      {required this.color,
      required this.fontSize,
      required this.fontWeight,
      required this.text,
       required this.underline,
      Key? key})
      : super(key: key);
  final String text;
  final FontWeight fontWeight;
  final double fontSize;
  final Color color;
  final TextDecoration underline;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.lato(
          decoration: underline,
          textStyle: TextStyle(
              fontSize: fontSize, color: color, fontWeight: fontWeight),
        ));
  }
}
