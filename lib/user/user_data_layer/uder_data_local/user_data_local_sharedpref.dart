import 'package:shared_preferences/shared_preferences.dart';

class UserSharedPreferncess {
  static String key = 'username';

// Write DATA
  static Future saveUserData(value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    await sharedPreferences.setString(key, value);
  }

// Read Data
  static Future getUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(key);
  }
}
