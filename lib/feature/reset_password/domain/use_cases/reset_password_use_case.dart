import 'package:authentication_app/feature/reset_password/domain/entities/reset_password_entity.dart';
import 'package:authentication_app/feature/reset_password/domain/repositories/reset_password_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'reset_password_use_case.g.dart';

@riverpod
ResetPassUseCase resetPassUseCase(ResetPassUseCaseRef ref) {
  final resetPassRepo = ref.read(resetPassRepositoryProvider);
  return ResetPassUseCase(resetPassRepo: resetPassRepo);
}

class ResetPassUseCase {
  final ResetPassRepository resetPassRepo;

  ResetPassUseCase({required this.resetPassRepo});

  FutureOr<(ResetPassEntity?, String?)> resetPass({
    required email,
    required password,
    required confirmPassword,
  }) async {
    return await resetPassRepo.resetPass(
      email: email,
      password: password,
      confirmPassword: confirmPassword,
    );
  }
}
