import 'dart:async';
import 'dart:convert';

import 'package:demo_ui/components/action_button.dart';
import 'package:demo_ui/components/custom_textfields.dart';
import 'package:demo_ui/components/subtitle.dart';
import 'package:demo_ui/components/title.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';

class EmailConfirmation extends StatefulWidget {
  final String email;
  final String previousPage;

  const EmailConfirmation(
      {super.key, required this.email, required this.previousPage});

  @override
  State<EmailConfirmation> createState() => EmailConfirmationState();
}

class EmailConfirmationState extends State<EmailConfirmation> {
  Timer? _timer;

  int _countDown = 30;
  bool canResend = false;

  final TextEditingController OTP = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer!.cancel();
  }

  void startTimer() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        setState(() {
          if (_countDown > 0) {
            _countDown--;
          } else {
            canResend = true;
            _timer?.cancel();
          }
        });
      },
    );
  }

  void resendOtp() {
    if (canResend == true) {
      setState(() {
        _countDown = 30;
        canResend = false;
      });
      startTimer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.go('/forgotPassword'); //--
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            children: [
              const SizedBox(
                height: 145
              ),
              const TitleText(
                text: 'Email Confirmation',
              ),
              const SizedBox(height: 30),
              SubTitleText(
                text:
                    'We’ve sent a code to your email {${widget.email}} address. Please check your inbox',
              ),
              const SizedBox(height: 40),
              CustomTextField(
                text: 'Your code',
                hintText: '',
                controller: OTP,
              ),
              const Spacer(),
              ActionButton(
                text: 'Submit',
                direction: '',
                onpress: () async {
                  try {
                    Response response = await post(
                      Uri.parse(
                          'http://34.72.136.54:4067/api/v1/auth/verifyOtp'),
                      body: {
                        'email': widget.email,
                        'otp': OTP.text.toString(),
                      },
                    );
                    print(response.statusCode);
                    if (response.statusCode == 201 ||
                        response.statusCode == 200) {
                      // ignore: use_build_context_synchronously
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          if (widget.previousPage == 'signup') {
                            return AlertDialog(
                              title: Text(jsonDecode(response.body)["message"]),
                              content: const Text(
                                  'User account created successfully'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    context.go('/login');
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            );
                          }
                          return AlertDialog(
                            title: Text(jsonDecode(response.body)["message"]),
                            content: const Text('OTP verified'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  context.go('/resetPassword/${widget.email}');
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      // ignore: use_build_context_synchronously
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text((response.body)),
                            content: const Text('Enter valid code'),
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
                  } catch (e) {
                    print(e.toString());
                  }
                },
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Text('Resend Email in ${_countDown.toString()}'),
                  canResend
                      ? InkWell(
                          onTap: () async {
                            print("resend clicked");
                            resendOtp();

                            try {
                              Response response = await post(
                                Uri.parse(
                                    'http://34.72.136.54:4067/api/v1/auth/resend-otp'),
                                body: {
                                  'email': widget.email,
                                },
                              );

                              // ignore: use_build_context_synchronously
                              context.go(
                                  '/emailConfirmation/${widget.email}/${widget.previousPage}');
                            } catch (e) {
                              print(e.toString());
                            }
                          },
                          child: Text(
                            'Resend email',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.tertiary,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      : Text(
                          'Resend email in $_countDown',
                          style:  TextStyle(color: Theme.of(context).colorScheme.primary),
                        ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
