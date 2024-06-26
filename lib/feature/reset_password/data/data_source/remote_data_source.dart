import 'dart:convert';

import 'package:authentication_app/core/service/api/endpoints.dart';
import 'package:authentication_app/feature/reset_password/data/models/reset_password_model.dart';
import 'package:http/http.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'remote_data_source.g.dart';

@riverpod
ResetPassRemoteDataSource resetPassRemoteDataSource(
    ResetPassRemoteDataSourceRef ref) {
  return ResetPassRemoteDataSource();
}

class ResetPassRemoteDataSource {
  static FutureOr<(ResetPassModel?, String?)> resetPass({
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
        return (ResetPassModel.fromJson(jsonDecode(response.body)), null);
      } else {
        return (null, jsonDecode(response.body)['message'].toString());
      }
    } catch (e) {
      return (null, e.toString());
    }
  }
}
