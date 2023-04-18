// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AuthTextFormField extends StatelessWidget {
  final TextEditingController controller;
  bool obscureText;
  final Function validator;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final double? width;
  final double? height;
  final String hintText;
  final double? padding;
  final Function()? onTap;
  final TextInputType type;
  AuthTextFormField(
      {required this.controller,
      this.obscureText = false,
      this.onTap,
      this.height,
      this.padding,
      this.type = TextInputType.text,
      this.width,
      required this.validator,
      this.prefixIcon = const Icon(Icons.person),
      this.suffixIcon,
      this.hintText = '',
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.symmetric(horizontal: padding ?? 0),
      child: TextFormField(
        maxLines: 1,
        onTap: onTap,
        controller: controller,
        obscureText: obscureText,
        cursorColor: Colors.black,
        keyboardType: type,
        validator: (value) => validator(value),
        decoration: InputDecoration(
          fillColor: Colors.grey.shade300,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          hintText: hintText,
          // ignore: prefer_const_constructors
          hintStyle: TextStyle(
              color: Colors.black54, fontSize: 16, fontWeight: FontWeight.bold),
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
      ),
    );
  }
}
