import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  
  final String text, hintText;
  TextEditingController? controller;
  
   CustomTextField({super.key, required this.text, required this.hintText, this.controller});

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
                controller: controller,
                decoration: InputDecoration(
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
            )
          ],
        ),
      ],
    );
  }
}
