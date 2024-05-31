import 'dart:async';
import 'package:authentication_app/core/service/api/endpoints.dart';
import 'package:http/http.dart';

class SignupRepository {
  static FutureOr<bool?> signUp({
    required firstName,
    required lastName,
    required email,
    required password,
  }) async {
    Response response = await post(
      Uri.parse(API.signup),
      body: {
        'firstname': firstName,
        'lastname': lastName,
        'email': email,
        'password': password,
      },
    );
    if (response.statusCode != 201) {
      throw Exception('Something went wrong');
    } else {
      return true;
    }
  }
}
