import 'package:graduation_project/logic/controllers/auth_controller.dart';
import 'package:graduation_project/utils/theme.dart';
import 'package:graduation_project/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckWidget extends StatelessWidget {
  CheckWidget({Key? key}) : super(key: key);

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
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(210),
              ),
              child: controller.isCheckBox
                  ? Image.asset(
                      'assets/images/check.png',
                      color: Color.fromRGBO(215, 32, 32, 1),
                    )
                  : Container(),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Row(
            children: [
              Textutils(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                text: "I accept ",
                color:   Colors.black,
                underline: TextDecoration.none,
              ),
              Textutils(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                text: "terms & conditions",
                color: Get.isDarkMode ? Colors.white : Colors.black,
                underline: TextDecoration.underline,
              ),
            ],
          ),
        ],
      );
    });
  }
}
