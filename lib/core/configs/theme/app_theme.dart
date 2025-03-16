import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static final appTheme = ThemeData(
    primaryColor: MyColors.primary,
    scaffoldBackgroundColor: MyColors.background,
    brightness: Brightness.dark,
    fontFamily: 'CircularStd',
    inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: MyColors.onBackground.withOpacity(0.1),
        hintStyle: TextStyle(
          color: MyColors.onBackgroundText.withOpacity(0.4),
          fontWeight: FontWeight.w400,
        ),
        errorStyle:
            const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        contentPadding: const EdgeInsets.all(16),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide.none),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide.none)),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: MyColors.primary,
            elevation: 0,
            textStyle:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100)))),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: MyColors.onBackgroundText, // Cursor color
      selectionHandleColor:
          MyColors.onBackgroundText, // Handle (drag point) color
    ),
  );
}
