import 'dart:async';

import 'package:authentication_app/feature/email_confirmation/repository/email_confirmation_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'email_confirmation_controller.g.dart';
@riverpod
class EmailConfirmationController extends _$EmailConfirmationController {
  @override
  FutureOr<bool?> build() {
    return null;
  }
  void emailConfirmation({required String email, required String code}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return EmailConfirmationRepository.emailConfirmation(email, code);
    });
  }
}