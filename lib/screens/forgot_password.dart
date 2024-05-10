import 'package:demo_ui/components/action_button.dart';
import 'package:demo_ui/components/action_text.dart';
import 'package:demo_ui/components/custom_textfields.dart';
import 'package:demo_ui/components/subtitle.dart';
import 'package:demo_ui/components/title.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.go('/login');
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

              const TitleText(text: 'ForgotPassword'),

              const SizedBox(height: 30),

              const SubTitleText(
                  text:
                      'Enter your email address. We will send a code to verify your identity'),

              const SizedBox(height: 40),

              const CustomTextField(text: 'Email', hintText: ''),

              const Spacer(),

              ActionButton(
                text: 'Submit',
                direction: '/emailConfirmation',
              ),

              const SizedBox(height: 10),

             ActionText(text: "Remember your password? Login", direction: '/login',)

            ],
          ),
        ),
      ),
    );
  }
}
