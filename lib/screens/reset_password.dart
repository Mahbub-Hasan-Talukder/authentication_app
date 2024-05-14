import 'dart:convert';

import 'package:demo_ui/components/action_button.dart';
import 'package:demo_ui/components/password_field_provider.dart';
import 'package:demo_ui/components/subtitle.dart';
import 'package:demo_ui/components/title.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';

class ResetPassword extends StatelessWidget {
  String email;
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  ResetPassword({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.go('/emailConfirmation');
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            children: [
              const SizedBox(height: 145),
              const TitleText(text: 'Reset password'),
              const SizedBox(height: 30),
              const SubTitleText(
                  text:
                      'Please enter a new password. Don’t enter your old password.'),
              const SizedBox(height: 40),
              PasswordFieldProvider(
                text: 'Password',
                hintText: '',
                controller: password,
              ),
              const SizedBox(height: 40),
              PasswordFieldProvider(
                text: 'Confirm Password',
                hintText: '',
                controller: confirmPassword,
              ),
              const Spacer(),
              ActionButton(
                text: 'Reset Password',
                direction: '',
                onpress: () async {
                  if (password.text != confirmPassword.text) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text(
                              'Passwords from two fields are must be same'),
                          content:
                              const Text('Enter same password into the fields'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    try {
                      Response response = await post(
                          Uri.parse(
                              'http://34.72.136.54:4067/api/v1/auth/set-new-password'),
                          body: {
                            "email": email,
                            "password": password.text.toString(),
                            "confirmPassword": confirmPassword.text.toString(),
                          });

                      if (response.statusCode == 201) {
                        // ignore: use_build_context_synchronously
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text(
                                  'Reset password done'),
                              content: const Text(
                                  'Login again'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    context.go('/login');
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                      else{
                        // ignore: use_build_context_synchronously
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title:  Text(
                                  jsonDecode(response.body)["message"],),
                              content: const Text(
                                  'Try again'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    } catch (e) {
                      print(e.toString());
                    }
                  }
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
