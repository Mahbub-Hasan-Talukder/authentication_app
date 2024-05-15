import 'package:flutter/material.dart';

class CustomOnpressButton extends StatelessWidget {
  
  final String text;
  String? direction;
  dynamic onpress;
  
  CustomOnpressButton({super.key, required this.text, this.direction, this.onpress});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onpress,
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(
          Color(0xFFF3F6F6),
        ),
        minimumSize: MaterialStatePropertyAll(
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
