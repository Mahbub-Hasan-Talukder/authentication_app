import 'package:authentication_app/feature/reset_password/domain/entities/reset_password_entity.dart';
import 'package:authentication_app/feature/reset_password/domain/use_cases/reset_password_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'reset_password_controller.g.dart';

@riverpod
class ResetPassController extends _$ResetPassController {
  @override
  FutureOr<(ResetPassEntity?, String?)> build() {
    return (null, null);
  }

  void resetPass({
    required email,
    required password,
    required confirmPassword,
  }) async {
    state = const AsyncData((null, null));
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return await ref.read(resetPassUseCaseProvider).resetPass(
            email: email,
            password: password,
            confirmPassword: confirmPassword,
          );
    });
  }
}
