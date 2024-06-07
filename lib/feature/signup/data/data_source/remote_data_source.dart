import 'dart:async';
import 'dart:convert';
import 'package:authentication_app/core/service/api/endpoints.dart';
import 'package:authentication_app/feature/signup/data/model/signup_model.dart';
import 'package:authentication_app/feature/signup/presentation/widgets/profile_info.dart';
import 'package:http/http.dart';

class SignUpRemoteDataSource {
  FutureOr<(SignUpModel?, String?)> signUp(ProfileInfo profileInfo) async {
     Response response = await post(
        Uri.parse(API.signup),
        body: {
          'firstname': profileInfo.firstName,
          'lastname': profileInfo.lastName,
          'email': profileInfo.email,
          'password': profileInfo.password,
        },
      );
      if(response.statusCode==201) {
        return (SignUpModel.fromJson(jsonDecode(response.body)), null);
      } else {
        return (null, jsonDecode(response.body)['message'].toString());
      }
  }
}
