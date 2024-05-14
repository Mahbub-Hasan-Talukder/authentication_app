import 'dart:convert';

import 'package:demo_ui/components/action_button.dart';
import 'package:demo_ui/components/action_text.dart';
import 'package:demo_ui/components/custom_textfields.dart';
import 'package:demo_ui/components/subtitle.dart';
import 'package:demo_ui/components/title.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';

class EmailConfirmation extends StatelessWidget {
  final String email;
  EmailConfirmation({super.key, required this.email});
  final TextEditingController OTP = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.go('/forgotPassword');//--
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            children: [
              const SizedBox(
                height: 145,
              ),
              const TitleText(
                text: 'Email Confirmation',
              ),
              const SizedBox(height: 30),
              SubTitleText(
                text:
                    'We’ve sent a code to your email {$email} address. Please check your inbox',
              ),
              const SizedBox(height: 40),
               CustomTextField(
                text: 'Your code',
                hintText: '',
                controller: OTP,
              ),
              const Spacer(),
              ActionButton(
                text: 'Submit',
                direction: '',
                onpress: () async {
                  try {
                    Response response = await post(
                      Uri.parse('http://34.72.136.54:4067/api/v1/auth/verifyOtp'),
                      body: {
                        'email': email,
                        'otp': OTP.text.toString(),
                      },
                    );
                    print(response.statusCode);
                    if (response.statusCode == 201 || response.statusCode==200) {
                      // ignore: use_build_context_synchronously
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(jsonDecode(response.body)["message"]),
                            content: const Text('User account created successfully'),
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
                    } else {
                      // ignore: use_build_context_synchronously
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text((response.body)),
                            content: const Text('Enter valid code'),
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
                },
              ),
              const SizedBox(height: 10),
              ActionText(
                text: 'Resend Email',
                direction: '/emailConfirmation',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
