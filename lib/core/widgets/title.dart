import 'package:demo_ui/core/gen/fonts.gen.dart';
import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String text;
  const TitleText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(

        children: [
          
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              height: 10,
              width: 60,
              color: Theme.of(context).colorScheme.tertiary.withOpacity(0.7),
            ),
          ),
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
