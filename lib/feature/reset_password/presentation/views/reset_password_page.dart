import 'package:authentication_app/core/service/navigation/routes/routes.dart';
import 'package:authentication_app/core/widgets/green_line.dart';
import 'package:authentication_app/core/widgets/password_field_provider.dart';
import 'package:authentication_app/feature/reset_password/controller/reset_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ResetPassword extends ConsumerStatefulWidget {
  final String email;

  const ResetPassword({super.key, required this.email});

  @override
  ConsumerState<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends ConsumerState<ResetPassword> {
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  ({bool password, bool confirmPassword}) enableButtonNotifier =
      (password: false, confirmPassword: false);

  @override
  void initState() {
    super.initState();
    password.addListener(() {
      _setSateEnableButton();
    });
    confirmPassword.addListener(() {
      _setSateEnableButton();
    });
  }

  void _setSateEnableButton() {
    setState(() {
      enableButtonNotifier = (
        password: password.text.isNotEmpty,
        confirmPassword: confirmPassword.text.isNotEmpty,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(resetPasswordControllerProvider);
    ref.listen(resetPasswordControllerProvider, (_, next) {
      if (next.value ?? false) {
        context.pushNamed(Routes.login);
      } else if (next.hasError && !next.isLoading) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error! Bad request.'),
              content: const Text('Something went wrong'),
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
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: Column(
            children: [
              const Spacer(),
              Stack(
                children: [
                  Text(
                    'Reset password',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const GreenLine(right: 80),
                ],
              ),
              const SizedBox(height: 30),
              Text(
                'Please enter a new password. Don’t enter \nyour old password.',
                style: Theme.of(context).textTheme.titleSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Password',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  PasswordFieldProvider(
                    hintText: '',
                    controller: password,
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Confirm password',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  PasswordFieldProvider(
                    hintText: '',
                    controller: confirmPassword,
                  ),
                ],
              ),
              const Spacer(),
              TextButton(
                style: (enableButtonNotifier.password &
                        enableButtonNotifier.confirmPassword)
                    ? const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          Color.fromARGB(255, 97, 145, 122),
                        ),
                        minimumSize: WidgetStatePropertyAll(
                          Size(double.infinity, 50),
                        ),
                      )
                    : null,
                onPressed: (enableButtonNotifier.password &
                        enableButtonNotifier.confirmPassword)
                    ? () {
                        ref
                            .read(resetPasswordControllerProvider.notifier)
                            .resetPassword(
                              email: widget.email,
                              password: password.text,
                              confirmPassword: confirmPassword.text,
                            );
                      }
                    : null,
                child: (state.isLoading)
                    ? const CircularProgressIndicator(
                        backgroundColor: Colors.white,
                      )
                    : Text(
                        'Submit',
                        style: (enableButtonNotifier.password &
                                enableButtonNotifier.confirmPassword)
                            ? const TextStyle(
                                color: Color.fromARGB(255, 234, 237, 236),
                              )
                            : const TextStyle(
                                color: Color(0xFF797C7B),
                              ),
                      ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
