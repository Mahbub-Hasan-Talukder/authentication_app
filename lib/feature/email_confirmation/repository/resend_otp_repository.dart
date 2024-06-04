import 'dart:async';

import 'package:authentication_app/core/service/api/endpoints.dart';
import 'package:http/http.dart';

class ResendOtpRepository {
  static FutureOr<bool?> resendOtp(String email) async {
    Response response = await post(
      Uri.parse(API.resendOtp),
      body: {
        'email': email,
      },
    );
    if (response.statusCode != 201) {
      return false;
    } 
    return true;
  }
}
