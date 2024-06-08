import 'package:authentication_app/feature/reset_password/domain/entities/reset_password_entity.dart';

class ResetPasswordModel extends ResetPasswordEntity{
  ResetPasswordModel({required super.message});

  static ResetPasswordModel fromJson(Map<String, dynamic> json) {
    final String message = json['message'];

    return ResetPasswordModel(
      message: message,
    );
  }
}