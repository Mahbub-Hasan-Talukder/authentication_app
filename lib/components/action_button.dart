import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ActionButton extends StatelessWidget {
  
  final String text;
  String? direction;
  
  ActionButton({super.key, required this.text, this.direction});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        if(direction?.isNotEmpty==true){
          context.go(direction!);
        }
      },
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
