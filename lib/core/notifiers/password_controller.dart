import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'password_controller.g.dart';
@riverpod
class PasswordController extends _$PasswordController{
  @override
  bool build(){
    return false;
  }
  void makeTrue(){
    state = true;
  }
  void makeFalse(){
    state = false;
  }
}