import 'package:demo_ui/core/notifiers/email_controller.dart';
import 'package:demo_ui/core/notifiers/login_button_controller.dart';
import 'package:demo_ui/core/notifiers/password_controller.dart';
import 'package:demo_ui/core/service/navigation/routes/routes.dart';
import 'package:demo_ui/core/widgets/api_links.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'controller.g.dart';

@riverpod
class Controller extends _$Controller {
  @override
  dynamic build() {}
  dynamic signIn(String email, String pass, BuildContext context) async {
    state = const AsyncLoading();
    state = await post(
      Uri.parse(ApiLinks.login),
      body: {
        'email': email,
        'password': pass,
        'OS': 'IOS',
        'model': 'iPhone 15',
        'FCMToken': 'Token1',
      },
    );

    if (state!.statusCode == 201) {
      GoRouter.of(context).pushNamed(Routes.profile);
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Invalid username/password'),
            content: const Text('Try again.'),
            actions: [
              TextButton(
                onPressed: () {
                  ref.read(loginButtonControllerProvider.notifier).reset();
                  ref.read(emailControllerProvider.notifier).makeFalse();
                  ref.read(passwordControllerProvider.notifier).makeFalse();

                  Navigator.of(context).pop();
                  GoRouter.of(context).pushNamed(Routes.login);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  //signup
  dynamic signUp(
      String firstName, String lastName, String email, String password, BuildContext context) async {
    state = const AsyncLoading();
    state = await post(
      Uri.parse(ApiLinks.signup),
      body: {
        'firstname': firstName,
        'lastname': lastName,
        'email': email,
        'password': password,
      },
    );

    if (state!.statusCode == 201) {
      GoRouter.of(context).pushNamed(Routes.profile);///
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('User already exists'),
            content: const Text('Please login'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  GoRouter.of(context).pushNamed(Routes.login);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
  
}
