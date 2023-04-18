// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AuthTextFormField extends StatelessWidget {
  final TextEditingController controller;
  bool obscureText;
  final Function validator;
  final Widget suffixIcon;
  final Widget prefixIcon;
  final String hintText;
  final TextInputType type ;
  AuthTextFormField(
      {required this.controller,
      required this.obscureText,
      required this.validator,
      required this.prefixIcon,
      required this.suffixIcon,
      required this.hintText,
      required this.type,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      cursorColor: Colors.black,
      keyboardType: type,
      validator: (value) => validator(value),
      decoration: InputDecoration(
        fillColor: Colors.grey[100],
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        hintText: hintText,
        // ignore: prefer_const_constructors
        hintStyle: TextStyle(
            color: Colors.black54, fontSize: 17, fontWeight: FontWeight.w700),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
