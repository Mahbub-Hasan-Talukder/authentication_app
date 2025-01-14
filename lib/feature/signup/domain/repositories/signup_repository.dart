import 'package:authentication_app/feature/signup/data/data_source/remote_data_source.dart';
import 'package:authentication_app/feature/signup/data/repository/signup_reopsitory_imp.dart';
import 'package:authentication_app/feature/signup/domain/entities/signup_entities.dart';
import 'package:authentication_app/feature/signup/presentation/widgets/profile_info.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'signup_repository.g.dart';

@riverpod
SignUpRepository signUpRepository(SignUpRepositoryRef ref) {
  final signUpRemoteDataSource = ref.read(signUpRemoteDataSourceProvider);
  return SignUpRepositoryImp(signUpRemoteDataSource);
}

abstract class SignUpRepository {
  FutureOr<(SignUpEntity?, String?)> signUp({
    required ProfileInfo profileInfo,
  });
}
