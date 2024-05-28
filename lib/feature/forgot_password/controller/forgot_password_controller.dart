import 'package:authentication_app/feature/forgot_password/repository/forgot_password_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'forgot_password_controller.g.dart';
@riverpod
class ForgotPasswordController extends _$ForgotPasswordController {
  @override
  FutureOr<bool?> build() {
    return null;
  }
  void forgotPassword({required String email}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return ForgotPasswordRepository.forgotPassword(email);
    });
  }
}