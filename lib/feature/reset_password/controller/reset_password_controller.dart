import 'package:authentication_app/feature/reset_password/repository/reset_password_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'reset_password_controller.g.dart';
@riverpod
class ResetPasswordController extends _$ResetPasswordController {
  @override
  FutureOr<bool?> build() {
    return null;
  }
  void resetPassword({required String password, required String confirmPassword, required String email}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return ResetPasswordRepository.resetPassword(password, confirmPassword, email);
    });
  }
}