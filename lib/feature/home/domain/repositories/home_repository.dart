import 'dart:async';
import 'package:authentication_app/feature/home/data/data_source/home_remote_data_source.dart';
import 'package:authentication_app/feature/home/data/repositories/home_repository_imp.dart';
import 'package:authentication_app/feature/home/domain/entities/home_entity.dart';
import 'package:authentication_app/feature/home/domain/entities/logout_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_repository.g.dart';

@riverpod
HomeRepository homeRepository(HomeRepositoryRef ref) {
  final homeRemoteDataSource = ref.read(homeRemoteDataSourceProvider);
  return HomeRepositoryImp(homeRemoteDataSource);
}

abstract class HomeRepository {
  FutureOr<(HomeEntity?, String?)> getProfileInfo();

  FutureOr<(LogoutEntity?, String?)> logout();
}