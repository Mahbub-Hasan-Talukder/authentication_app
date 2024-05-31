import 'package:authentication_app/feature/signup/presentation/widgets/profile_info.dart';
import 'package:authentication_app/feature/signup/repository/signup_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'signup_controller.g.dart';

@riverpod
class SignUpController extends _$SignUpController {
  @override
  FutureOr<bool?> build() {
    return null;
  }

  void signup(ProfileInfo profileInfo) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return SignupRepository.signUp(profileInfo);
    });
  }
}
