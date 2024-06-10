import 'dart:async';
import 'package:authentication_app/feature/signup/domain/entities/signup_entity.dart';
import 'package:authentication_app/feature/signup/presentation/widgets/profile_info.dart';

abstract class SignUpRepository {
  FutureOr<(SignUpEntity?, String?)> signUp({
    required ProfileInfo profileInfo,
  });
}
