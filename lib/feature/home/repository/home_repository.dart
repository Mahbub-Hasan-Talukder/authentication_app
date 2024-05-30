import 'dart:async';
import 'dart:convert';
import 'package:authentication_app/feature/home/presentation/widgets/converter.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeRepository {
  static FutureOr<Converter?> getInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    Response response = await get(
      Uri.parse('http://34.72.136.54:4067/api/v1/auth/me'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return Converter(data['data']['firstname'], data['data']['lastname'],
          data['data']['email']);
    } else {
      print('errror ${response.statusCode}');
      throw Exception('Something went wrong');
    }
  }
}
