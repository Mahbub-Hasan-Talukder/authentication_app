import 'package:authentication_app/feature/reset_password/data/data_source/remote_data_source.dart';
import 'package:authentication_app/feature/reset_password/data/repositories/reset_password_repository_imp.dart';
import 'package:authentication_app/feature/reset_password/domain/entities/reset_password_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'reset_password_repository.g.dart';

@riverpod
ResetPassRepository resetPassRepository(ResetPassRepositoryRef ref) {
  final resetPassRemoteDataSource = ref.read(resetPassRemoteDataSourceProvider);
  return ResetPassRepositoryImp(resetPassRemoteDataSource);
}

abstract class ResetPassRepository {
  FutureOr<(ResetPassEntity?, String?)> resetPass({
    required email,
    required password,
    required confirmPassword,
  });
}
