import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'email_controller.g.dart';
@riverpod
class EmailController extends _$EmailController{
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