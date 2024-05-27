import 'package:demo_ui/core/notifiers/email_controller.dart';
import 'package:demo_ui/core/notifiers/password_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'login_button_controller.g.dart';
@riverpod
class LoginButtonController extends _$LoginButtonController{
  @override
  bool build(){
    return false;
  }
  void update(){
    bool emailProvider = ref.watch(emailControllerProvider);
    bool passwordProvider = ref.watch(passwordControllerProvider);
    state = (emailProvider & passwordProvider);
  }
  void reset(){
    state = false;
  }
}