import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginLocalDataSource {
  void setCacheData({required key, required value}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(key, value);
    } catch (e) {
      throw Exception('something went wrong');
    }
  }

  void removeCacheData({required key}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove(key);
    } catch (e) {
      throw Exception('something went wrong');
    }
  }

  FutureOr<String?> getCacheData({required String key}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString(key);
    } catch (e) {
      throw Exception('something went wrong');
    }
  }
}
