import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static Future<void> saveCookie({required String cookie}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("token", cookie);
  }

  static Future<String> getCookie() async {
    final prefs = await SharedPreferences.getInstance();

    final cookie = prefs.getString("token");
    return cookie ?? '';
  }
}
