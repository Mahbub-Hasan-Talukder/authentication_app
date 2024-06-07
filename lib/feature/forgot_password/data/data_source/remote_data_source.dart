import 'dart:async';
import 'dart:convert';
import 'package:authentication_app/core/service/api/endpoints.dart';
import 'package:authentication_app/feature/forgot_password/data/models/forgot_password_model.dart';
import 'package:http/http.dart';

class ForgotPasswordRemoteDataSource {
  static FutureOr<(ForgotPasswordModel?, String?)> forgotPassword(
      {required email}) async {
    try {
      Response response = await post(
        Uri.parse(API.forgetPassword),
        body: {
          'email': email,
        },
      );
      if (response.statusCode == 201) {
        return (ForgotPasswordModel.fromJson(jsonDecode(response.body)), null);
      } else {
        return (null, jsonDecode(response.body)['message'].toString());
      }
    } catch (e) {
      return (null, e.toString());
    }
  }
}
