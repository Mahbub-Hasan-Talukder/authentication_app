import 'package:authentication_app/feature/forgot_password/domain/entities/forgot_password_entity.dart';
import 'package:authentication_app/feature/forgot_password/domain/use_cases/forgot_password_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'forgot_password_controller.g.dart';

@riverpod
class ForgotPasswordController extends _$ForgotPasswordController {
  @override
  FutureOr<(ForgotPasswordEntity?, String?)> build() {
    return (null, null);
  }

  void forgotPassword({required email}) async {
    state = const AsyncData((null, null));
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return await ref
          .read(forgotPasswordUseCaseProvider)
          .forgotPassword(email: email);
    });
  }
}
