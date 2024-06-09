import 'dart:async';

import 'package:authentication_app/feature/home/domain/entities/home_entity.dart';

abstract class HomeRepository{
  FutureOr<(HomeEntity?, String?)>getProfileInfo();
}