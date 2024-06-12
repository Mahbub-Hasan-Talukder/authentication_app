import 'package:authentication_app/feature/email_confirmation/domain/entities/email_confirmation_entity.dart';
import 'package:authentication_app/feature/email_confirmation/domain/repositories/email_confirmation_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'email_confirmation_use_case.g.dart';

@riverpod
EmailConfirmationUseCase emailConfirmationUseCase(
    EmailConfirmationUseCaseRef ref) {
  final emailConfirmationRepository =
      ref.read(emailConfirmationRepositoryProvider);
  return EmailConfirmationUseCase(
      emailConfirmationRepository: emailConfirmationRepository);
}

class EmailConfirmationUseCase {
  final EmailConfirmationRepository emailConfirmationRepository;

  EmailConfirmationUseCase({required this.emailConfirmationRepository});

  FutureOr<(EmailConfirmationEntity?, String?)> emailConfirmation({
    required email,
    required otp,
  }) async {
    return await emailConfirmationRepository.emailConfirmation(
      email: email,
      otp: otp,
    );
  }

  FutureOr<(EmailConfirmationEntity?, String?)> resendOtp({
    required email,
  }) async {
    return await emailConfirmationRepository.resendOtp(
      email: email,
    );
  }
}
