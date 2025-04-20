import 'package:flutter/material.dart';
import 'package:infinialabs_ai/theme/app_colors.dart';

final lightThemeData = ThemeData(
  primaryColor: AppColors.sThemePColor,
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: const ContinuousRectangleBorder(),
      backgroundColor: AppColors.sThemePColor,
      disabledBackgroundColor: const Color(0xffdedee3),
      disabledForegroundColor: Colors.grey.shade400,
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: AppColors.sThemePColor,
      disabledBackgroundColor: const Color(0xffdedee3),
      disabledForegroundColor: Colors.grey.shade400,
    ),
  ),
  buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary),
  appBarTheme: const AppBarTheme(
    titleSpacing: 0,
    // backgroundColor: sThemeBgAppBar,
    shadowColor: Colors.grey,
    surfaceTintColor: AppColors.colorWhite,
    elevation: 1,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    contentPadding: EdgeInsets.all(12),
    helperMaxLines: 2,
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: AppColors.sThemePColor, width: 2),
    ),

    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: AppColors.color7d4bff),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: AppColors.color7d4bff),
    ),
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 24,
      color: AppColors.color1A1A1A,
      fontWeight: FontWeight.w600,
    ),
    displayMedium: TextStyle(
      fontSize: 20,
      color: AppColors.color1A1A1A,
      fontWeight: FontWeight.w600,
    ),
    headlineMedium: TextStyle(
      fontSize: 24,
      color: Colors.black87,
      fontWeight: FontWeight.w300,
    ),
    headlineSmall: TextStyle(
      fontSize: 22,
      color: Color(0xFF0A0E1A),
      fontWeight: FontWeight.w400,
    ),
    displaySmall: TextStyle(
      fontSize: 14,
      color: AppColors.color1A1A1A,
      fontWeight: FontWeight.w600,
    ),
    titleLarge: TextStyle(
      fontSize: 18,
      color: AppColors.color1A1A1A,
      fontWeight: FontWeight.w500,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      color: AppColors.color1A1A1A,
      height: 1.5,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      color: AppColors.color1A1A1A,
      height: 1.5,
    ),
    titleMedium: TextStyle(
      fontSize: 14,
      color: AppColors.color1A1A1A,
      height: 1.5,
    ),
    titleSmall: TextStyle(
      fontSize: 12,
      color: AppColors.color666666,
      fontWeight: FontWeight.w400,
      height: 1.5,
    ),
  ),
  // canvasColor: sThemeBgColor,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: AppColors.sThemePColor,
    secondary: AppColors.sThemePColor,
    brightness: Brightness.light,
  ),
  // scaffoldBackgroundColor: sThemeBgColor,
  fontFamily: 'NatoSans',
  brightness: Brightness.light,
  useMaterial3: true,
);
