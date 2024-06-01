import 'package:authentication_app/core/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class DateOfBirthProvier extends StatelessWidget {
  const DateOfBirthProvier({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Date of birth',
              style: TextStyle(
                  color: Color(0xFF24786D), fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 360,
              child: TextField(
                decoration: InputDecoration(
                  suffixIcon: Container(
                    height: 25,
                    width: 25,
                    padding: const EdgeInsets.all(8),
                    child: Image(
                      image: Assets.images.calender.provider(),
                    ),
                  ),
                  labelText: "",
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFC1CAD0),
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                    )
                  ),

                ),
                onTap: () async {
                  DateTime? pickDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
