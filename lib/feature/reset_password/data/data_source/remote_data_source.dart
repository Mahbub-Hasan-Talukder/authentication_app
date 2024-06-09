import 'dart:async';
import 'dart:convert';
import 'package:authentication_app/core/service/api/endpoints.dart';
import 'package:authentication_app/feature/reset_password/data/models/reset_password_model.dart';
import 'package:http/http.dart';

class ResetPasswordRemoteDataSource {
  static FutureOr<(ResetPasswordModel?, String?)> resetPassword({
    required email,
    required password,
    required confirmPassword,
  }) async {
    try {
      Response response = await post(
        Uri.parse(API.setNewPassword),
        body: {
          "email": email,
          "password": password,
          "confirmPassword": confirmPassword,
        },
      );

      if (response.statusCode == 201) {
        return (ResetPasswordModel.fromJson(jsonDecode(response.body)), null);
      } else {
        return (null, jsonDecode(response.body)['message'].toString());
      }
    } catch (e) {
      return (null, e.toString());
    }
  }
}
