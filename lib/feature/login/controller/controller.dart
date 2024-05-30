import 'package:authentication_app/feature/login/repository/login_repository.dart';
import 'package:http/http.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'controller.g.dart';

@riverpod
class SignIn extends _$SignIn {
  @override
  FutureOr<bool?> build() {
    return null;
  }

  void signin({required String email, required String password}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return LoginRepository.signIn(email, password);
    });
  }
}