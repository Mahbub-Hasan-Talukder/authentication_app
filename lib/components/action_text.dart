import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
class ActionText extends StatelessWidget {
  final String text;
  String? direction;

  ActionText({super.key, required this.text, this.direction});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text(
        text,
        style: const TextStyle(color: Color(0xFF24786D), fontWeight: FontWeight.w600),
      ),
      onTap: () {
        if (direction?.isNotEmpty == true) {
          context.go(direction!);
        }
      },
    );
  }
}
