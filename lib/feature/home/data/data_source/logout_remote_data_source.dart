import 'dart:async';
import 'dart:convert';

import 'package:authentication_app/core/service/api/endpoints.dart';
import 'package:authentication_app/feature/home/data/models/logout_model.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogoutRemoteDataSource {
  static FutureOr<(LogoutModel?, String?)> signOut() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      Response response = await post(
        Uri.parse(API.logout),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 201) {
        return LogoutModel.fromJson(jsonDecode(response.body));
      } else {
        prefs.clear();
        return (null, jsonDecode(response.body)['message'].toString());
      }
    } catch (e) {
      return (null, e.toString());
    }
  }
}
