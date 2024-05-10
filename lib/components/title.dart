import 'package:demo_ui/gen/fonts.gen.dart';
import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String text;
  const TitleText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            text,
            style: const TextStyle(
                fontWeight: FontWeight.w600, fontSize: 18, fontFamily: FontFamily.caros),
          ),
        ],
      ),
    );
  }
}
