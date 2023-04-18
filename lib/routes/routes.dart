import 'package:graduation_project/logic/bindings/Shared_Binding.dart';
import 'package:graduation_project/logic/bindings/auth_binding.dart';
import 'package:graduation_project/logic/bindings/mainScreen_binding.dart';
import 'package:graduation_project/view/screens/Home_screen.dart';
import 'package:graduation_project/view/screens/OTP_form.dart';
import 'package:graduation_project/view/screens/auth/login_screen.dart';
import 'package:graduation_project/view/screens/auth/signup_screen.dart';
import 'package:graduation_project/view/screens/main_screen.dart';
import 'package:graduation_project/view/screens/profile_screen.dart';
import 'package:graduation_project/view/screens/setting_screen.dart';
import 'package:graduation_project/view/screens/splash_screen.dart';
import 'package:graduation_project/view/screens/tips_screen.dart';
import 'package:graduation_project/view/screens/welcome_screen.dart';
import 'package:get/get.dart';

import '../view/screens/auth/onBoarding_screen.dart';
import '../view/screens/edit_profile_screen.dart';
import '../view/screens/maps.dart';
import '../view/screens/order_rented.dart';
import '../view/screens/petrol_categories.dart';
import '../view/screens/profile_screen.dart';

class AppRoutes {
  static const welcome = Routes.splashScreen;

  static final routes = [
    GetPage(
      name: Routes.WelcomeScreen,
      page: () => WelcomeScreen(),
    ),
    GetPage(
      name: Routes.LoginScreen,
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.SignUpScreen,
      page: () => SignUpScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.mainScreen,
      page: () => mainScreen(),
      binding: MainBinding(),
    ),
    GetPage(
        name: Routes.HomeScreen,
        page: () => HomeScreen(),
        bindings: [AuthBinding(), MainBinding()]),
    GetPage(
      name: Routes.PetrolCategories,
      page: () => PetrolCategories(),
      binding: MainBinding(),
    ),
    GetPage(
      name: Routes.SettingsScreen,
      page: () => SettingsScreen(),
      binding: MainBinding(),
    ),
    GetPage(name: Routes.TipsScreen, page: () => TipsScreen()),
    GetPage(
        name: Routes.MapScreen,
        page: () => MapScreen(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.OrderRented,
        page: () => OrderRented(),
        binding: AuthBinding()),

    GetPage(
        name: Routes.ProfileScreen,
        page: () => ProfileScreen(),
        binding: AuthBinding()),

    GetPage(
        name: Routes.EditProfileScreen,
        page: () => EditProfileScreen(),
        binding: AuthBinding()),
    GetPage(name: Routes.splashScreen, page: () => SplashScreen(), bindings: [
      AuthBinding(),
    ]),
    GetPage(
        name: Routes.OnBoardingScreen,
        page: () => OnBoardingScreen(),
        bindings: [
          AuthBinding(),
        ]),
    GetPage(name: Routes.OtpForm, page: () => OtpForm())
  ];
}

class Routes {
  static const first = '/';
  static const WelcomeScreen = '/welcomeScreen';
  static const LoginScreen = '/loginScreen';
  static const SignUpScreen = '/signUpScreen';
  static const mainScreen = '/mainScreen';
  static const OnBoardingScreen = '/OnBoardingScreen';
  static const ProfileScreen = '/ProfileScreen';
  static const EditProfileScreen = '/EditProfileScreen';
  static const HomeScreen = '/HomeScreen';
  static const SettingsScreen = '/SettingsScreen';
  static const splashScreen = '/splashScreen';
  static const OtpForm = '/OtpForm';
  static const TipsScreen = '/TipsScreen';
  static const MapScreen = '/MapScreen';
  static const OrderRented = '/OrderRented';
  static const PetrolCategories = '/PetrolCategories';
}
