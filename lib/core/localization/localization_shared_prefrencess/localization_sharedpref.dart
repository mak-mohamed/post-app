import 'package:shared_preferences/shared_preferences.dart';

class LocalizationSharedPreferncess {
  static String localstring = 'localization';

// Write DATA
  static Future saveUserData(value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(localstring, value);
    print('we are in save localiz');
  }

// Read Data
  static Future<String?> getUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    print('we are in get local');
    return sharedPreferences.getString(localstring);
  }

static Future<String> LocalizationsString () async {
  String? locale = await   LocalizationSharedPreferncess.getUserData() ;
  print(locale) ;
 return locale==null?'en':localstring ;
  }
}

