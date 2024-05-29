import 'package:authentication_app/feature/home/presentation/widgets/converter.dart';
import 'package:authentication_app/feature/home/repository/home_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'home_controller.g.dart';
@riverpod
class HomeController extends _$HomeController {
  @override
  FutureOr<Converter?> build() {
    return null;
  }
  FutureOr<Converter?> getInfo(String? token) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return HomeRepository.getInfo(token);
    });
    return null;
  }
}
