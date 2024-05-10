import 'package:flutter/material.dart';

class PasswordFieldProvider extends StatelessWidget {
  final String text, hintText;
  const PasswordFieldProvider(
      {super.key, required this.text, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: const TextStyle(
                  color: Color(0xFF24786D), fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 360,
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  suffixIcon: const Icon(
                    Icons.visibility,
                    color: Color(0xFFC1CAD0),
                  ),
                  hintText: hintText,
                  hintStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFC1CAD0),
                  ),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFC1CAD0),
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
