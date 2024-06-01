import 'dart:async';
import 'package:authentication_app/feature/email_confirmation/repository/resend_otp_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'otp_controller.g.dart';

@riverpod
class OtpController extends _$OtpController {
  @override
  FutureOr<bool?> build() {
    return null;
  }

  Future<void> resendEmail(String email) async {
    state = const AsyncValue.data(null);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return ResendOtpRepository.resendOtp(email);
    });
  }
}
