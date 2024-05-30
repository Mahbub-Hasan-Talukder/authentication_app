import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  static Color color = const Color(0xFFF3F6F6);
  final String text;
  String? direction;
  dynamic onpress;
  ActionButton({super.key, required this.text, this.direction, this.onpress});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onpress,
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(
          color
        ),
        minimumSize: const WidgetStatePropertyAll(
          Size(double.infinity, 50),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Color(0xFF797C7B)),
      ),
    );
  }
}
