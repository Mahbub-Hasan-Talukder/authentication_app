import 'package:authentication_app/feature/home/domain/entities/home_entity.dart';
import 'package:authentication_app/feature/home/domain/entities/logout_entity.dart';
import 'package:authentication_app/feature/home/domain/repositories/home_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_use_case.g.dart';

@riverpod
HomeUseCase homeUseCase(HomeUseCaseRef ref) {
  final homeRepository = ref.read(homeRepositoryProvider);
  return HomeUseCase(homeRepository: homeRepository);
}

class HomeUseCase {
  final HomeRepository homeRepository;

  HomeUseCase({required this.homeRepository});

  FutureOr<(HomeEntity?, String?)> getProfileInfo() async {
    return await homeRepository.getProfileInfo();
  }

  FutureOr<(LogoutEntity?, String?)> logout() async {
    return await homeRepository.logout();
  }
}
