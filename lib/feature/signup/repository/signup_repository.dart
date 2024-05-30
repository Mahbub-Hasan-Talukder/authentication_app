import 'dart:async';

import 'package:authentication_app/core/service/api/endpoints.dart';
import 'package:http/http.dart';

class SignupRepository{
  static FutureOr<bool?> signUp(String firstName, String lastName, String email, String password)async{
    Response response = await post(
          Uri.parse(API.signup),
          body: {
            'firstName': firstName,
            'lastName': lastName,
            'email': email,
            'password': password
          },
        );
        if (response.statusCode != 201) {
          throw Exception('Something went wrong');
        } else {
          return true;
        }
  }
}