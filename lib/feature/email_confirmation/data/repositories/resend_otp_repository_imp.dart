import 'dart:async';
import 'dart:convert';

import 'package:authentication_app/core/service/api/endpoints.dart';
import 'package:authentication_app/feature/email_confirmation/data/models/resend_otp_model.dart';
import 'package:authentication_app/feature/email_confirmation/domain/repositories/resend_otp_repository.dart';
import 'package:http/http.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'resend_otp_repository_imp.g.dart';

@riverpod
ResendOtpRepositoryImp resendOtpRepositoryImp(ResendOtpRepositoryImpRef ref) {
  return ResendOtpRepositoryImp();
}

class ResendOtpRepositoryImp extends ResendOtpRepository {
  @override
  FutureOr<(ResendOtpModel?, String?)> resendOtp({required email}) async {
    Response response = await post(
      Uri.parse(API.resendOtp),
      body: {
        'email': email,
      },
    );
    if (response.statusCode != 201) {
      return (null, jsonDecode(response.body)['message'].toString());
    }
    return (ResendOtpModel.fromJson(jsonDecode(response.body)), null);
  }
}
