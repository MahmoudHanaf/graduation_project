import 'package:shared_preferences/shared_preferences.dart'; // '@dart=2.9'

class CacheHelper {
  static late SharedPreferences preferences;
  static Future init() async {
    preferences = await SharedPreferences.getInstance();
    print(preferences.getBool('isLogin'));
    print(preferences.getBool('isBoarding'));
  }

  static void setLogin(bool isLogin) async {
    await preferences.setBool('isLogin', isLogin);
  }

  static void remove(String key) async {
    await preferences.remove(key);
  }

  static bool? getBoolean(String key) {
    return preferences.getBool(key);
  }

  static String? getString(String key) {
    return preferences.getString(key);
  }

  static void setBoolean(String key, bool value) async {
    await preferences.setBool(key, value);
  }

  static Future setString(String key, String value) async {
    await preferences.setString(key, value);
  }

  static void setBoardingScreen(bool isBoarding) async {
    setBoolean('isBoarding', isBoarding);
    print(preferences.getBool('isBoarding'));
  }

  static bool? getBoardingScreen() {
    return preferences.getBool('isBoarding');
  }
}
