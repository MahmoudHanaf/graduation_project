import 'package:graduation_project/view/widgets/text_utils.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/routes.dart';
import '../../services/category_service.dart';
import '../../services/order_service.dart';

class PetrolCategoryCard extends StatelessWidget {
  const PetrolCategoryCard({super.key, required this.category});
  final category ;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.MapScreen);
          CategoryService.category_id = "5";
          OrderService.petrol_category = category['name'];
      },
      child: Material(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 3,
          child: Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.all(10),
                    width: 150,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey[100],
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.asset(
                          '${category['image'].trim()}',
                          width: 140,
                          height: 100,
                          fit: BoxFit.fill,
                        )),
                  )),
                  Textutils(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      text: category['name'],
                      underline: TextDecoration.none),
                ],
              ),
            ),
          ),
        ),
    );
  }
}