import 'package:graduation_project/logic/controllers/auth_controller.dart';
import 'package:graduation_project/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckWidgest extends StatelessWidget {
  CheckWidgest({Key? key}) : super(key: key);
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (_) {
      return Row(
        children: [
          InkWell(
            onTap: () {
              controller.checkBox();
            },
            child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: controller.isCheckBox
                    ? Image.asset("assets/images/check.png")
                    : Container()),
          ),
          SizedBox(
            width: 7,
          ),
          Row(
            children: [
              Textutils(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  text: "I accept ",
                  underline: TextDecoration.none),
              Textutils(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  text: 'condetions & terms',
                  underline: TextDecoration.underline)
            ],
          ),
        ],
      );
    });
  }
}
