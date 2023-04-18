import 'package:graduation_project/view/screens/maps.dart';
import 'package:graduation_project/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../logic/controllers/auth_controller.dart';
import '../../routes/routes.dart';
import '../../services/category_service.dart';

class CategoryCard extends StatelessWidget {
  final category;

  CategoryCard({required this.category, Key? key}) : super(key: key);

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (int.parse(category['category-id'].toString()) == 5) {
          Get.toNamed(
            Routes.PetrolCategories,
          );
        } else {
          Get.toNamed(Routes.MapScreen);
          CategoryService.category_id = category['category-id'];
        }
      },
      child: Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 3,
        child: Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
              color: Colors.white,
               borderRadius: BorderRadius.circular(15)),
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
                        '${category['category-image'].trim()}',
                        width: 140,
                        height: 100,
                        fit: BoxFit.fill,
                      )),
                )),
                Textutils(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    text: category['category-name'],
                    underline: TextDecoration.none),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
