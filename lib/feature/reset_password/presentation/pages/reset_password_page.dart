import 'package:authentication_app/core/widgets/green_line.dart';
import 'package:authentication_app/core/widgets/password_field_provider.dart';
import 'package:authentication_app/core/widgets/validation.dart';
import 'package:authentication_app/feature/reset_password/presentation/riverpod/reset_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ResetPass extends ConsumerStatefulWidget {
  final String email;

  const ResetPass({super.key, required this.email});

  @override
  ConsumerState<ResetPass> createState() => _ResetPassState();
}

class _ResetPassState extends ConsumerState<ResetPass> {
  TextEditingController passwordCtr = TextEditingController();
  TextEditingController confirmPasswordCtr = TextEditingController();
  bool confirmPassFieldError = false;
  bool passwordFieldError = false;

  ({bool isPassEnabled, bool isConfirmPassEnabled}) enableButtonNotifier =
      (isPassEnabled: false, isConfirmPassEnabled: false);

  @override
  void initState() {
    super.initState();
    passwordCtr.addListener(() {
      _setSateEnableButton();
    });
    confirmPasswordCtr.addListener(() {
      _setSateEnableButton();
    });
  }

  void _setSateEnableButton() {
    setState(() {
      enableButtonNotifier = (
        isPassEnabled: passwordCtr.text.isNotEmpty,
        isConfirmPassEnabled: confirmPasswordCtr.text.isNotEmpty,
      );
    });
    if (enableButtonNotifier.isPassEnabled) {
      passwordFieldError = false;
    }
    if (enableButtonNotifier.isConfirmPassEnabled) {
      confirmPassFieldError = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(resetPassControllerProvider);
    ref.listen(resetPassControllerProvider, (_, next) {
      if (next.value?.$1 != null) {
        context.go('/');
      } else if (next.value?.$2 != null) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error!'),
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
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: Column(
            children: [
              const SizedBox(height: 45),
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
                    passwordTextFieldError: passwordFieldError,
                    hintText: '',
                    controller: passwordCtr,
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
                    passwordTextFieldError: confirmPassFieldError,
                    hintText: '',
                    controller: confirmPasswordCtr,
                  ),
                ],
              ),
              const Spacer(),
              TextButton(
                style: (enableButtonNotifier.isPassEnabled &
                        enableButtonNotifier.isConfirmPassEnabled)
                    ? const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          Color.fromARGB(255, 97, 145, 122),
                        ),
                        minimumSize: WidgetStatePropertyAll(
                          Size(double.infinity, 50),
                        ),
                      )
                    : null,
                onPressed: (enableButtonNotifier.isPassEnabled &
                        enableButtonNotifier.isConfirmPassEnabled)
                    ? () {
                        Validation validation = Validation();
                        bool confirmPasswordValidate =
                            validation.validatePassword(passwordCtr.text);
                        bool passwordValidate = validation
                            .validatePassword(confirmPasswordCtr.text);
                        if (confirmPasswordValidate && passwordValidate) {
                          ref
                              .read(resetPassControllerProvider.notifier)
                              .resetPass(
                                email: widget.email,
                                password: passwordCtr.text,
                                confirmPassword: confirmPasswordCtr.text,
                              );
                        }
                        if (!confirmPasswordValidate) {
                          setState(() {
                            passwordFieldError = true;
                          });
                        }
                        if (!passwordValidate) {
                          setState(() {
                            confirmPassFieldError = true;
                          });
                        }
                      }
                    : null,
                child: (state.isLoading)
                    ? const CircularProgressIndicator(
                        backgroundColor: Colors.white,
                      )
                    : Text(
                        'Reset Password',
                        style: (enableButtonNotifier.isPassEnabled &
                                enableButtonNotifier.isConfirmPassEnabled)
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
