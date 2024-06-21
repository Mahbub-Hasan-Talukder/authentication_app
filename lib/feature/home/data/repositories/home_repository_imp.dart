import 'package:authentication_app/feature/home/data/data_source/home_remote_data_source.dart';
import 'package:authentication_app/feature/home/data/models/home_model.dart';
import 'package:authentication_app/feature/home/data/models/logout_model.dart';
import 'package:authentication_app/feature/home/domain/repositories/home_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeRepositoryImp implements HomeRepository {
  HomeRemoteDataSource homeRemoteDataSource;

  HomeRepositoryImp(this.homeRemoteDataSource);

  @override
  FutureOr<(HomeModel?, String?)> getProfileInfo() async {
    return await HomeRemoteDataSource.getProfileInfo();
  }

  @override
  FutureOr<(LogoutModel?, String?)> logout() async {
    (LogoutModel?, String?) signOutRepositoryImp =
        await HomeRemoteDataSource.signOut();

    if (signOutRepositoryImp.$1 != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool enableCheckBox = prefs.getString('enableCheckBox') != null;
      if (!enableCheckBox) {
        prefs.clear();
      }
      prefs.remove('enableCheckBox');
      prefs.remove('token');
    }
    return signOutRepositoryImp;
  }
}
