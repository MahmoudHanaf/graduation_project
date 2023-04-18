import 'dart:ui';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

import '../../utils/size_config.dart';
class TipsContainerScreen extends StatelessWidget {
  const TipsContainerScreen({super.key,required this.text, required this.photo});
  final String text ;
  final String photo ;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    child: Container(
                      width:double.infinity ,
                      height: 125,
                      decoration: BoxDecoration(
                        borderRadius:BorderRadius.circular(18) ,
                        color: Colors.grey[100],
                        
                        ),
                      child: Row (
                        
                        children: 
                        [
                          Image.asset(
                            '${photo}',
                            fit: BoxFit.fill,
                            width: MediaQuery.of(context).size.width *.18,
                            height: 100,
                            
                            ),
                    
                            SizedBox(width: 5,),
                            SizedBox(
                              width: MediaQuery.of(context).size.width *.71,
                              child: Text(
                                '${text}',
                                style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                 
                                ),
                                maxLines: 4,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
    );
  }
}