import 'package:flutter/material.dart';

class AppTypography {
  static const String fontFamily = 'Deneme';

  static TextTheme getTextTheme({
    required BuildContext context,
    Color? customColor,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return TextTheme(
      /// Large Title - regular
      displayLarge: _getTextStyle(
        fontSize: 34,
        fontWeight: FontWeight.w400,
        customColor: customColor,
        isDark: isDark,
      ),

      /// Large Title - emphasized
      displayMedium: _getTextStyle(
        fontSize: 34,
        fontWeight: FontWeight.w700,
        customColor: customColor,
        isDark: isDark,
      ),

      /// Title 1 - regular
      titleLarge: _getTextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w400,
        customColor: customColor,
        isDark: isDark,
      ),

      /// Title 1 - emphasized
      titleMedium: _getTextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        customColor: customColor,
        isDark: isDark,
      ),

      /// Title 2 - regular
      titleSmall: _getTextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w400,
        customColor: customColor,
        isDark: isDark,
      ),

      /// Title 2 - emphasized
      headlineLarge: _getTextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        customColor: customColor,
        isDark: isDark,
      ),
      headlineMedium: _getTextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        customColor: customColor,
        isDark: isDark,
      ),
      bodyLarge: _getTextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w400,
        customColor: customColor,
        isDark: isDark,
      ),
      bodyMedium: _getTextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w600,
        customColor: customColor,
        isDark: isDark,
      ),
      bodySmall: _getTextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.italic,
        customColor: customColor,
        isDark: isDark,
      ),
      labelLarge: _getTextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        customColor: customColor,
        isDark: isDark,
      ),
      labelMedium: _getTextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        customColor: customColor,
        isDark: isDark,
      ),
      labelSmall: _getTextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        customColor: customColor,
        isDark: isDark,
      ),
    );
  }

  // Ortak TextStyle oluşturma metodu
  static TextStyle _getTextStyle({
    required double fontSize,
    required FontWeight fontWeight,
    FontStyle fontStyle = FontStyle.normal,
    required bool isDark,
    Color? customColor,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      fontSize: fontSize,
      fontStyle: fontStyle,
      color: customColor ?? (isDark ? Colors.white : Colors.black),
    );
  }
}
