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
        style: Theme.of(context).textTheme.displaySmall,
      ),
    );
  }
}
