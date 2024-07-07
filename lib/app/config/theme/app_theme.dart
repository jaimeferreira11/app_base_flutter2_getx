import 'package:flutter/material.dart';

import '../../theme/colors.dart';
import 'app_text_styles.dart';

class AppTheme {
  final ThemeData theme = ThemeData();
  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        colorScheme:
            theme.colorScheme.copyWith(secondary: AppColors.accentColor),
        primaryColor: AppColors.primaryColor,
        primarySwatch: AppColors.inputColor,
        appBarTheme: const AppBarTheme(
            centerTitle: true, titleTextStyle: TextStyle(fontSize: 16)),
        scaffoldBackgroundColor: Colors.grey.shade100,
        inputDecorationTheme: InputDecorationTheme(
            focusColor: AppColors.inputColor,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: const BorderSide(color: AppColors.inputColor)),
            labelStyle: const TextStyle(color: Colors.black87)),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            // primary: AppColors.inputColor, @deprecated se usa foregroundColor
            foregroundColor: AppColors.inputColor,
          ),
        ),
        buttonTheme: ButtonThemeData(
            buttonColor: Colors.blueAccent,
            colorScheme:
                ColorScheme.fromSeed(seedColor: AppColors.accentColor)),
        filledButtonTheme: FilledButtonThemeData(
            style:
                FilledButton.styleFrom(backgroundColor: AppColors.accentColor)),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          titleLarge: AppTextStyles.titleLarge,
          titleMedium: AppTextStyles.titleMedium,
          titleSmall: AppTextStyles.titleSmall,
          bodyLarge: AppTextStyles.bodyLarge,
          bodyMedium: AppTextStyles.bodyMedium,
          bodySmall: AppTextStyles.bodySmall,
          labelSmall: AppTextStyles.labelSmall,

          // por defecto
          displayLarge: ThemeData.light().textTheme.displayLarge,
          displayMedium: ThemeData.light().textTheme.displayMedium,
          displaySmall: ThemeData.light().textTheme.displaySmall,
          headlineMedium: ThemeData.light().textTheme.headlineMedium,
          headlineSmall: ThemeData.light().textTheme.headlineSmall,
          labelLarge: ThemeData.light().textTheme.labelLarge,
        ),
      );
}
