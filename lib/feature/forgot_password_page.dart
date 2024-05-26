
import 'package:demo_ui/core/service/navigation/routes/routes.dart';
import 'package:demo_ui/core/widgets/action_button.dart';
import 'package:demo_ui/core/widgets/action_text.dart';
import 'package:demo_ui/core/widgets/api_links.dart';
import 'package:demo_ui/core/widgets/custom_textfields.dart';
import 'package:demo_ui/core/widgets/subtitle.dart';
import 'package:demo_ui/core/widgets/title.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            children: [
              const SizedBox(height: 145),
              const TitleText(text: 'ForgotPassword'),
              const SizedBox(height: 30),
              const SubTitleText(
                  text:
                      ' your email address. We will send a code to verify your identity'),
              const SizedBox(height: 40),
              CustomTextField(
                text: 'Email',
                hintText: '',
                controller: email,
              ),
              const Spacer(),
              ActionButton(
                text: 'submit',
                direction: '',
                onpress: () async {
                  try {
                    Response response = await post(
                      Uri.parse(ApiLinks.forgetPassword),
                      body: {
                        'email': email.text.toString(),
                      },
                    );
                    String? userEmail = email.text.toString();
                    String previousPage = 'forgotPassword';
                    // ignore: use_build_context_synchronously
                    GoRouter.of(context).pushNamed(Routes.emailConfirmation, pathParameters: {
                      'email':userEmail,
                      'previousPage':previousPage,
                  });
                    
                  } catch (e) {
                    print(e.toString());
                  }
                },
              ),
              const SizedBox(height: 10),
              ActionText(
                text: "Remember your password? Login",
                ontap: (){
                  GoRouter.of(context).pushNamed(Routes.login);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
