import 'dart:async';

import 'package:authentication_app/feature/login/domain/entities/login_entity.dart';
import 'package:authentication_app/feature/login/domain/repository/login_repository.dart';

class LoginUsecase {
  final LoginRepository loginRepository;
  LoginUsecase(this.loginRepository);
  FutureOr<LoginEntity?> userLogin(
      {required String email, required String password}) async {
    return await loginRepository.getUserLogin(email: email, password: password);
  }
}
