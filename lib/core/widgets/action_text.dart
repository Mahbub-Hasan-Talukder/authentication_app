import 'package:flutter/material.dart';
class ActionText extends StatelessWidget {
  final String text;
  dynamic ontap;

  ActionText({super.key, required this.text, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Text(
        text,
        style: const TextStyle(color: Color(0xFF24786D), fontWeight: FontWeight.w600),
      ),
    );
  }
}
