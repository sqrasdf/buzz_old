import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesFunctions {
  // keys
  static String userLoggedInKey = "USERLOGGEDINKEY";
  static String userEmailKey = "USEREMAILKEY";
  static String userNameKey = "USERNAMEKEY";

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

  // getting the data from the shared preferences
  static Future<bool?> getUserLoggedInStatus() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getBool(userLoggedInKey);
  }

  static Future<String?> getUserEmail() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString(userEmailKey);
  }

  static Future<String?> getUserName() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString(userNameKey);
  }
}
