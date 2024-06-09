import 'package:authentication_app/feature/login/data/models/login_model.dart';
import 'package:authentication_app/feature/login/domain/entities/login_entity.dart';
import 'package:authentication_app/feature/login/domain/entities/user_entity.dart';
import 'package:authentication_app/feature/signup/domain/entities/signup_entity.dart';

class SignUpModel extends SignUpEntity {
  SignUpModel({
    required super.message,
  });

  static SignUpModel fromJson(Map<String, dynamic> json) {
    final String message = json['message'];

    return SignUpModel(
      message: message,
    );
  }
}
