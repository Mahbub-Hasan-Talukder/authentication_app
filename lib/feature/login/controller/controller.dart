import 'package:authentication_app/core/notifiers/email_controller.dart';
import 'package:authentication_app/core/notifiers/login_button_controller.dart';
import 'package:authentication_app/core/notifiers/password_controller.dart';
import 'package:authentication_app/core/service/navigation/routes/routes.dart';
import 'package:authentication_app/core/widgets/api_links.dart';
import 'package:http/http.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'controller.g.dart';

@riverpod
class SignIn extends _$SignIn {
  @override
  FutureOr<bool?> build() {
    return null;
  }
  void signin({required String email, required String password})async{
    state = const AsyncLoading();
    state = await AsyncValue.guard(()async{
      final response = await post(
        Uri.parse('http://34.72.136.54:4067/api/v1/auth/login'),
        body: {
          'email': email,
          'password': password,
          'OS': 'IOS',
          'model': 'iPhone 15',
          'FCMToken': 'Token1',
        },
      );
      if(response.statusCode!=201){
        throw Exception('Something went wrong');
      }else{
        return true;
      }

    });
  }
}