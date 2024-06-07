import 'package:authentication_app/feature/email_confirmation/data/repositories/email_confirmation_repository_imp.dart';
import 'package:authentication_app/feature/email_confirmation/data/repositories/resend_otp_repository_imp.dart';
import 'package:authentication_app/feature/email_confirmation/domain/entities/email_confirmation_entity.dart';
import 'package:authentication_app/feature/email_confirmation/domain/entities/resend_otp_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'resend_otp_use_case.g.dart';

@riverpod
ResendOtpUseCase resendOtpUseCase(Ref ref) {
  final resendOtpImp = ref.read(resendOtpRepositoryImpProvider);
  return ResendOtpUseCase(resendOtpImp: resendOtpImp);
}

class ResendOtpUseCase {
  final ResendOtpRepositoryImp resendOtpImp;

  ResendOtpUseCase({required this.resendOtpImp});

  static FutureOr<(ResendOtpEntity?, String?)> resendOtp({
    required email,
  }) async {
    return await resendOtpImp.resendOtp(
      email: email,
    );
  }
}
