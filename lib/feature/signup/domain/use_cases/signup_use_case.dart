import 'package:authentication_app/feature/signup/domain/entities/signup_entities.dart';
import 'package:authentication_app/feature/signup/domain/repositories/signup_repository.dart';
import 'package:authentication_app/feature/signup/presentation/widgets/profile_info.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'signup_use_case.g.dart';

@riverpod
SignupUseCase signUpUseCase(SignUpUseCaseRef ref) {
  final signUpRepository = ref.read(signUpRepositoryProvider);
  return SignupUseCase(signUpRepository: signUpRepository);
}

class SignupUseCase {
  final SignUpRepository signUpRepository;

  SignupUseCase({required this.signUpRepository});

  FutureOr<(SignUpEntity?, String?)> signUp({
    required ProfileInfo profileInfo,
  }) async {
    return await signUpRepository.signUp(
      profileInfo: profileInfo,
    );
  }
}
