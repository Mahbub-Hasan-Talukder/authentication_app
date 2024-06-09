import 'dart:convert';

import 'package:authentication_app/core/service/api/endpoints.dart';
import 'package:authentication_app/feature/email_confirmation/data/data_source/remote_data_source.dart';
import 'package:authentication_app/feature/email_confirmation/data/models/email_confirmation_model.dart';
import 'package:authentication_app/feature/email_confirmation/domain/repositories/email_confirmation_repository.dart';
import 'package:http/http.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'email_confirmation_repository_imp.g.dart';

@riverpod
EmailConfirmationRepositoryImp emailConfirmationRepositoryImp(
    EmailConfirmationRepositoryImpRef ref) {
  return EmailConfirmationRepositoryImp(EmailConfirmationRemoteDataSource());
}

class EmailConfirmationRepositoryImp implements EmailConfirmationRepository {
  EmailConfirmationRemoteDataSource emailConfirmationRemoteDataSource;

  EmailConfirmationRepositoryImp(this.emailConfirmationRemoteDataSource);

  @override
  FutureOr<(EmailConfirmationModel?, String?)> emailConfirmation({
    required email,
    required otp,
  }) async {
    return await EmailConfirmationRemoteDataSource.emailConfirmation(
        email: email, otp: otp);
  }

  @override
  FutureOr<(EmailConfirmationModel?, String?)> resendOtp(
      {required email}) async {
    Response response = await post(
      Uri.parse(API.resendOtp),
      body: {
        'email': email,
      },
    );
    if (response.statusCode != 201) {
      return (null, jsonDecode(response.body)['message'].toString());
    }
    return (EmailConfirmationModel.fromJson(jsonDecode(response.body)), null);
  }
}
