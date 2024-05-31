import 'dart:async';
import 'package:authentication_app/core/service/navigation/routes/routes.dart';
import 'package:authentication_app/core/widgets/green_line.dart';
import 'package:authentication_app/feature/email_confirmation/controller/email_confirmation_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class EmailConfirmation extends ConsumerStatefulWidget {
  final String email;
  final String previousPage;

  const EmailConfirmation({
    super.key,
    required this.email,
    required this.previousPage,
  });

  @override
  ConsumerState<EmailConfirmation> createState() => EmailConfirmationState();
}

class EmailConfirmationState extends ConsumerState<EmailConfirmation> {
  Timer? _timer;
  int _countDown = 30;
  bool canResend = false;

  final TextEditingController otpController = TextEditingController();
  bool enableButtonNotifier = false;

  @override
  void initState() {
    super.initState();
    startTimer();
    otpController.addListener(() {
      setState(() {
        enableButtonNotifier = otpController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
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
    final state = ref.watch(emailConfirmationControllerProvider);

    ref.listen(emailConfirmationControllerProvider, (_, next) {
      if (next.value ?? false) {
        if (widget.previousPage == 'signup') {
          context.pushNamed(Routes.login);
        } else {
          context.pushNamed(Routes.resetPassword,
              pathParameters: {'email': widget.email});
        }
      } else if (next.hasError && !next.isLoading) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Wrong OTP'),
              content: const Text('Enter correct otp'),
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
              const SizedBox(height: 145),
              Stack(
                children: [
                  Text(
                    'Email Confirmation',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const GreenLine(right: 80),
                ],
              ),
              const SizedBox(height: 30),
              Text(
                'We’ve sent a code to your email {${widget.email}} address. Please check your inbox',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your code',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextField(controller: otpController),
                ],
              ),
              const Spacer(),
              TextButton(
                style: (enableButtonNotifier)
                    ? const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          Color.fromARGB(255, 97, 145, 122),
                        ),
                      )
                    : null,
                onPressed: (enableButtonNotifier)
                    ? () {
                        ref
                            .read(emailConfirmationControllerProvider.notifier)
                            .emailConfirmation(
                              email: widget.email,
                              code: otpController.text,
                            );
                      }
                    : null,
                child: (state.isLoading)
                    ? const CircularProgressIndicator(
                        backgroundColor: Colors.white,
                      )
                    : Text(
                        'Submit',
                        style: (enableButtonNotifier)
                            ? TextStyle(
                                color: Theme.of(context).colorScheme.surface,
                              )
                            : const TextStyle(color: Color(0xFF797C7B)),
                      ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  canResend
                      ? InkWell(
                          onTap: () async {
                            resendOtp();
                          },
                          child: Text(
                            'Resend email',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      : Text(
                          'Resend email in $_countDown',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
