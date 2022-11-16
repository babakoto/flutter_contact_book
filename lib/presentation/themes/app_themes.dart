import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xff10b981);

  /// Texts & Titles
  /// Icons
  /// Backgrounds
  static MaterialColor greyscale = const MaterialColor(500, {
    50: Color(0xffF9FAFB),
    100: Color(0xffF3F4F6),
    200: Color(0xffE5E7EB),
    300: Color(0xffD1D5DB),
    400: Color(0xff9CA3AF),
    500: Color(0xff6B7280),
    600: Color(0xff4B5563),
    700: Color(0xff374151),
    800: Color(0xff1F2937),
    900: Color(0xff111827),
  });

  static final _outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: const BorderSide(
      color: Colors.transparent,
    ),
  );
  static ThemeData themes = ThemeData(
    textTheme: const TextTheme(
        headline5: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
    inputDecorationTheme: InputDecorationTheme(
      disabledBorder: _outlineInputBorder,
      enabledBorder: _outlineInputBorder,
      focusedBorder: _outlineInputBorder,
      filled: true,
      fillColor: greyscale.shade100,
    ),
  );
}
