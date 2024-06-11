import 'package:authentication_app/feature/login/domain/entities/login_entity.dart';
import 'package:authentication_app/feature/login/domain/usecase/user_login.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'controller.g.dart';

@riverpod
class SignIn extends _$SignIn {
  @override
  FutureOr<LoginEntity?> build() {
    return null;
  }

  void signin({
    required String email,
    required String password,
    required enableCheckbox,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return await ref.read(loginUsecaseProvider).userLogin(
            email: email,
            password: password,
            enableCheckbox: enableCheckbox,
          );
    });
  }
}
