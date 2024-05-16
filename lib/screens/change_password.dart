import 'package:demo_ui/components/action_button.dart';
import 'package:demo_ui/components/password_field_provider.dart';
import 'package:demo_ui/components/subtitle.dart';
import 'package:demo_ui/components/title.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

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
              const SizedBox(height: 145),
              const TitleText(text: 'Change password'),
              const SizedBox(height: 30),
              const SubTitleText(
                text: 'Make sure to enter a strong password to ensure your security.',
              ),
              const SizedBox(height: 40),
               PasswordFieldProvider(
                  text: 'Old Password', hintText: 'Enter password'),
              const SizedBox(height: 40),
               PasswordFieldProvider(
                  text: 'New passwrod', hintText: 'New password'),
              const SizedBox(height: 40),
               PasswordFieldProvider(
                  text: 'Confirm password', hintText: 'Confirm password'),
              const Spacer(),
              ActionButton(text: 'Change Password', direction: '/profile'),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
