import 'package:authentication_app/core/gen/fonts.gen.dart';
import 'package:flutter/material.dart';

ThemeData theme = ThemeData(
  useMaterial3: true,
  colorScheme: const ColorScheme.light(
    primary: Color(0xFF24786D),
    secondary: Color.fromARGB(255, 121, 121, 124),
    surface: Colors.white,
    tertiary: Color.fromARGB(255, 81, 81, 81),
  ),
  inputDecorationTheme: const InputDecorationTheme(
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
        color: Color.fromARGB(255, 36, 112, 102),
      ),
    ),
    errorStyle: TextStyle(color: Color(0xFFFF2D1B)),
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
  textTheme: const TextTheme(
    displaySmall: TextStyle(
      color: Color(0xFF24786D),
      fontWeight: FontWeight.w500,
      fontFamily: FontFamily.circularStdBook,
      fontSize: 14,
    ),
    titleMedium: TextStyle(
      color: Color(0xFF000E08),
      fontWeight: FontWeight.w600,
      fontFamily: FontFamily.caros,
      fontSize: 18,
    ),
    titleSmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontFamily: FontFamily.circularStdBook,
      color: Color(0xFF797C7B),
    ),
  ),
);
