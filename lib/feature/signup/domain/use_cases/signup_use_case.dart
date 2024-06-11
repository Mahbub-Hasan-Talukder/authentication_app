import 'package:authentication_app/feature/signup/data/repository/signup_repository_imp.dart';
import 'package:authentication_app/feature/signup/domain/entities/signup_entity.dart';
import 'package:authentication_app/feature/signup/presentation/widgets/profile_info.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'signup_use_case.g.dart';

@riverpod
SignupUseCase signUpUseCase(SignUpUseCaseRef ref) {
  final signUpImp = ref.read(signUpRepositoryImpProvider);
  return SignupUseCase(signUpImp: signUpImp);
}

class SignupUseCase {
  final SignUpRepositoryImp signUpImp;

  SignupUseCase({required this.signUpImp});

  FutureOr<(SignUpEntity?, String?)> signUp({
    required ProfileInfo profileInfo,
  }) async {
    return await signUpImp.signUp(
      profileInfo:  profileInfo,
    );
  }
}
