// ignore_for_file: prefer_const_constructors

import 'package:graduation_project/utils/theme.dart';
import 'package:graduation_project/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';

class ContainerUnder extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final String textType;
  const ContainerUnder(
      {required this.onPressed,
      required this.text,
      required this.textType,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            TextButton(
                onPressed: onPressed,
                child: Textutils(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    text: textType,
                    underline: TextDecoration.underline)),

              Textutils(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                text: text,
                underline: TextDecoration.none),
          ],
        ),
      ),
    );
  }
}
