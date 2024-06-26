import 'package:authentication_app/feature/forgot_password/data/data_source/remote_data_source.dart';
import 'package:authentication_app/feature/forgot_password/data/model/forgot_password_model.dart';
import 'package:authentication_app/feature/forgot_password/domain/repositories/forgot_password_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class ForgotPasswordRepositoryImp implements ForgotPasswordRepository {
  ForgotPasswordRemoteDataSource forgotPasswordRemoteDataSource;

  ForgotPasswordRepositoryImp(this.forgotPasswordRemoteDataSource);

  @override
  FutureOr<(ForgotPasswordModel?, String?)> forgotPassword({
    required String email,
  }) async {
    return await ForgotPasswordRemoteDataSource.forgotPassword(email: email);
  }
}
