import 'package:demo_ui/components/action_button.dart';
import 'package:demo_ui/components/action_text.dart';
import 'package:demo_ui/components/custom_textfields.dart';
import 'package:demo_ui/components/password_field_provider.dart';
import 'package:demo_ui/components/subtitle.dart';
import 'package:demo_ui/components/title.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            children: [
              const SizedBox(height: 100),
              const TitleText(text: 'Signup with email'),
              const SizedBox(height: 30),
              const Center(
                  child: SizedBox(
                      width: double.infinity,
                      child: Center(
                        child: SubTitleText(
                            text:
                                'Get chatting with friends and family today by signing up for our chat app!'),
                      ))),
              const SizedBox(height: 40),
              const CustomTextField(text: 'Name', hintText: 'Enter name'),
              const SizedBox(height: 40),
              const CustomTextField(text: 'Email', hintText: 'Enter email'),
              const SizedBox(height: 40),
              const PasswordFieldProvider(
                  text: 'Password', hintText: 'Enter password'),
              const SizedBox(height: 40),
              const PasswordFieldProvider(
                text: 'Password',
                hintText: 'Enter password',
              ),
              const Spacer(),
              ActionButton(
                text: 'Create an account',
                direction: '/profile',
              ),
              const SizedBox(height: 10),
              ActionText(
                text: 'Already have an account? Login',
                direction: '/login',
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
