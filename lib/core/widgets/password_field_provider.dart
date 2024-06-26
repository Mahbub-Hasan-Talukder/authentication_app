import 'package:flutter/material.dart';

class PasswordFieldProvider extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool passwordTextFieldError;
  final ValueChanged<String>? onChanged;
  const PasswordFieldProvider({
    super.key,
    required this.controller,
    required this.hintText,
    required this.passwordTextFieldError,
    this.onChanged,
  });

  @override
  PasswordFieldProviderState createState() => PasswordFieldProviderState();
}

class PasswordFieldProviderState extends State<PasswordFieldProvider> {
  bool _isSecurePassword = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      obscureText: _isSecurePassword,
      decoration: InputDecoration(
        errorText: (widget.passwordTextFieldError)
            ? 'Password length must be  greater than 6'
            : null,
        hintText: widget.hintText,
        suffixIcon: IconButton(
          color: Theme.of(context).colorScheme.secondary.withOpacity(0.6),
          onPressed: () {
            setState(() {
              _isSecurePassword = !_isSecurePassword;
            });
          },
          icon: _isSecurePassword
              ? const Icon(Icons.visibility)
              : const Icon(Icons.visibility_off),
        ),
      ),
    );
  }
}
