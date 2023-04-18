import 'package:graduation_project/utils/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProfileContent extends StatelessWidget {
  const ProfileContent({super.key, required this.text, required this.icon, required this.color});
 
 final String text;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            height: 66,
            width: double.infinity,
            child: Row(children: [
              Icon(
                icon,
                color: mainColor,
                size: 28,
              ),
              SizedBox(
                width: 12,
              ),
              Text(
                "${text}",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              )
            ]),
          ),
        ),
        Divider(
          color: color,
          height: 1,
        )
      ]),
    
    );
  }
}