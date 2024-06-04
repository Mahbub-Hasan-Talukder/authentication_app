import 'package:authentication_app/feature/login/data/datasources/local_data_source.dart';
import 'package:authentication_app/feature/login/domain/entities/login_entity.dart';
import 'package:authentication_app/feature/login/domain/entities/sub_entities.dart';

class LoginModel extends LoginEntity {
  LoginModel({
    required super.message,
    required super.token,
    required super.user,
  }) {
    LoginLocalDataSource(key: 'token', value: token).setCacheData();
  }

  static LoginModel fromJson(Map<String, dynamic> json) {
    final String message = json['message'];
    final String token = json['token'];
    final String firstName = json['user']['firstname'];
    final String lastName = json['user']['lastname'];
    final String email = json['user']['email'];

    User user = User(
      firstName: firstName,
      lastName: lastName,
      email: email,
    );

    return LoginModel(
      message: message,
      token: token,
      user: user,
    );
  }
}
