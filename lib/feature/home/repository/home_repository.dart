import 'dart:async';
import 'dart:convert';
import 'package:authentication_app/feature/home/presentation/widgets/converter.dart';
import 'package:http/http.dart';

class HomeRepository {
  static FutureOr<Converter?> getInfo(String? token) async {
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
/*

{
  "email": "moshi.bs23@gmail.com",
  "password": "password123",
  "OS": "Android || IOS",
  "model": "Model1",
  "FCMToken": "Token1"
}
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjQxZWRkYTE3ZGUzMDE3MzQ0MDcyODIiLCJzZXNzaW9uSWQiOiJhMDY3NThiZC1hZDUzLTRiOTktOTU2Ni1mYjhlYmQyZTEzNWMiLCJyb2xlIjoidXNlciIsImVtYWlsIjoibWFoYnViQHlvcG1haWwuY29tIiwidXNlckRhdGEiOnsiZmlyc3RuYW1lIjoibWFoYnViIiwibGFzdG5hbWUiOiJoYXNhbiIsImVtYWlsIjoibWFoYnViQHlvcG1haWwuY29tIiwiX2lkIjoiNjY0MWVkZGExN2RlMzAxNzM0NDA3MjgyIiwiaXNWZXJpZmllZCI6dHJ1ZX0sIkZDTVRva2VuIjoiVG9rZW4xIiwiT1MiOiJJT1MiLCJtb2RlbCI6Ik1vZGVsMSIsImlhdCI6MTcxNjk4ODc1NSwiZXhwIjoxNzE3MjQ3OTU1fQ.3WHidEZ3cvrH0z1TVab0Z7PhKjsyujTA25nS1kb2Ufw
 */