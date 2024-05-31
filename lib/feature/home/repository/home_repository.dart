import 'dart:async';
import 'dart:convert';
import 'package:authentication_app/core/service/api/endpoints.dart';
import 'package:authentication_app/feature/home/presentation/widgets/home_model_state.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeRepository {
  static FutureOr<ModelClass?> getInfo() async {
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
      final data = jsonDecode(response.body);
      return ModelClass(data['data']['firstname'], data['data']['lastname'],
          data['data']['email']);
    } else {
      throw Exception('Something went wrong');
    }
  }
}
