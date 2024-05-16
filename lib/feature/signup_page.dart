import 'package:demo_ui/core/service/navigation/routes/routes.dart';
import 'package:demo_ui/core/widgets/action_button.dart';
import 'package:demo_ui/core/widgets/action_text.dart';
import 'package:demo_ui/core/widgets/api_links.dart';
import 'package:demo_ui/core/widgets/custom_textfields.dart';
import 'package:demo_ui/core/widgets/password_field_provider.dart';
import 'package:demo_ui/core/widgets/subtitle.dart';
import 'package:demo_ui/core/widgets/title.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController firstName = TextEditingController();
    TextEditingController lastName = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    return Scaffold(
      appBar: AppBar(
          // leading: const Icon(Icons.arrow_back),
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
              ActionButton(
                text: 'Create an account',
                direction: '',
                onpress: () async {
                  try {
                    Response response = await post(
                      Uri.parse(ApiLinks.signup),
                      body: {
                        'firstname': firstName.text.toString(),
                        'lastname': lastName.text.toString(),
                        'email': email.text.toString(),
                        'password': password.text.toString(),
                      },
                    );

                    if (response.statusCode == 201) {
                      // ignore: use_build_context_synchronously
                      String? userEmail = email.text.toString();
                      String previousPage = 'signup';
                      // ignore: use_build_context_synchronously
                      // context.go('/emailConfirmation/$userEmail/$previousPage');
                      GoRouter.of(context)
                          .pushNamed(Routes.emailConfirmation, pathParameters: {
                        'email': userEmail,
                        'previousPage': previousPage,
                      });
                    } else {
                      // ignore: use_build_context_synchronously
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title:
                                const Text('User already exist. Please Login'),
                            content:
                                const Text('Failed to create new account.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  GoRouter.of(context).pushNamed(Routes.login);
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  } catch (e) {
                    print(e.toString());
                  }
                },
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
// moshi.bs23@gmail.com
// password123