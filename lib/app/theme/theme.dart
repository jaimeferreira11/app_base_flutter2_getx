import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

ThemeData buildThemeData() {
  final ThemeData theme = ThemeData();

  return ThemeData(
    colorScheme: theme.colorScheme.copyWith(secondary: AppColors.accentColor),
    primaryColor: AppColors.primaryColor,
    primarySwatch: AppColors.inputColor,
    textTheme: GoogleFonts.robotoTextTheme().copyWith(
      //  headline6: TextStyle(color: Colors.white), // @deprecated se usa titleLarge
      titleLarge: TextStyle(color: Colors.white), // card header text
    ),
    inputDecorationTheme: InputDecorationTheme(
        focusColor: AppColors.inputColor,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0), borderSide: const BorderSide(color: AppColors.inputColor)),
        labelStyle: const TextStyle(color: Colors.black87)),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        // primary: AppColors.inputColor, @deprecated se usa foregroundColor
        foregroundColor: AppColors.inputColor,
      ),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
