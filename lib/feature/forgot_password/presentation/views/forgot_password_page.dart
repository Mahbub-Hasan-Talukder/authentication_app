import 'package:authentication_app/core/service/navigation/routes/routes.dart';
import 'package:authentication_app/core/widgets/action_button.dart';
import 'package:authentication_app/core/widgets/action_text.dart';
import 'package:authentication_app/core/service/api/endpoints.dart';
import 'package:authentication_app/feature/forgot_password/controller/forgot_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';

class ForgotPassword extends ConsumerStatefulWidget {
  ForgotPassword({super.key});

  @override
  ConsumerState<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends ConsumerState<ForgotPassword> {
  TextEditingController email = TextEditingController();
  ({
    bool email,
  }) enableButtonNotifier = (email: false);

  @override
  void initState() {
    super.initState();
    email.addListener(() {
      setState(() {
        enableButtonNotifier = (email: email.value.text.isNotEmpty,);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(forgotPasswordControllerProvider);
    ref.listen(forgotPasswordControllerProvider, (_, next) {
      if (next.value ?? false) {
        context.pushNamed(
          Routes.emailConfirmation,
          pathParameters: {
            'email': email.text,
            'previousPage': 'forgotPassword'
          },
        );
      }
    });
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            children: [
              const SizedBox(height: 145),
              Text(
                'Forgot Password',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 30),
              Text(
                textAlign: TextAlign.center,
                'Enter your email address. We will send a code \n to verify your identity',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Email',
                    style: TextStyle(
                        color: Color(0xFF24786D), fontWeight: FontWeight.w600),
                  ),
                  TextField(
                    controller: email,
                  )
                ],
              ),
              const Spacer(),
              TextButton(
                style: !(enableButtonNotifier.email)
                    ? const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          Color(0xFFF3F6F6),
                        ),
                        minimumSize: WidgetStatePropertyAll(
                          Size(double.infinity, 50),
                        ),
                      )
                    : const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          Color.fromARGB(255, 97, 145, 122),
                        ),
                        minimumSize: WidgetStatePropertyAll(
                          Size(double.infinity, 50),
                        ),
                      ),
                onPressed: (enableButtonNotifier.email)
                    ? () {
                        ref
                            .read(forgotPasswordControllerProvider.notifier)
                            .forgotPassword(
                              email: email.text.toString(),
                            );
                      }
                    : null,
                child: (state.isLoading)
                    ? const CircularProgressIndicator(
                        backgroundColor: Colors.white)
                    : Text(
                        'Login',
                        style: (enableButtonNotifier.email)
                            ? const TextStyle(
                                color: Color.fromARGB(255, 234, 237, 236))
                            : const TextStyle(color: Color(0xFF797C7B)),
                      ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                child: Text(
                  "Remember your password? Login",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                onTap: () => GoRouter.of(context).pushNamed(Routes.login),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
