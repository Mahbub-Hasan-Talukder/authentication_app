import 'package:demo_ui/components/action_button.dart';
import 'package:demo_ui/components/action_text.dart';
import 'package:demo_ui/components/custom_textfields.dart';
import 'package:demo_ui/components/subtitle.dart';
import 'package:demo_ui/components/title.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EmailConfirmation extends StatelessWidget {
  const EmailConfirmation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.go('/forgotPassword');
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
              const TitleText(text: 'Email Confirmation'),
              const SizedBox(height: 30),
              const SubTitleText(
                  text:
                      'We’ve sent a code to your email address. Please check your inbox'),
              const SizedBox(height: 40),
              const CustomTextField(text: 'Your code', hintText: ''),
              const Spacer(),
              ActionButton(
                text: 'Submit',
                direction: '/resetPassword',
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
