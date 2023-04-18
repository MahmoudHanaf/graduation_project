import 'package:graduation_project/utils/theme.dart';
import 'package:graduation_project/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({required this.text, required this.onPressed, Key? key})
      : super(key: key);
  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          primary: mainColor, minimumSize: Size(360, 50)),
      child: Textutils(
          color: Colors.white,
          fontSize: 21,
          fontWeight: FontWeight.w800,
          text: text,
          underline: TextDecoration.none),
    );
  }
}
