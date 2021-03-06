import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData buildThemeData() {
  final ThemeData theme = ThemeData();

  return ThemeData(
    colorScheme: theme.colorScheme.copyWith(secondary: AppColors.accentColor),
    primaryColor: AppColors.primaryColor,
    primarySwatch: AppColors.inputColor,
    textTheme: const TextTheme(
      headline6: TextStyle(color: Colors.white), // card header text
    ),
    inputDecorationTheme: InputDecorationTheme(
        focusColor: AppColors.inputColor,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: const BorderSide(color: AppColors.inputColor)),
        labelStyle: const TextStyle(color: Colors.black87)),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: AppColors.inputColor,
      ),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
