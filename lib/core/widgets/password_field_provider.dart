import 'package:flutter/material.dart';

class PasswordFieldProvider extends StatefulWidget {
  final String text, hintText;
  final TextEditingController? controller;
  final dynamic onChanged;

  const PasswordFieldProvider({
    super.key,
    required this.text,
    required this.hintText,
    required this.controller,
    this.onChanged,
  });

  @override
  State<PasswordFieldProvider> createState() => _PasswordFieldProviderState();
}

class _PasswordFieldProviderState extends State<PasswordFieldProvider> {
  bool _obsecureText = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.text,
              style: Theme.of(context).textTheme.displaySmall,
            ),
            SizedBox(
              width: 370,
              child: TextField(
                onChanged: widget.onChanged,
                controller: widget.controller,
                obscureText: _obsecureText,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: _obsecureText
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _obsecureText = !_obsecureText;
                      });
                    },
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  hintText: widget.hintText,
                  hintStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.5),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      width: 0.5,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF24786D),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
