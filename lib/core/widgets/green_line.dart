import 'package:flutter/material.dart';

class GreenLine extends StatelessWidget {
  final double left;
  final double right;
  final double bottom;
  final double height;

  const GreenLine({
    Key? key,
    this.left = 0,
    required this.right,
    this.bottom = 0,
    this.height = 9,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      right: right,
      bottom: bottom,
      child: Container(
        height: height,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
