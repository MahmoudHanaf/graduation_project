import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VerificationScreen extends StatefulWidget {
  VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  int start = 30;

  void startTimer() {
    const onsec = Duration(seconds: 1);
    Timer timer = Timer.periodic(onsec, (timer) {
      if (start > 0) {
        setState(() {
          start--;
        });
      } else {
        setState(() {
          timer.cancel();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Image.network(
                  'https://img.freepik.com/free-vector/secure-data-concept-illustration_114360-483.jpg?w=740&t=st=1678625597~exp=1678626197~hmac=094cc2ce42bb9a1c023eff10c23f0f98bf4b8006209c0ad54279450efc1125c4',
                  width: MediaQuery.of(context).size.width * .5,
                ),
              ),
              Text(
                'VERIFICATION\nCODE..',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              SizedBox(
                height: 12,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Text(
              //       'Enter The verification code to -',
              //       style: TextStyle(
              //         fontWeight: FontWeight.normal,
              //       ),
              //     ),
              //     SizedBox(
              //       width: 5,
              //     ),
              //     Text(
              //       '01223456788',
              //       style: TextStyle(
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //   ],
              // ),
              Container(
                width: MediaQuery.of(context).size.width - 40,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter your Number',
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 13, horizontal: 10),
                      suffixIcon: InkWell(
                          onTap: () {
                            startTimer();
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 13, horizontal: 10),
                            child: Text(
                              'Send',
                              style: TextStyle(color: Colors.red),
                            ),
                          ))),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormItem(),
                  SizedBox(
                    width: 8,
                  ),
                  TextFormItem(),
                  SizedBox(
                    width: 8,
                  ),
                  TextFormItem(),
                  SizedBox(
                    width: 8,
                  ),
                  TextFormItem(),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: 'Send Code again ',
                    style: TextStyle(fontSize: 16, color: Colors.black)),
                TextSpan(
                    text: ' 00:$start ', style: TextStyle(color: Colors.red)),
                TextSpan(
                    text: 'Sec ',
                    style: TextStyle(fontSize: 16, color: Colors.black)),
              ])),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Submit'),
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(150, 50),
                        backgroundColor: Colors.red),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Resend'),
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(150, 50),
                        backgroundColor: Colors.red),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TextFormItem extends StatelessWidget {
  TextFormItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      child: TextFormField(
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        cursorColor: Colors.red,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
        decoration: InputDecoration(
            counterText: '',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
            filled: true,
            fillColor: Colors.grey.shade200),
      ),
    );
  }
}
