import 'package:authentication_app/core/service/navigation/routes/routes.dart';
import 'package:authentication_app/core/widgets/green_line.dart';
import 'package:authentication_app/feature/forgot_password/presentation/riverpod/forgot_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ForgotPassword extends ConsumerStatefulWidget {
  const ForgotPassword({super.key});

  @override
  ConsumerState<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends ConsumerState<ForgotPassword> {
  TextEditingController email = TextEditingController();
  bool enableButtonNotifier = false;

  @override
  void initState() {
    super.initState();
    email.addListener(() {
      setState(() {
        enableButtonNotifier = email.text.isNotEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(forgotPasswordControllerProvider);

    ref.listen(forgotPasswordControllerProvider, (_, next) {
      if (next.value?.$1 != null) {
        context.pushNamed(
          Routes.emailConfirmation,
          pathParameters: {
            'email': email.text,
            'previousPage': 'forgotPassword',
          },
        );
      }else if (next.value?.$2 != null) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error! Bad request.'),
              content: Text(next.value!.$2.toString()),
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
    });
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            children: [
              const SizedBox(height: 45),
              Stack(
                children: [
                  Text(
                    'Forgot Password',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const GreenLine(right: 90),
                ],
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
                      color: Color(0xFF24786D),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextField(controller: email),
                ],
              ),
              const Spacer(),
              TextButton(
                style: (enableButtonNotifier)
                    ? const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          Color.fromARGB(255, 97, 145, 122),
                        ),
                        minimumSize: WidgetStatePropertyAll(
                          Size(double.infinity, 50),
                        ),
                      )
                    : null,
                onPressed: (enableButtonNotifier)
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
                        backgroundColor: Colors.white,
                      )
                    : Text(
                        'Submit',
                        style: (enableButtonNotifier)
                            ? const TextStyle(
                                color: Color.fromARGB(255, 234, 237, 236),
                              )
                            : null,
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
