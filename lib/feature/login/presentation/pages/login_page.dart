import 'package:authentication_app/core/gen/assets.gen.dart';
import 'package:authentication_app/core/theme/theme.dart';
import 'package:authentication_app/core/widgets/green_line.dart';
import 'package:authentication_app/core/service/navigation/routes/routes.dart';
import 'package:authentication_app/core/widgets/password_field_provider.dart';
import 'package:authentication_app/feature/home/presentation/pages/home_page.dart';
import 'package:authentication_app/feature/login/domain/entities/login_entity.dart';
import 'package:authentication_app/feature/login/presentation/riverpod/controller.dart';
import 'package:authentication_app/feature/login/presentation/widgets/login_page_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends ConsumerStatefulWidget {
  const Login({super.key});

  @override
  ConsumerState<Login> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool emailTextFieldError = false;
  bool passwordTextFieldError = false;
  bool enableCheckbox = false;

  ({bool email, bool password}) enableButtonNotifier = (
    email: false,
    password: false,
  );

  @override
  void initState() {
    super.initState();
    emailController.addListener(() {
      _setEnableButtonState();
    });
    passwordController.addListener(() {
      setState(() {
        _setEnableButtonState();
      });
    });
  }

  void _setEnableButtonState() {
    setState(() {
      enableButtonNotifier = (
        email: emailController.value.text.isNotEmpty,
        password: passwordController.value.text.isNotEmpty,
      );
    });
    if (enableButtonNotifier.email) {
      setState(() {
        emailTextFieldError = false;
      });
    }
    if (enableButtonNotifier.password) {
      passwordTextFieldError = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(signInProvider);

    ref.listen(signInProvider, (_, next) async {
      if (next.value != null) {
        context.go('/${Routes.home}');
      } else if (next.hasError && !next.isLoading) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error! Bad request.'),
              content: Text(next.error.toString()),
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

    return loginPage(context, state);
  }

  Scaffold loginPage(BuildContext context, AsyncValue<LoginEntity?> state) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: Column(
            children: [
              const SizedBox(
                height: 45,
              ),
              Stack(
                children: [
                  Text(
                    'Log in to Authy',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const GreenLine(right: 80),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                'Welcome back! Sign in using your social\n account or email to continue us',
                style: Theme.of(context).textTheme.titleSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const LoginPageLogo(
                    logo: FaIcon(
                      FontAwesomeIcons.facebook,
                      size: 30,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(width: 22),
                  LoginPageLogo(
                    logo: Image(
                      image: Assets.images.googleLogo.provider(),
                      height: 25,
                      width: 25,
                    ),
                  ),
                  const SizedBox(width: 22),
                  const LoginPageLogo(
                    logo: FaIcon(
                      FontAwesomeIcons.apple,
                      size: 30,
                    ),
                  ),
                  const SizedBox(width: 22),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 1,
                      width: 135,
                      color: const Color(0xFFCDD1D0),
                    ),
                    const Text(
                      'OR',
                      style: TextStyle(color: Color(0xFF797C7B)),
                    ),
                    Container(
                      height: 1,
                      width: 135,
                      color: const Color(0xFFCDD1D0),
                    ),
                  ],
                ),
              ),
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
                    controller: emailController,
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Password',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  PasswordFieldProvider(
                    passwordTextFieldError: passwordTextFieldError,
                    hintText: 'Enter password',
                    controller: passwordController,
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 10,
                    width: 10,
                    child: Checkbox(
                      value: enableCheckbox,
                      onChanged: (newValue) {
                        setState(() {
                          enableCheckbox = newValue!;
                        });
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      fillColor: (enableCheckbox!)
                          ? WidgetStatePropertyAll(
                              Theme.of(context).colorScheme.primary,
                            )
                          : WidgetStatePropertyAll(
                              Theme.of(context)
                                  .colorScheme
                                  .secondary
                                  .withOpacity(0.5),
                            ),
                      side: (enableCheckbox!)
                          ? BorderSide(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.1),
                              width: 2,
                            )
                          : BorderSide(
                              color: Theme.of(context).colorScheme.primary,
                              width: 2,
                            ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Remember me',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  const Spacer(),
                  GestureDetector(
                    child: Text(
                      'Forgot password',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    onTap: () => context.pushNamed(Routes.forgetPassword),
                  ),
                ],
              ),
              const Spacer(),
              TextButton(
                style:
                    (enableButtonNotifier.email & enableButtonNotifier.password)
                        ? const ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              Color.fromARGB(255, 97, 145, 122),
                            ),
                            minimumSize: WidgetStatePropertyAll(
                              Size(double.infinity, 50),
                            ),
                          )
                        : null,
                onPressed: (enableButtonNotifier.email &&
                        enableButtonNotifier.password)
                    ? () {
                        bool emailValidate =
                            _validateEmail(emailController.text);
                        bool passwordValidate =
                            _validatePassword(passwordController.text);
                        if (emailValidate && passwordValidate) {
                          ref.read(signInProvider.notifier).signin(
                                email: emailController.text.toString(),
                                password: passwordController.text.toString(),
                                enableCheckbox: enableCheckbox,
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
                        backgroundColor: Colors.white,
                      )
                    : Text(
                        'Login',
                        style: (enableButtonNotifier.email &
                                enableButtonNotifier.password)
                            ? const TextStyle(
                                color: Color.fromARGB(255, 234, 237, 236))
                            : null,
                      ),
              ),
              const SizedBox(height: 15),
              GestureDetector(
                child: Text(
                  "Don't have any account? Sign up",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                onTap: () => context.pushNamed(Routes.signup),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  bool _validate() {
    String email = emailController.text;
    String password = passwordController.text;
    // bool res = _validateEmail(email) & _validatePassword(password);
    if (!_validateEmail(email)) {
      return false;
    }
    return true;
  }

  bool _validateEmail(String value) {
    final emailRegEx = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegEx.hasMatch(value)) {
      return false;
    }
    return true;
  }

  bool _validatePassword(String password) {
    if (password.length < 6) return false;
    return true;
  }
}
