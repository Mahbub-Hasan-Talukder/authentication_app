import 'package:authentication_app/feature/signup/data/data_source/remote_data_source.dart';
import 'package:authentication_app/feature/signup/data/model/signup_model.dart';
import 'package:authentication_app/feature/signup/domain/repositories/signup_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class SignUpRepositoryImp implements SignUpRepository {
  SignUpRemoteDataSource signUpRemoteDataSource;

  SignUpRepositoryImp(this.signUpRemoteDataSource);

  @override
  FutureOr<(SignUpModel?, String?)> signUp({
    required profileInfo,
  }) async {
    return await signUpRemoteDataSource.signUp(profileInfo);
  }
}
