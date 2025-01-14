import 'dart:async';

import 'package:authentication_app/core/service/navigation/routes/routes.dart';
import 'package:authentication_app/core/widgets/green_line.dart';
import 'package:authentication_app/feature/email_confirmation/presentation/riverpod/email_confirmation_controller.dart';
import 'package:authentication_app/feature/email_confirmation/presentation/riverpod/otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  bool enableButtonNotifier = false;

  final TextEditingController otpController = TextEditingController();

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
      ref.read(otpControllerProvider.notifier).resendEmail(widget.email);
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
      if (next.value?.$1 != null) {
        if (widget.previousPage == 'signup') {
          context.pushNamed(Routes.login);
        } else {
          context.pushNamed(Routes.resetPassword,
              pathParameters: {'email': widget.email});
        }
      } else if (next.value?.$2 != null) {
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
    ref.listen(otpControllerProvider, (_, next) {
      if (next.value?.$1 != null) {
        _showDialog(context, '${next.value?.$1?.message.toString()}');
      } else if (next.value?.$2 != null) {
        _showDialog(context, '${next.value?.$2?.toString()}');
      }
    });

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Column(
              children: [
                const SizedBox(height: 45),
                Stack(
                  children: [
                    Text(
                      'Email Confirmation',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const GreenLine(right: 110),
                  ],
                ),
                const SizedBox(height: 15),
                Center(
                  child: Text(
                    'We’ve sent a code to your email address. \nPlease check your inbox',
                    style: Theme.of(context).textTheme.titleSmall,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 70),
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
                    TextField(
                      controller: otpController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(6),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 350),
                TextButton(
                  style: (enableButtonNotifier)
                      ? const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                            Color(0xFF24786D),
                          ),
                        )
                      : null,
                  onPressed: (enableButtonNotifier)
                      ? () {
                          ref
                              .read(
                                  emailConfirmationControllerProvider.notifier)
                              .emailConfirmation(
                                email: widget.email,
                                otp: otpController.text,
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
                const SizedBox(height: 15),
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
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showDialog(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        content: Text(message),
        duration: const Duration(
          seconds: 2,
        ),
      ),
    );
  }
}
