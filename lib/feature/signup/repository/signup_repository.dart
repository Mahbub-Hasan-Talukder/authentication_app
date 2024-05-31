import 'dart:async';

import 'package:authentication_app/core/service/api/endpoints.dart';
import 'package:http/http.dart';

class SignupRepository{
  static FutureOr<bool?> signUp(String firstName, String lastName, String email, String password)async{
    print('$firstName $lastName $email $password');
    Response response = await post(
          Uri.parse(API.signup),
          body: {
            'firstname': firstName,
            'lastname': lastName,
            'email': email,
            'password': password
          },
        );
        print(response.statusCode);
        if (response.statusCode != 201) {
          throw Exception('Something went wrong');
        } else {
          return true;
        }
  }
}