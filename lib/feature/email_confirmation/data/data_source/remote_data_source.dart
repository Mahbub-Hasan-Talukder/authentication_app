import 'dart:async';
import 'dart:convert';
import 'package:authentication_app/core/service/api/endpoints.dart';
import 'package:authentication_app/feature/email_confirmation/data/models/email_confirmation_model.dart';
import 'package:http/http.dart';

class EmailConfirmationRemoteDataSource {
  static FutureOr<(EmailConfirmationModel?, String?)> emailConfirmation({
    required email,
    required otp,
  }) async {
    try {
      Response response = await post(
        Uri.parse(API.verifyOtp),
        body: {
          "email": email,
          "otp": otp,
        },
      );
      if (response.statusCode == 201) {
        return (
          EmailConfirmationModel.fromJson(jsonDecode(response.body)),
          null
        );
      } else {
        return (null, jsonDecode(response.body)['message'].toString());
      }
    } catch (e) {
      return (null, e.toString());
    }
  }

  static FutureOr<(EmailConfirmationModel?, String?)> resendOtp({
    required email,
  }) async {
    try {
      Response response = await post(
        Uri.parse(API.resendOtp),
        body: {
          'email': email,
        },
      );
      if (response.statusCode == 201) {
        return (
          EmailConfirmationModel.fromJson(jsonDecode(response.body)),
          null
        );
      } else {
        return (null, jsonDecode(response.body)['message'].toString());
      }
    } catch (e) {
      return (null, e.toString());
    }
  }
}
