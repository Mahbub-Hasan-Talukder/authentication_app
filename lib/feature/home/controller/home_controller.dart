import 'package:authentication_app/feature/home/presentation/widgets/home_model_state.dart';
import 'package:authentication_app/feature/home/repository/home_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_controller.g.dart';

@riverpod
class HomeController extends _$HomeController {
  @override
  FutureOr<HomeModelState?> build() {
    return null;
  }

  FutureOr<HomeModelState?> getInfo() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return HomeRepository.getInfo();
    });
    return null;
  }
}
