import 'package:authentication_app/feature/login/data/repositories/login_repository_imp.dart';
import 'package:authentication_app/feature/login/domain/entities/login_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_login.g.dart';

@riverpod
LoginUsecase loginUsecase(LoginUsecaseRef ref) {
  final loginImp = ref.read(loginRepostoryImpProvider);
  return LoginUsecase(loginImp: loginImp);
}

class LoginUsecase {
  final LoginRepositoryImp loginImp;

  LoginUsecase({required this.loginImp});

  FutureOr<LoginEntity?> userLogin({
    required email,
    required password,
    required enableCheckbox,
  }) async {
    return await loginImp.getUserLogin(
      email: email,
      password: password,
      enableCheckbox: enableCheckbox,
    );
  }
}
