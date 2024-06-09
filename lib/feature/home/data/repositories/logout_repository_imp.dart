import 'package:authentication_app/feature/home/data/data_source/logout_remote_data_source.dart';
import 'package:authentication_app/feature/home/data/models/logout_model.dart';
import 'package:authentication_app/feature/home/domain/repositories/logout_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'logout_repository_imp.g.dart';

@riverpod
LogoutRepositoryImp logoutRepositoryImp(Ref ref) {
  return LogoutRepositoryImp(LogoutRemoteDataSource());
}

class LogoutRepositoryImp implements LogoutRepository {
  LogoutRemoteDataSource logoutRemoteDataSource;

  LogoutRepositoryImp(this.logoutRemoteDataSource);

  @override
  FutureOr<(LogoutModel?, String?)> logout() async {
    return await LogoutRemoteDataSource.signOut();
  }
}
