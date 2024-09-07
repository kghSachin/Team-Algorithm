import 'package:flutter/material.dart';
import 'colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
        useMaterial3: true,
        primarySwatch: AppColors.blueSwatch,
        scaffoldBackgroundColor: AppColors.white,
        appBarTheme: AppBarTheme(
          color: AppColors.blueSwatch.shade500,
          iconTheme: IconThemeData(color: AppColors.white),
        ),
        colorScheme: ColorScheme.light(
          primary: AppColors.blueSwatch.shade500,
          secondary: AppColors.blueSwatch.shade700,
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: AppColors.blueSwatch.shade500,
          textTheme: ButtonTextTheme.primary,
        ),
        //outline button theme
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            side: WidgetStateProperty.all(
              BorderSide(
                color: AppColors.brownSwatch.shade50,
                width: 2,
              ),
            ),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
        //Text form field theme
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(
              color: AppColors.brownSwatch.shade300,
              fontSize: 14,
              fontWeight: FontWeight.w400),
          labelStyle:
              const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.brownSwatch.shade50),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.blueSwatch.shade500),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.brownSwatch.shade50),
          ),
        ),
        // TODO: Add the text theme here
        textTheme: const TextTheme(
          displayLarge: TextStyle(),
          displayMedium: TextStyle(),
          displaySmall: TextStyle(),
          bodyLarge: TextStyle(),
          bodyMedium: TextStyle(),
          bodySmall: TextStyle(),
          labelLarge: TextStyle(),
          labelMedium: TextStyle(),
          labelSmall: TextStyle(),
        ));
  }
}