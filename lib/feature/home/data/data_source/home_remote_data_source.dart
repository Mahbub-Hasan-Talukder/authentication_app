import 'dart:async';
import 'dart:convert';

import 'package:authentication_app/core/service/api/endpoints.dart';
import 'package:authentication_app/feature/home/data/models/home_model.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeRemoteDataSource {
  static FutureOr<(HomeModel?, String?)> getProfileInfo() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      Response response = await get(
        Uri.parse(API.me),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        print('${response.statusCode}');
        (HomeModel?, String?) tmp = HomeModel.fromJson(jsonDecode(response.body));
        print(tmp.toString());
        return tmp;
      } else {
        return (null, jsonDecode(response.body)['message'].toString());
      }
    } catch (e) {
      return (null, e.toString());
    }
  }
}
