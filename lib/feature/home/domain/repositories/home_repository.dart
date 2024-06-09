import 'dart:async';

import 'package:authentication_app/feature/home/domain/entities/home_entity.dart';
import 'package:authentication_app/feature/home/domain/entities/logout_entity.dart';

abstract class HomeRepository {
  FutureOr<(HomeEntity?, String?)> getProfileInfo();

  FutureOr<(LogoutEntity?, String?)> logout();
}
