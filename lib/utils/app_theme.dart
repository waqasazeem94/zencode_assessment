import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zencode_assessment/constants/app_colors.dart';

class AppTheme {
  static ThemeData buildTheme() {
    final baseData = ThemeData.light();
    final textTheme = baseData.textTheme;
    final newTextTheme = textTheme.copyWith(
      labelMedium: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      labelLarge: GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      headlineSmall: GoogleFonts.poppins(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      headlineLarge: GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      headlineMedium: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      titleSmall: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w300,
      ),
    );

    return baseData.copyWith(
      primaryColor: Colors.white,
      scaffoldBackgroundColor: AppColors.greyBgColor,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      textTheme: newTextTheme,
    );
  }
}