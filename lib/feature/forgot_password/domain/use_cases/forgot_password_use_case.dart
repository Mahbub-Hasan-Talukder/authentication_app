import 'package:authentication_app/feature/forgot_password/data/repositories/forgot_password_repository_imp.dart';
import 'package:authentication_app/feature/forgot_password/domain/entities/forgot_password_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'forgot_password_use_case.g.dart';

@riverpod
ForgotPasswordUseCase forgotPasswordUseCase(ForgotPasswordUseCaseRef ref) {
  final forgotPasswordImp = ref.read(forgotPasswordRepositoryImpProvider);
  return ForgotPasswordUseCase(forgotPasswordImp: forgotPasswordImp);
}

class ForgotPasswordUseCase {
  final ForgotPasswordRepositoryImp forgotPasswordImp;

  ForgotPasswordUseCase({required this.forgotPasswordImp});

  FutureOr<(ForgotPasswordEntity?, String?)> forgotPassword({
    required String email,
  }) async {
    return await forgotPasswordImp.forgotPassword(
      email: email,
    );
  }
}
