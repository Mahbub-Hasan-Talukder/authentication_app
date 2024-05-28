
import 'package:authentication_app/core/service/navigation/routes/routes.dart';
import 'package:authentication_app/core/widgets/action_button.dart';
import 'package:authentication_app/core/widgets/action_text.dart';
import 'package:authentication_app/core/service/api/endpoints.dart';
import 'package:authentication_app/core/widgets/subtitle.dart';
import 'package:authentication_app/core/widgets/title.dart';
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
              ActionButton(
                text: 'submit',
                direction: '',
                onpress: () async {
                  try {
                    Response response = await post(
                      Uri.parse(API.forgetPassword),
                      body: {
                        'email': email.text.toString(),
                      },
                    );
                    String? userEmail = email.text.toString();
                    String previousPage = 'forgotPassword';
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
