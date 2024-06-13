import 'package:authentication_app/core/service/navigation/routes/routes.dart';
import 'package:authentication_app/core/widgets/green_line.dart';
import 'package:authentication_app/core/widgets/password_field_provider.dart';
import 'package:authentication_app/core/widgets/validation.dart';
import 'package:authentication_app/feature/signup/presentation/riverpod/signup_controller.dart';
import 'package:authentication_app/feature/signup/presentation/widgets/profile_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({super.key});
  @override
  ConsumerState<SignUp> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  TextEditingController firstNameCtr = TextEditingController();
  TextEditingController lastNameCtr = TextEditingController();
  TextEditingController emailCtr = TextEditingController();
  TextEditingController passwordCtr = TextEditingController();
  bool emailTextFieldError = false;
  bool passwordTextFieldError = false;

  ({
    bool isFirstNameEnabled,
    bool isLastNameEnabled,
    bool isEmailEnabled,
    bool isPasswordEnabled
  }) enableButtonNotifier = (
    isFirstNameEnabled: false,
    isLastNameEnabled: false,
    isEmailEnabled: false,
    isPasswordEnabled: false,
  );

  @override
  void initState() {
    super.initState();
    firstNameCtr.addListener(() {
      _setStateEnableButton();
    });
    lastNameCtr.addListener(() {
      _setStateEnableButton();
    });
    emailCtr.addListener(() {
      _setStateEnableButton();
    });
    passwordCtr.addListener(() {
      _setStateEnableButton();
    });
  }

  void _setStateEnableButton() {
    setState(() {
      enableButtonNotifier = (
        isFirstNameEnabled: firstNameCtr.text.isNotEmpty,
        isLastNameEnabled: lastNameCtr.text.isNotEmpty,
        isEmailEnabled: emailCtr.text.isNotEmpty,
        isPasswordEnabled: passwordCtr.text.isNotEmpty,
      );
    });
    if (enableButtonNotifier.isEmailEnabled) {
      emailTextFieldError = false;
    }
    if (enableButtonNotifier.isPasswordEnabled) {
      passwordTextFieldError = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(signUpControllerProvider);
    ref.listen(signUpControllerProvider, (_, next) {
      if (next.value?.$1 != null && next.value?.$2 == null) {
        context.pushNamed(
          Routes.emailConfirmation,
          pathParameters: {'email': emailCtr.text, 'previousPage': 'signup'},
        );
      } else if (next.value?.$1 == null && next.value?.$2 != null) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error!'),
              content: Text('${next.value?.$2}'),
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
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            children: [
              const SizedBox(height: 45),
              Stack(
                children: [
                  Text(
                    'SignUp with email',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const GreenLine(right: 80),
                ],
              ),
              const SizedBox(height: 30),
              Text(
                'Get chatting with friends and family today by\n signing up for our chat app!',
                style: Theme.of(context).textTheme.titleSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'First Name',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  TextField(
                    decoration:
                        const InputDecoration(hintText: 'Enter first name'),
                    controller: firstNameCtr,
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Last Name',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  TextField(
                    decoration:
                        const InputDecoration(hintText: 'Enter last name'),
                    controller: lastNameCtr,
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter email',
                      errorText:
                          (emailTextFieldError) ? 'Email must be email' : null,
                    ),
                    controller: emailCtr,
                  ),
                ],
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
                    controller: passwordCtr,
                    hintText: 'Enter password',
                    passwordTextFieldError: passwordTextFieldError,
                  ),
                ],
              ),
              const Spacer(),
              TextButton(
                style: (enableButtonNotifier.isFirstNameEnabled &
                        enableButtonNotifier.isLastNameEnabled &
                        enableButtonNotifier.isEmailEnabled &
                        enableButtonNotifier.isPasswordEnabled)
                    ? const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          Color.fromARGB(255, 97, 145, 122),
                        ),
                        minimumSize: WidgetStatePropertyAll(
                          Size(double.infinity, 50),
                        ),
                      )
                    : null,
                onPressed: (enableButtonNotifier.isFirstNameEnabled &
                        enableButtonNotifier.isLastNameEnabled &
                        enableButtonNotifier.isEmailEnabled &
                        enableButtonNotifier.isPasswordEnabled)
                    ? () {
                        Validation validation = Validation();
                        bool emailValidate =
                            validation.validateEmail(emailCtr.text);
                        bool passwordValidate =
                            validation.validatePassword(passwordCtr.text);
                        if (emailValidate && passwordValidate) {
                          ref.read(signUpControllerProvider.notifier).signUp(
                                ProfileInfo(
                                  firstName: firstNameCtr.text,
                                  lastName: lastNameCtr.text,
                                  email: emailCtr.text,
                                  password: passwordCtr.text,
                                ),
                              );
                        }
                        if (!emailValidate) {
                          setState(() {
                            emailTextFieldError = true;
                          });
                        }
                        if (!passwordValidate) {
                          setState(() {
                            passwordTextFieldError = true;
                          });
                        }
                      }
                    : null,
                child: (state.isLoading)
                    ? const CircularProgressIndicator(
                        backgroundColor: Colors.white)
                    : Text(
                        'Create an account',
                        style: (enableButtonNotifier.isFirstNameEnabled &
                                enableButtonNotifier.isLastNameEnabled &
                                enableButtonNotifier.isEmailEnabled &
                                enableButtonNotifier.isPasswordEnabled)
                            ? TextStyle(
                                color: Theme.of(context).colorScheme.surface,
                              )
                            : TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                      ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                child: Text(
                  'Already have an account? Login',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                onTap: () => GoRouter.of(context).pushNamed(Routes.login),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
