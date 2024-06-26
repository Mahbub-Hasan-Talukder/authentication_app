import 'package:authentication_app/feature/forgot_password/data/data_source/remote_data_source.dart';
import 'package:authentication_app/feature/forgot_password/data/repositories/forgot_password_repository_imp.dart';
import 'package:authentication_app/feature/forgot_password/domain/entities/forgot_password_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'forgot_password_repository.g.dart';

@riverpod
ForgotPasswordRepository forgotPasswordRepository(
    ForgotPasswordRepositoryRef ref) {
  final forgotPasswordRemoteDataSource =
      ref.read(forgotPasswordRemoteDataSourceProvider);
  return ForgotPasswordRepositoryImp(forgotPasswordRemoteDataSource);
}

abstract class ForgotPasswordRepository {
  FutureOr<(ForgotPasswordEntity?, String?)> forgotPassword({
    required String email,
  });
}
