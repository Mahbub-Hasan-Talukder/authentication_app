import 'package:authentication_app/feature/forgot_password/domain/entities/forgot_password_entity.dart';

class ForgotPasswordModel extends ForgotPasswordEntity {
  ForgotPasswordModel({
    required super.message,
  });

  static ForgotPasswordModel fromJson(Map<String, dynamic> json) {
    final String message = json['message'];

    return ForgotPasswordModel(
      message: message,
    );
  }
}
