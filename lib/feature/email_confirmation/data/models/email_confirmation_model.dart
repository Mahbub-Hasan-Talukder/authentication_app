import 'package:authentication_app/feature/email_confirmation/domain/entities/email_confirmation_entity.dart';

class EmailConfirmationModel extends EmailConfirmationEntity {
  EmailConfirmationModel({required super.message});

  static EmailConfirmationModel fromJson(Map<String, dynamic> json) {
    final String message = json['message'];

    return EmailConfirmationModel(
      message: message,
    );
  }
}
