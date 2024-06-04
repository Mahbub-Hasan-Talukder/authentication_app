import 'package:authentication_app/feature/login/data/datasources/remote_data_source.dart';
import 'package:authentication_app/feature/login/data/models/login_model.dart';
import 'package:authentication_app/feature/login/data/repositories/login_repository_imp.dart';
import 'package:authentication_app/feature/login/domain/entities/login_entity.dart';
import 'package:authentication_app/feature/login/domain/repository/login_repository.dart';
import 'package:authentication_app/feature/login/domain/usecase/user_login.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'controller.g.dart';

@riverpod
class SignIn extends _$SignIn {
  @override
  FutureOr<LoginEntity?> build() {
    return null;
  }

  void signin({required String email, required String password}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      LoginRepositoryImp loginRepositoryImp =
          LoginRepositoryImp(loginRemoteDataSource: LoginRemoteDataSource());
      return LoginUsecase(loginRepositoryImp)
          .userLogin(email: email, password: password);
    });
  }
}
