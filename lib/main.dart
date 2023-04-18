import 'package:graduation_project/cache_helper/cache_helper.dart';
import 'package:graduation_project/logic/controllers/main_controller.dart';
import 'package:graduation_project/routes/routes.dart';
import 'package:graduation_project/view/screens/Home_screen.dart';
import 'package:graduation_project/view/screens/OTP_form.dart';
import 'package:graduation_project/view/screens/auth/onBoarding_screen.dart';
import 'package:graduation_project/view/screens/main_screen.dart';
import 'package:graduation_project/view/screens/splash_screen.dart';
import 'package:graduation_project/view/screens/welcome_screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:graduation_project/cache_helper/cache_helper.dart';
import 'package:hexcolor/hexcolor.dart';

bool darkMode =false ;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await CacheHelper.init();
  Get.put(mainConrtoller());
  // darkMode = CacheHelper.getBoolean('darkMode');
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark, statusBarColor: Colors.white));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return 
    GetMaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        
      ),
      // themeMode: ThemeMode.dark, 
      // darkTheme: ThemeData(
      //   scaffoldBackgroundColor: HexColor('333739'),
      //   appBarTheme: AppBarTheme(
      //     systemOverlayStyle: SystemUiOverlayStyle(
      //       statusBarColor: HexColor('333739'),
      //       statusBarBrightness: Brightness.light,
      //     ),
      //     backgroundColor: HexColor('333739'),
      //     elevation: 0,
      //     titleTextStyle: TextStyle(
      //       fontSize: 20,
      //       color: Colors.white,
      //     ),
      //     iconTheme: IconThemeData(
      //       color: Colors.white
      //       )

      //   ),
      //   bottomNavigationBarTheme: BottomNavigationBarThemeData(
      //     backgroundColor: HexColor('333739'),
      //   ),
      //   textTheme: TextTheme(
          
      //   ),
      // ),
        home: Directionality(
          textDirection: TextDirection.rtl,
          child: SplashScreen(),
        ),
        debugShowCheckedModeBanner: false,
        getPages: AppRoutes.routes
        );
  }
}
