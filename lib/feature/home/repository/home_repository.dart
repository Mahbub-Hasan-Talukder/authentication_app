import 'dart:async';
import 'dart:convert';
import 'package:authentication_app/feature/home/presentation/widgets/converter.dart';
import 'package:http/http.dart';

class HomeRepository{
  static FutureOr<Converter?> getInfo() async{
    Response response = await get(
        // Uri.parse('https://reqres.in/api/users/2'),
        Uri.parse('http://34.72.136.54:4067/api/v1/auth/me'),
      );
      // print(jsonDecode(response.body)['email']);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print(response.body);
        return Converter(data['data']['first_name'], data['data']['last_name'], data['data']['email']);
      } else {
        print('errror ${response.statusCode}');
        throw Exception('Something went wrong');
      }
  }
}