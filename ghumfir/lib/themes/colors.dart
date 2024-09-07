import 'package:flutter/material.dart';

class AppColors {
  // Blue swatch
  static const MaterialColor blueSwatch = MaterialColor(
    0xFF1976D2, // 500
    <int, Color>{
      50: Color(0xFFE6EDF7),
      100: Color(0xFFBBDEFB),
      200: Color(0xFF8AACD9),
      300: Color(0xFF64B5F6),
      400: Color(0xFF42A5F5),
      500: Color(0xFF004AAD),
      600: Color(0xFF1E88E5),
      700: Color(0xFF1565C0),
      800: Color(0xFF0D47A1),
      900: Color(0xFF063977),
    },
  );

  // Red swatch
  static const MaterialColor redSwatch = MaterialColor(
    0xFFF44336, // 500
    <int, Color>{
      50: Color(0xFFFFEBEE),
      100: Color(0xFFFFCDD2),
      200: Color(0xFFEF9A9A),
      300: Color(0xFFE57373),
      400: Color(0xFFEF5350),
      500: Color(0xFFFD2100),
      600: Color(0xFFE53935),
      700: Color(0xFFD32F2F),
      800: Color(0xFFC62828),
      900: Color(0xFFFD2100),
    },
  );

  // Brown swatch (grey scale)
  static const MaterialColor brownSwatch = MaterialColor(
    0xFF000000, // 500
    <int, Color>{
      50: Color(0xFFE8E8E8),
      100: Color(0xFFF5F5F5),
      200: Color(0xFFEEEEEE),
      300: Color(0xFF686362),
      400: Color(0xFFBDBDBD),
      500: Color(0xFF1D1615),
      600: Color(0xFF757575),
      700: Color(0xFF616161),
      800: Color(0xFF424242),
      900: Color(0xFF212121),
    },
  );

  // White swatch (grey scale)
  static const MaterialColor whiteSwatch = MaterialColor(
    0xFFFFFFFF, // 500
    <int, Color>{
      50: Color(0xFFE8E8E8),
      100: Color(0xFFF5F5F5),
      200: Color(0xFFEEEEEE),
      300: Color(0xFF686362),
      400: Color(0xFFBDBDBD),
      500: Color(0xFFF8F8FF),
      600: Color(0xFF757575),
      700: Color(0xFF616161),
      800: Color(0xFF424242),
      900: Color(0xFFFFFFFF),
    },
  );

  // Convenience color getters
  static Color get blue => blueSwatch.shade900;
  static Color get red => redSwatch.shade500;
  static Color get black => brownSwatch.shade500;
  static Color get white => whiteSwatch.shade900;
}
