import 'package:authentication_app/feature/home/data/repositories/home_repository_imp.dart';
import 'package:authentication_app/feature/home/domain/entities/home_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_use_case.g.dart';

@riverpod
HomeUseCase homeUseCase(HomeUseCaseRef ref) {
  final homeRepositoryImp = ref.read(homeRepositoryImpProvider);
  return HomeUseCase(homeRepositoryImp: homeRepositoryImp);
}

class HomeUseCase {
  final HomeRepositoryImp homeRepositoryImp;

  HomeUseCase({required this.homeRepositoryImp});

  FutureOr<(HomeEntity?, String?)> getProfileInfo() async {
    return await homeRepositoryImp.getProfileInfo();
  }
}
