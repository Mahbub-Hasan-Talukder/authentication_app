import 'package:demo_ui/components/action_button.dart';
import 'package:demo_ui/components/password_field_provider.dart';
import 'package:demo_ui/components/subtitle.dart';
import 'package:demo_ui/components/title.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

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
               PasswordFieldProvider(text: 'Password', hintText: ''),
              const SizedBox(height: 40),
               PasswordFieldProvider(
                  text: 'Confirm Password', hintText: ''),
              const Spacer(),
              ActionButton(
                text: 'Reset Password',
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
