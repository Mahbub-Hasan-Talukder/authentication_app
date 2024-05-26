import 'dart:convert';

import 'package:demo_ui/core/gen/assets.gen.dart';
import 'package:demo_ui/core/notifiers/controller.dart';
import 'package:demo_ui/core/notifiers/email_controller.dart';
import 'package:demo_ui/core/notifiers/login_button_controller.dart';
import 'package:demo_ui/core/notifiers/password_controller.dart';
import 'package:demo_ui/core/service/navigation/routes/routes.dart';
import 'package:demo_ui/core/widgets/action_button.dart';
import 'package:demo_ui/core/widgets/action_text.dart';
import 'package:demo_ui/core/widgets/api_links.dart';
import 'package:demo_ui/core/widgets/custom_textfields.dart';
import 'package:demo_ui/core/widgets/login_page_logo.dart';
import 'package:demo_ui/core/widgets/password_field_provider.dart';
import 'package:demo_ui/core/widgets/subtitle.dart';
import 'package:demo_ui/core/widgets/title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';

class Login extends ConsumerWidget {
  Login({super.key});
  bool isLoading = false;
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    dynamic state = ref.watch(controllerProvider);
    bool loginButtonState = ref.watch(loginButtonControllerProvider);
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            children: [
              const SizedBox(
                height: 145,
              ),
              const TitleText(text: 'Login to Authy'),
              const SizedBox(height: 37),
              const SubTitleText(
                text:
                    'Welcome back! Sign in using your social\n account or email to continue us',
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const LoginPageLogo(
                      logo: FaIcon(
                    FontAwesomeIcons.facebook,
                    size: 30,
                    color: Colors.blue,
                  )),
                  const SizedBox(width: 22),
                  LoginPageLogo(
                      logo: Image(
                    image: Assets.googleLogo.provider(),
                    height: 25,
                    width: 25,
                  )),
                  const SizedBox(width: 22),
                  const LoginPageLogo(
                      logo: FaIcon(
                    FontAwesomeIcons.apple,
                    size: 30,
                  )),
                  const SizedBox(width: 22),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 1,
                      width: 150,
                      color: const Color(0xFFCDD1D0),
                    ),
                    const Text(
                      'OR',
                      style: TextStyle(color: Color(0xFF797C7B)),
                    ),
                    Container(
                      height: 1,
                      width: 150,
                      color: const Color(0xFFCDD1D0),
                    ),
                  ],
                ),
              ),
              CustomTextField(
                text: 'Email',
                hintText: 'Enter email',
                controller: emailController,
                // onChanged: () {
                //   ref.read(emailControllerProvider.notifier).update();
                // },
              ),
              const SizedBox(height: 20),
              PasswordFieldProvider(
                controller: passwordController,
                text: 'Password',
                hintText: 'Enter password',
                // onChanged: (){
                //   ref.read(passwordControllerProvider.notifier).update();
                // },
              ),
              Row(
                children: [
                  Checkbox(value: false, onChanged: (newValue) {}, shape: null),
                  ActionText(
                    text: 'Remember me',
                    ontap: () {},
                  ),
                  const Spacer(),
                  ActionText(
                    text: 'Forgot password',
                    ontap: () {
                      GoRouter.of(context).pushNamed(Routes.forgetPassword);
                    },
                  )
                ],
              ),
              const Spacer(),
              TextButton(
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    Color(0xFFF3F6F6),
                  ),
                  minimumSize: WidgetStatePropertyAll(
                    Size(double.infinity, 50),
                  ),
                ),
                onPressed: loginButtonState
                    ? () {
                        ref.read(controllerProvider.notifier).signIn(
                            emailController.text.toString(),
                            passwordController.text.toString(),
                            context);
                      }
                    : null,
                child:
                    (state?.runtimeType.toString() == 'AsyncLoading<dynamic>')
                        ? const CircularProgressIndicator(
                            backgroundColor: Colors.white)
                        : Text(
                            'Login',
                            style: const TextStyle(color: Color(0xFF797C7B)),
                          ),
              ),
              const SizedBox(height: 10),
              ActionText(
                text: "Don't have any account? Sign up",
                ontap: () {
                  GoRouter.of(context).pushNamed(Routes.signup);
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
// moshi.bs23@gmail.com
// password123