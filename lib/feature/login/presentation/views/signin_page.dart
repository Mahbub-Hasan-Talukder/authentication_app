import 'package:authentication_app/core/gen/assets.gen.dart';
import 'package:authentication_app/feature/login/controller/controller.dart';
import 'package:authentication_app/core/service/navigation/routes/routes.dart';
import 'package:authentication_app/feature/login/presentation/widgets/login_page_logo.dart';
import 'package:authentication_app/core/widgets/password_field_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class Login extends ConsumerStatefulWidget {
  const Login({super.key});

  @override
  ConsumerState<Login> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  ({bool email, bool password}) enableButtonNotifier =
      (email: false, password: false);

  @override
  void initState() {
    super.initState();
    emailController.addListener(() {
      setState(() {
        enableButtonNotifier = (
          email: emailController.value.text.isNotEmpty,
          password: passwordController.value.text.isNotEmpty
        );
      });
    });
    passwordController.addListener(() {
      setState(() {
        enableButtonNotifier = (
          email: emailController.value.text.isNotEmpty,
          password: passwordController.value.text.isNotEmpty
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(signInProvider);
    ref.listen(signInProvider, (_, next) {
      if (next.value ?? false) {
        context.pushNamed(Routes.profile);
      } else if (next.hasError && !next.isLoading) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error! Bad request.'),
              content: const Text('Invalid Email or Password'),
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
              const SizedBox(
                height: 145,
              ),
              Text(
                'Login to Authy',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 37),
              Text(
                'Welcome back! Sign in using your social\n account or email to continue us',
                style: Theme.of(context).textTheme.titleSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const LoginPageLogo(
                      logo: FaIcon(
                    FontAwesomeIcons.facebook,
                    size: 30,
                    color: Colors.blue,
                  )),
                  const SizedBox(width: 22),
                  LoginPageLogo(
                      logo: Image(
                    image: Assets.googleLogo.provider(),
                    height: 25,
                    width: 25,
                  )),
                  const SizedBox(width: 22),
                  const LoginPageLogo(
                      logo: FaIcon(
                    FontAwesomeIcons.apple,
                    size: 30,
                  )),
                  const SizedBox(width: 22),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 1,
                      width: 150,
                      color: const Color(0xFFCDD1D0),
                    ),
                    const Text(
                      'OR',
                      style: TextStyle(color: Color(0xFF797C7B)),
                    ),
                    Container(
                      height: 1,
                      width: 150,
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
                    decoration: const InputDecoration(
                      hintText: 'Enter email',
                    ),
                    controller: emailController,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              PasswordFieldProvider(
                controller: passwordController,
                text: 'Password',
                hintText: 'Enter password',
              ),
              Row(
                children: [
                  Checkbox(value: false, onChanged: (newValue) {}, shape: null),
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
                style: !(enableButtonNotifier.email &
                        enableButtonNotifier.password)
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
                onPressed:
                    (enableButtonNotifier.email & enableButtonNotifier.password)
                        ? () {
                            ref.read(signInProvider.notifier).signin(
                                email: emailController.text.toString(),
                                password: passwordController.text.toString());
                          }
                        : null,
                child: (state.isLoading)
                    ? const CircularProgressIndicator(
                        backgroundColor: Colors.white)
                    : Text(
                        'Login',
                        style: (enableButtonNotifier.email &
                                enableButtonNotifier.password)
                            ? const TextStyle(
                                color: Color.fromARGB(255, 234, 237, 236))
                            : const TextStyle(color: Color(0xFF797C7B)),
                      ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                child: Text(
                  "Don't have any account? Sign up",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                onTap: () => context.pushNamed(Routes.signup),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
