import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTypography {
  static const String fontFamily = 'Urbanist';

  static TextTheme getCustomTextTheme({
    required BuildContext context,
    Color? customColor,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return TextTheme(
      //Large
      largeTitleRegular: _getTextStyle(
        fontSize: 34,
        fontWeight: FontWeight.w400,
        customColor: customColor,
        isDark: isDark,
      ),
      largeTitleEmphasized: _getTextStyle(
        fontSize: 34,
        fontWeight: FontWeight.w700,
        customColor: customColor,
        isDark: isDark,
      ),

      //Title 1
      titleOneRegular: _getTextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w400,
        customColor: customColor,
        isDark: isDark,
      ),
      titleOneEmphasized: _getTextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        customColor: customColor,
        isDark: isDark,
      ),

      //Title 2
      titleTwoRegular: _getTextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w400,
        customColor: customColor,
        isDark: isDark,
      ),
      titleTwoEmphasized: _getTextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        customColor: customColor,
        isDark: isDark,
      ),

      //Title 3
      titleThreeRegular: _getTextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        customColor: customColor,
        isDark: isDark,
      ),
      titleThreeEmphasized: _getTextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        customColor: customColor,
        isDark: isDark,
      ),

      //Headline
      headLineRegular: _getTextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w600,
        customColor: customColor,
        isDark: isDark,
      ),
      headLineItalic: _getTextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.italic,
        customColor: customColor,
        isDark: isDark,
      ),

      //Body
      bodyRegular: _getTextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w400,
        customColor: customColor,
        isDark: isDark,
      ),
      bodyEmphasized: _getTextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w600,
        customColor: customColor,
        isDark: isDark,
      ),
      bodyItalic: _getTextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.italic,
        customColor: customColor,
        isDark: isDark,
      ),
      bodyEmphasizedItalic: _getTextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.italic,
        customColor: customColor,
        isDark: isDark,
      ),

      //Callout
      calloutRegular: _getTextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        customColor: customColor,
        isDark: isDark,
      ),
      calloutEmphasized: _getTextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        customColor: customColor,
        isDark: isDark,
      ),
      calloutItalic: _getTextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.italic,
        customColor: customColor,
        isDark: isDark,
      ),
      calloutEmphasizedItalic: _getTextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.italic,
        customColor: customColor,
        isDark: isDark,
      ),

      //Subheadline
      subheadlineRegular: _getTextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        customColor: customColor,
        isDark: isDark,
      ),
      subheadlineEmphasized: _getTextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        customColor: customColor,
        isDark: isDark,
      ),
      subheadlineItalic: _getTextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.italic,
        customColor: customColor,
        isDark: isDark,
      ),
      subheadlineEmphasizedItalic: _getTextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.italic,
        customColor: customColor,
        isDark: isDark,
      ),

      //Footnote
      footnoteRegular: _getTextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        customColor: customColor,
        isDark: isDark,
      ),
      footnoteEmphasized: _getTextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        customColor: customColor,
        isDark: isDark,
      ),
      footnoteItalic: _getTextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.italic,
        customColor: customColor,
        isDark: isDark,
      ),
      footnoteEmphasizedItalic: _getTextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.italic,
        customColor: customColor,
        isDark: isDark,
      ),

      //Caption 1
      captionOneRegular: _getTextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        customColor: customColor,
        isDark: isDark,
      ),
      captionOneEmphasized: _getTextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        customColor: customColor,
        isDark: isDark,
      ),
      captionOneItalic: _getTextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.italic,
        customColor: customColor,
        isDark: isDark,
      ),
      captionOneEmphasizedItalic: _getTextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.italic,
        customColor: customColor,
        isDark: isDark,
      ),

      //Caption 2
      captionTwoRegular: _getTextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w400,
        customColor: customColor,
        isDark: isDark,
      ),
      captionTwoEmphasized: _getTextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w600,
        customColor: customColor,
        isDark: isDark,
      ),
      captionTwoItalic: _getTextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.italic,
        customColor: customColor,
        isDark: isDark,
      ),
      captionTwoEmphasizedItalic: _getTextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.italic,
        customColor: customColor,
        isDark: isDark,
      ),
    );
  }

  static TextStyle _getTextStyle({
    required double fontSize,
    required FontWeight fontWeight,
    FontStyle? fontStyle,
    required bool isDark,
    Color? customColor,
  }) {
    return GoogleFonts.urbanist(
      fontWeight: fontWeight,
      fontSize: fontSize,
      fontStyle: fontStyle ?? FontStyle.normal,
      color: customColor ?? (isDark ? Colors.white : Colors.black),
    );
  }
}

class TextTheme {
  final TextStyle largeTitleRegular;
  final TextStyle largeTitleEmphasized;
  final TextStyle titleOneRegular;
  final TextStyle titleOneEmphasized;
  final TextStyle titleTwoRegular;
  final TextStyle titleTwoEmphasized;
  final TextStyle titleThreeRegular;
  final TextStyle titleThreeEmphasized;
  final TextStyle headLineRegular;
  final TextStyle headLineItalic;
  final TextStyle bodyRegular;
  final TextStyle bodyEmphasized;
  final TextStyle bodyItalic;
  final TextStyle bodyEmphasizedItalic;
  final TextStyle calloutRegular;
  final TextStyle calloutEmphasized;
  final TextStyle calloutItalic;
  final TextStyle calloutEmphasizedItalic;
  final TextStyle subheadlineRegular;
  final TextStyle subheadlineEmphasized;
  final TextStyle subheadlineItalic;
  final TextStyle subheadlineEmphasizedItalic;
  final TextStyle footnoteRegular;
  final TextStyle footnoteEmphasized;
  final TextStyle footnoteItalic;
  final TextStyle footnoteEmphasizedItalic;
  final TextStyle captionOneRegular;
  final TextStyle captionOneEmphasized;
  final TextStyle captionOneItalic;
  final TextStyle captionOneEmphasizedItalic;
  final TextStyle captionTwoRegular;
  final TextStyle captionTwoEmphasized;
  final TextStyle captionTwoItalic;
  final TextStyle captionTwoEmphasizedItalic;

  const TextTheme(
      {required this.largeTitleRegular,
        required this.largeTitleEmphasized,
        required this.titleOneRegular,
        required this.titleOneEmphasized,
        required this.titleTwoRegular,
        required this.titleTwoEmphasized,
        required this.titleThreeRegular,
        required this.titleThreeEmphasized,
        required this.headLineRegular,
        required this.headLineItalic,
        required this.bodyRegular,
        required this.bodyEmphasized,
        required this.bodyItalic,
        required this.bodyEmphasizedItalic,
        required this.calloutRegular,
        required this.calloutEmphasized,
        required this.calloutItalic,
        required this.calloutEmphasizedItalic,
        required this.subheadlineRegular,
        required this.subheadlineEmphasized,
        required this.subheadlineItalic,
        required this.subheadlineEmphasizedItalic,
        required this.footnoteRegular,
        required this.footnoteEmphasized,
        required this.footnoteItalic,
        required this.footnoteEmphasizedItalic,
        required this.captionOneRegular,
        required this.captionOneEmphasized,
        required this.captionOneItalic,
        required this.captionOneEmphasizedItalic,
        required this.captionTwoRegular,
        required this.captionTwoEmphasized,
        required this.captionTwoItalic,
        required this.captionTwoEmphasizedItalic});
}
