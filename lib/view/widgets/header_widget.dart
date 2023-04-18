// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text(
            "Dashboard",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              navigationWidget(icon: Icons.search),
              navigationWidget(icon: Icons.notifications),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {},
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(1000),
                        child: Image.network(
                          'https://images.unsplash.com/photo-1599824701954-d1d141704de9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80',
                          height: 30,
                          width: 30,
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

Widget navigationWidget({icon}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Icon(
      icon,
      color: Colors.black,
    ),
  );
}
