// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// // import 'pacgraduation_project/cache_helper/cache_helper.dart';
// // import 'pacgraduation_project/view/widgets/auth/auth_button.dart';
// // import 'pacgraduation_project/view/widgets/auth/auth_text_formFeild.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../cache_helper/cache_helper.dart';
// import '../../logic/controllers/auth_controller.dart';
// import '../widgets/auth/auth_button.dart';
// import '../widgets/auth/auth_text_formFeild.dart';

// class EditPhones extends StatefulWidget {
//   const EditPhones({super.key});

//   @override
//   State<EditPhones> createState() => _EditPhonesState();
// }

// class _EditPhonesState extends State<EditPhones> {
//   final firstPhoneController = TextEditingController();

//   final secondPhoneController = TextEditingController();

//   final thirdPhoneController = TextEditingController();

//   final key = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: key,
//       child: GetBuilder(
//         init: AuthController(),
//         builder: (AuthController controller) => Center(
//           child: SizedBox(
//             height: MediaQuery.of(context).size.height / 1.75,
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: 20,
//                 ),
//                 AuthTextFormField(
//                   controller: firstPhoneController
//                     ..text = CacheHelper.getString('first phone') ?? '',
//                   hintText: 'First Number',
//                   obscureText: false,
//                   prefixIcon: Icon(Icons.phone_android),
//                   validator: (value) {
//                     if (value.isEmpty) {
//                       return 'First Number Shouldn\'t Be Empty';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height / 18.425,
//                 ),
//                 AuthTextFormField(
//                   controller: secondPhoneController
//                     ..text = CacheHelper.getString('second phone') ?? '',
//                   hintText: 'Second Number',
//                   obscureText: false,
//                   prefixIcon: Icon(Icons.phone_android),
//                   validator: (value) {
//                     if (value.isEmpty) {
//                       return 'Second Number Shouldn\'t Be Empty';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height / 18.425,
//                 ),
//                 AuthTextFormField(
//                   controller: thirdPhoneController
//                     ..text = CacheHelper.getString('third phone') ?? '',
//                   hintText: 'Third Number',
//                   obscureText: false,
//                   prefixIcon: Icon(Icons.phone_android),
//                   validator: (value) {
//                     if (value.isEmpty) {
//                       return 'Third Number Shouldn\'t Be Empty';
//                     }
//                     return null;
//                   }, 
//                 ),
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height / 15,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width / 3.92,
//                       height: MediaQuery.of(context).size.height / 18.425,
//                       child: AuthButton(
//                           text: 'Cancel',
//                           onPressed: () {
//                             Navigator.pop(context);
//                           }),
//                     ),
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width / 3.92,
//                       height: MediaQuery.of(context).size.height / 18.425,
//                       child: AuthButton(
//                           text: 'Confirm',
//                           onPressed: () async {
//                             if (key.currentState!.validate()) {
//                               controller
//                                   .editPhones(
//                                       firstPhoneController,
//                                       secondPhoneController,
//                                       thirdPhoneController)
//                                   .then((value) => Navigator.pop(context));
//                             }
//                           }),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
