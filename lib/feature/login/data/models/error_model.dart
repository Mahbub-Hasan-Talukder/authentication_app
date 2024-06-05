import 'package:authentication_app/feature/login/domain/entities/login_entity.dart';

class ErrorModel extends LoginEntity {
  ErrorModel({required super.message});
  static ErrorModel fromJson(Map<String, dynamic> json) {
    final String message = json['message'];

    return ErrorModel(
      message: message,
    );
  }
}
