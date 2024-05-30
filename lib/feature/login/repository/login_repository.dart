import 'dart:async';
import 'dart:convert';

import 'package:authentication_app/core/service/api/endpoints.dart';
import 'package:authentication_app/feature/login/presentation/widgets/state_type.dart';
import 'package:http/http.dart';

class LoginRepository{
  static FutureOr<StateType?> signIn(String email, String password)async{
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
          return StateType(true, jsonDecode(response.body)['token']);
        }
  }
}