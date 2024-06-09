
import 'package:authentication_app/feature/login/data/repositories/login_repository_imp.dart';
import 'package:authentication_app/feature/login/domain/entities/login_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_login.g.dart';

@riverpod
LoginUsecase loginUsecase(LoginUsecaseRef ref) {
  final loginRepositoryImp = ref.read(loginRepostoryImpProvider);
  return LoginUsecase(loginRepositoryImp: loginRepositoryImp);
}

class LoginUsecase {
  final LoginRepositoryImp loginRepositoryImp;

  LoginUsecase({required this.loginRepositoryImp});

  FutureOr<LoginEntity?> userLogin({
    required String email,
    required String password,
  }) async {
    return await loginRepositoryImp.getUserLogin(
      email: email,
      password: password,
    );
  }
}
