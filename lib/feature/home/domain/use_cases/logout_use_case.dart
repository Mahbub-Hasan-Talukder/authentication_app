import 'package:authentication_app/feature/home/data/repositories/logout_repository_imp.dart';
import 'package:authentication_app/feature/home/domain/entities/logout_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'logout_use_case.g.dart';

@riverpod
LogoutUseCase logoutUseCase(LogoutUseCaseRef ref) {
  final logoutRepositoryImp = ref.read(logoutRepositoryImpProvider);
  return LogoutUseCase(logoutRepositoryImp: logoutRepositoryImp);
}

class LogoutUseCase {
  final LogoutRepositoryImp logoutRepositoryImp;

  LogoutUseCase({required this.logoutRepositoryImp});

  FutureOr<(LogoutEntity?, String?)> logout() async {
    return await logoutRepositoryImp.logout();
  }
}
