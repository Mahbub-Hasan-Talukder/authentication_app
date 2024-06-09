import 'dart:async';

import 'package:authentication_app/feature/home/domain/entities/logout_entity.dart';

abstract class LogoutRepository {
  FutureOr<(LogoutEntity?, String?)> logout();
}
