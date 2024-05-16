
import 'dart:convert';

import 'package:demo_ui/core/gen/assets.gen.dart';
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
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';


class Login extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Login({super.key});

  @override
  Widget build(BuildContext context) {
    
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
              ),
              const SizedBox(height: 20),
              PasswordFieldProvider(
                  controller: passwordController,
                  text: 'Password',
                  hintText: 'Enter password'),
              Row(
                children: [
                  Checkbox(value: false, onChanged: (newValue) {}, shape: null),
                  ActionText(text: 'Remember me',ontap: (){},),
                  const Spacer(),
                  ActionText(
                    text: 'Forgot password',
                    ontap: (){
                      GoRouter.of(context).pushNamed(Routes.forgetPassword);
                    },
                  )
                ],
              ),
              const Spacer(),
              ActionButton(
                text: 'Login',
                direction: '',
                onpress: () async {
                  try {
                    Response response = await post(
                      Uri.parse(ApiLinks.login),
                      body: {
                        'email': emailController.text,
                        'password': passwordController.text,
                        'OS': 'IOS',
                        'model': 'iPhone 15',
                        'FCMToken': 'Token1',
                      },
                    );
                    print(response.statusCode);
                    if (response.statusCode == 201 || response.statusCode==200) {
                      GoRouter.of(context).pushNamed(Routes.profile);
                    } else {
                      // ignore: use_build_context_synchronously
                      showDialog(context: context, builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text(
                                  'Wrong email or password'),
                              content:  Text(
                                  jsonDecode(response.body)['message']),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    // context.go('/login');
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            );
                          },);
                    }
                  } catch (e) {
                    print(e.toString());
                  }
                },
              ),
              const SizedBox(height: 10),
              ActionText(
                text: "Don't have any account? Sign up",
                ontap: (){
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
