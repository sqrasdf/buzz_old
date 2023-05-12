import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesFunctions {
  // keys
  static String userLoggedInKey = "";
  static String userNameKey = "";
  static String userEmailKey = "";

  // saving the data in shared preferences
  static Future<bool> saveUserLoggedInStatus(bool isUserLoggedIn) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return await sp.setBool(userLoggedInKey, isUserLoggedIn);
  }

  static Future<bool> saveUserEmail(String email) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return await sp.setString(userEmailKey, email);
  }

  static Future<bool> saveUserName(String name) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return await sp.setString(userNameKey, name);
  }
}
