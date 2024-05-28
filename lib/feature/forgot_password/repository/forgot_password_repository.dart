import 'dart:async';

import 'package:authentication_app/core/service/api/endpoints.dart';
import 'package:http/http.dart';

class ForgotPasswordRepository{
  static FutureOr<bool?> forgotPassword(String email)async{
    Response response = await post(
          Uri.parse(API.forgetPassword),
          body: {
            'email': email,
          },
        );
        if (response.statusCode != 201) {
          throw Exception('Something went wrong');
        } else {
          return true;
        }
  }
}