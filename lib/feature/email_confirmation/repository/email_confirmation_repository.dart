import 'dart:async';

import 'package:authentication_app/core/service/api/endpoints.dart';
import 'package:http/http.dart';

class EmailConfirmationRepository{
  static FutureOr<bool?> emailConfirmation(String email, String code)async{
    Response response = await post(
          Uri.parse(API.verifyOtp),
          body: {
            'email': email,
            'otp': code,
          },
        );
        if (response.statusCode != 201) {
          throw Exception('Something went wrong');
        } else {
          return true;
        }
  }
}