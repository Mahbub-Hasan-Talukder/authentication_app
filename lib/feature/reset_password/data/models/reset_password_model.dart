import 'package:authentication_app/feature/reset_password/domain/entities/reset_password_entity.dart';

class ResetPassModel extends ResetPassEntity {
  ResetPassModel({required super.message});

  static ResetPassModel fromJson(Map<String, dynamic> json) {
    final String message = json['message'];

    return ResetPassModel(
      message: message,
    );
  }
}
