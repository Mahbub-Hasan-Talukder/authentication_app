import 'package:flutter/material.dart';

ThemeData theme = ThemeData(
  useMaterial3: true,

  colorScheme: ColorScheme.light(
    primary: const Color(0xFF24786D),
    secondary: const Color(0xFF797C7B),
    surface: Colors.white,
    tertiary:Color.fromARGB(255, 81, 81, 81) ,
  ),

  inputDecorationTheme:const InputDecorationTheme(
    hintStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Color(0xFFC1CAD0),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xFFC1CAD0),
      ),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xFF24786D),
      ),
    ),
  ),
  textButtonTheme: const TextButtonThemeData(
    style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(
           Color(0xFFF3F6F6),
        ),
        minimumSize: WidgetStatePropertyAll(
          Size(double.infinity, 50),
        ),
      ),
  ),
  textTheme: TextTheme(
    labelMedium: TextStyle(
      color: Colors.red,
    )
  )
  
);
