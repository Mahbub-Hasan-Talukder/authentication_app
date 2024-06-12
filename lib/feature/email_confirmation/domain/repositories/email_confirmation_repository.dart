import 'package:authentication_app/feature/email_confirmation/data/data_source/remote_data_source.dart';
import 'package:authentication_app/feature/email_confirmation/data/repositories/email_confirmation_repository_imp.dart';
import 'package:authentication_app/feature/email_confirmation/domain/entities/email_confirmation_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'email_confirmation_repository.g.dart';

@riverpod
EmailConfirmationRepository emailConfirmationRepository(
    EmailConfirmationRepositoryRef ref) {
  final emailConfirmationRemoteDataSource =
      ref.read(emailConfirmationRemoteDataSourceProvider);
  return EmailConfirmationRepositoryImp(emailConfirmationRemoteDataSource);
}

abstract class EmailConfirmationRepository {
  FutureOr<(EmailConfirmationEntity?, String?)> emailConfirmation({
    required email,
    required otp,
  });
  FutureOr<(EmailConfirmationEntity?, String?)> resendOtp({required email});
}
