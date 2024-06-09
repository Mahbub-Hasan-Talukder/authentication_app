import 'dart:async';
import 'package:authentication_app/feature/email_confirmation/domain/entities/email_confirmation_entity.dart';
import 'package:authentication_app/feature/email_confirmation/domain/use_cases/email_confirmation_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'otp_controller.g.dart';

@riverpod
class OtpController extends _$OtpController {
  @override
  FutureOr<(EmailConfirmationEntity?, String?)> build() {
    return (null, null);
  }

  Future<void> resendEmail(String email) async {
    state = const AsyncValue.data((null, null));
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return ref.read(emailConfirmationUseCaseProvider).resendOtp(email: email);
    });
  }
}
