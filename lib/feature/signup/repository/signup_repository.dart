import 'dart:async';
import 'package:authentication_app/core/service/api/endpoints.dart';
import 'package:authentication_app/feature/signup/presentation/widgets/profile_info.dart';
import 'package:http/http.dart';

class SignupRepository {
  static FutureOr<bool?> signUp(ProfileInfo profileInfo) async {
    Response response = await post(
      Uri.parse(API.signup),
      body: {
        'firstname': profileInfo.firstName,
        'lastname': profileInfo.lastName,
        'email': profileInfo.email,
        'password': profileInfo.password,
      },
    );
    if (response.statusCode != 201) {
      throw Exception('Something went wrong');
    } else {
      return true;
    }
  }
}
