import 'package:authentication_app/feature/email_confirmation/domain/entities/email_confirmation_entity.dart';
import 'package:authentication_app/feature/email_confirmation/domain/entities/resend_otp_entity.dart';

class ResendOtpModel extends ResendOtpEntity {
  ResendOtpModel({required super.message});

  static ResendOtpModel fromJson(Map<String, dynamic> json) {
    final String message = json['message'];

    return ResendOtpModel(
      message: message,
    );
  }
}
