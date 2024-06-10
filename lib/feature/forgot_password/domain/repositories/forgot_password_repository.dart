import 'dart:async';
import 'package:authentication_app/feature/forgot_password/domain/entities/forgot_password_entity.dart';

abstract class ForgotPasswordRepository {
  FutureOr<(ForgotPasswordEntity?, String?)> forgotPassword({
    required String email,
  });
}
