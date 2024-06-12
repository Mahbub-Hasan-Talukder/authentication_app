import 'package:authentication_app/feature/forgot_password/domain/entities/forgot_password_entity.dart';
import 'package:authentication_app/feature/forgot_password/domain/repositories/forgot_password_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'forgot_password_use_case.g.dart';

@riverpod
ForgotPasswordUseCase forgotPasswordUseCase(ForgotPasswordUseCaseRef ref) {
  final forgotPasswordRepository = ref.read(forgotPasswordRepositoryProvider);
  return ForgotPasswordUseCase(
      forgotPasswordRepository: forgotPasswordRepository);
}

class ForgotPasswordUseCase {
  final ForgotPasswordRepository forgotPasswordRepository;

  ForgotPasswordUseCase({required this.forgotPasswordRepository});

  FutureOr<(ForgotPasswordEntity?, String?)> forgotPassword({
    required String email,
  }) async {
    return await forgotPasswordRepository.forgotPassword(
      email: email,
    );
  }
}
