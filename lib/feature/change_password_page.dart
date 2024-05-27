
import 'package:authentication_app/core/widgets/action_button.dart';
import 'package:authentication_app/core/widgets/password_field_provider.dart';
import 'package:authentication_app/core/widgets/subtitle.dart';
import 'package:authentication_app/core/widgets/title.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
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
