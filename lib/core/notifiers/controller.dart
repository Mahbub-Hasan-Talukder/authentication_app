import 'package:demo_ui/core/service/navigation/routes/routes.dart';
import 'package:demo_ui/core/widgets/api_links.dart';
import 'package:demo_ui/feature/signin_page.dart';
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

    if (state!.statusCode == 201)
      GoRouter.of(context!).pushNamed(Routes.profile);
    else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Invalid username/password'),
            content: const Text('Try again.'),
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

  //signout
}
