import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class LoginLocalDataSource {
  final String key, value;

  LoginLocalDataSource({required this.key, required this.value});

  void setCacheData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  FutureOr<String?> getCacheData({required String key}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }
}
