import 'package:authentication_app/feature/login/controller/controller.dart';
import 'package:authentication_app/core/service/navigation/routes/routes.dart';
import 'package:authentication_app/core/widgets/action_text.dart';
import 'package:authentication_app/core/widgets/custom_textfields.dart';
import 'package:authentication_app/core/widgets/password_field_provider.dart';
import 'package:authentication_app/core/widgets/subtitle.dart';
import 'package:authentication_app/core/widgets/title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class Signup extends ConsumerWidget {
  Signup({super.key});

  bool isLoading = false;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    dynamic state = ref.watch(signInProvider);
    TextEditingController firstName = TextEditingController();
    TextEditingController lastName = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    return Scaffold(
      appBar: AppBar(
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
                  ),
                ),
              ),
              const SizedBox(height: 40),
              CustomTextField(
                text: 'First Name',
                hintText: 'Enter first name',
                controller: firstName,
              ),
              const SizedBox(height: 40),
              CustomTextField(
                text: 'Last Name',
                hintText: 'Enter last name',
                controller: lastName,
              ),
              const SizedBox(height: 40),
              CustomTextField(
                text: 'Email',
                hintText: 'Enter email',
                controller: email,
              ),
              const SizedBox(height: 40),
              PasswordFieldProvider(
                text: 'Password',
                hintText: 'Enter password',
                controller: password,
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
                onPressed: () {
                },
                child:
                    (state?.runtimeType.toString() == 'AsyncLoading<dynamic>')
                        ? const CircularProgressIndicator(
                            backgroundColor: Colors.white)
                        : const Text(
                            'Create an account',
                            style: TextStyle(color: Color(0xFF797C7B)),
                          ),
              ),
              const SizedBox(height: 10),
              ActionText(
                text: 'Already have an account? Login',
                ontap: () {
                  GoRouter.of(context).pushNamed(Routes.login);
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