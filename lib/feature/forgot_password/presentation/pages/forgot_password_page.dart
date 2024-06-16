import 'package:authentication_app/core/service/navigation/routes/routes.dart';
import 'package:authentication_app/core/widgets/green_line.dart';
import 'package:authentication_app/core/widgets/validation.dart';
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
  TextEditingController emailCtr = TextEditingController();
  bool enableButtonNotifier = false;
  bool emailTextFieldError = false;

  @override
  void initState() {
    super.initState();
    emailCtr.addListener(() {
      setState(() {
        enableButtonNotifier = emailCtr.text.isNotEmpty;
        if (enableButtonNotifier) {
          emailTextFieldError = false;
        }
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
            'email': emailCtr.text,
            'previousPage': 'forgotPassword',
          },
        );
      } else if (next.value?.$2 != null) {
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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
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
              const SizedBox(height: 15),
              Text(
                textAlign: TextAlign.center,
                'Enter your email address. We will send a code \n to verify your identity',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 70),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email',
                    style: emailTextFieldError
                        ? const TextStyle(color: Colors.red)
                        : Theme.of(context).textTheme.displaySmall,
                  ),
                  TextField(
                    controller: emailCtr,
                    decoration: InputDecoration(
                      errorText:
                          (emailTextFieldError) ? 'Email must be email' : null,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              TextButton(
                style: (enableButtonNotifier)
                    ? const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          Color(0xFF24786D),
                        ),
                        minimumSize: WidgetStatePropertyAll(
                          Size(double.infinity, 50),
                        ),
                      )
                    : null,
                onPressed: (enableButtonNotifier)
                    ? () {
                        Validation validation = Validation();
                        bool emailValidate =
                            validation.validateEmail(emailCtr.text);
                        if (emailValidate) {
                          ref
                              .read(forgotPasswordControllerProvider.notifier)
                              .forgotPassword(
                                email: emailCtr.text.toString(),
                              );
                        }
                        if (!emailValidate) {
                          setState(() {
                            emailTextFieldError = true;
                          });
                        }
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
              const SizedBox(height: 15),
              GestureDetector(
                child: Text(
                  "Remember your password? Login",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                onTap: () => GoRouter.of(context).pushNamed(Routes.login),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
