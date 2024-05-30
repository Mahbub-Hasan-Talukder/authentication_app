import 'dart:async';
import 'dart:convert';

import 'package:authentication_app/core/service/api/endpoints.dart';
import 'package:authentication_app/feature/login/presentation/widgets/state_type.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogoutRepository {
  static FutureOr<bool?> signOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    Response response = await post(
      Uri.parse(API.logout),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode != 201) {
      throw Exception('Something went wrong');
    } else {
      prefs.clear();
      print(prefs.getString('token'));
      return true;
    }
  }
}
