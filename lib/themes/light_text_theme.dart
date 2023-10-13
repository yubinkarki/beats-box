import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart' show GoogleFonts;

import 'package:beats_box/constants/constants_barrel.dart';

TextTheme lightTextTheme(TextTheme base) {
  return base.copyWith(
    labelSmall: GoogleFonts.robotoCondensed(
      fontSize: 16,
      letterSpacing: 0.5,
      color: AppColors.darkTeal,
      fontWeight: FontWeight.w500,
    ),
    labelMedium: GoogleFonts.robotoCondensed(
      fontSize: 20,
      letterSpacing: 0.5,
      color: AppColors.darkTeal,
      fontWeight: FontWeight.w500,
    ),
    labelLarge: GoogleFonts.robotoCondensed(
      fontSize: 24,
      letterSpacing: 0.5,
      color: AppColors.darkTeal,
      fontWeight: FontWeight.w500,
    ),
    titleSmall: GoogleFonts.robotoCondensed(
      fontSize: 18,
      letterSpacing: 0.5,
      color: AppColors.darkTeal,
      fontWeight: FontWeight.w500,
    ),
    titleMedium: GoogleFonts.robotoCondensed(
      fontSize: 22,
      letterSpacing: 0.5,
      color: AppColors.darkTeal,
      fontWeight: FontWeight.w500,
    ),
    titleLarge: GoogleFonts.robotoCondensed(
      fontSize: 26,
      letterSpacing: 0.5,
      color: AppColors.white,
      fontWeight: FontWeight.w500,
    ),
  );
}
