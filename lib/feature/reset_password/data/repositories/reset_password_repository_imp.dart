import 'package:authentication_app/feature/reset_password/data/data_source/remote_data_source.dart';
import 'package:authentication_app/feature/reset_password/data/models/reset_password_model.dart';
import 'package:authentication_app/feature/reset_password/domain/repositories/reset_password_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class ResetPassRepositoryImp implements ResetPassRepository {
  ResetPassRemoteDataSource resetPassRemoteDataSource;

  ResetPassRepositoryImp(this.resetPassRemoteDataSource);

  @override
  FutureOr<(ResetPassModel?, String?)> resetPass({
    required email,
    required password,
    required confirmPassword,
  }) async {
    return await ResetPassRemoteDataSource.resetPass(
      email: email,
      password: password,
      confirmPassword: confirmPassword,
    );
  }
}
