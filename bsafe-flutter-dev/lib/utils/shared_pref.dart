import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  static SharedPreferences? _prefs;

  static Future<SharedPreferences> initPref() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs!;
  }

  static Future<bool> setBool(String key, bool value) async {
    return await _prefs!.setBool(key, value);
  }

  static bool? getBool(String key) {
    return _prefs?.getBool(key);
  }

  static Future<bool> setString(String key, String value) async {
    return await _prefs!.setString(key, value);
  }

  static String? getString(String key) {
    return _prefs?.getString(key);
  }

  static void clearAll() async {
    _prefs?.clear();
  }
}
