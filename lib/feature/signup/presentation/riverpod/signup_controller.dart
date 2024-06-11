import 'package:authentication_app/feature/signup/domain/entities/signup_entity.dart';
import 'package:authentication_app/feature/signup/domain/use_cases/signup_use_case.dart';
import 'package:authentication_app/feature/signup/presentation/widgets/profile_info.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'signup_controller.g.dart';

@riverpod
class SignUpController extends _$SignUpController {
  @override
  FutureOr<(SignUpEntity?, String?)> build() {
    return (null, null);
  }

  void signUp(ProfileInfo profileInfo) async {
    state = const AsyncData((null,null));
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return await ref.read(signUpUseCaseProvider).signUp(profileInfo: profileInfo);
    });
  }
}
