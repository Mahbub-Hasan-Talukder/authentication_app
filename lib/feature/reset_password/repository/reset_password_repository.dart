import 'package:authentication_app/core/service/api/endpoints.dart';
import 'package:http/http.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class ResetPasswordRepository {
  static FutureOr<bool?> resetPassword(
    String password,
    String confirmPassword,
    String email,
  ) async {
    Response response = await post(
      Uri.parse(API.setNewPassword),
      body: {
        'email': email,
        'password': password,
        'confirmPassword': confirmPassword,
      },
    );
    if (response.statusCode != 201) {
      throw Exception('Something went wrong');
    } else {
      return true;
    }
  }
}
