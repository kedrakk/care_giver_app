import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color primary = Color(0xFF00BCD4);
  static const Color secondary = Color(0xFFFFC107);
  static const Color tertiary = Color(0xFF9C27B0);
  static const Color quaternary = Color(0xFFF44336);
  static const Color quinary = Color(0xFF2196F3);
  static const Color senary = Color(0xFF009688);
  static const Color septenary = Color(0xFFE91E63);
  static const Color octonary = Color(0xFFF5F5F5);
  static const Color nonary = Color(0xFF9B9B9B);
  static const Color denary = Color(0xFF000000);

  static ThemeData lightTheme = ThemeData(
    primaryColor: primary,
    scaffoldBackgroundColor: octonary,
    cardColor: nonary,
    textTheme: const TextTheme(
      headline6: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: denary,
      ),
      bodyText1: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: denary,
      ),
      bodyText2: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: denary,
      ),
    ),
  );
}
