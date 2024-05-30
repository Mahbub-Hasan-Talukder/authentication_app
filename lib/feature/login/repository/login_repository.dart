import 'dart:async';

import 'package:authentication_app/core/service/api/endpoints.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

class LoginRepository{
  static FutureOr<bool?> signIn(String email, String password)async{
    Response response = await post(
          Uri.parse(API.login),
          body: {
            'email': email,
            'password': password,
            'OS': 'IOS',
            'model': 'iPhone 15',
            'FCMToken': 'Token1',
          },
        );
        if (response.statusCode != 201) {
          throw Exception('Something went wrong');
        } else {
          return true;
        }
  }
}