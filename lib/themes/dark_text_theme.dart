import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:beats_box/constants/constants_barrel.dart';

TextTheme darkTextTheme(TextTheme base) {
  return base.copyWith(
    labelSmall: GoogleFonts.robotoCondensed(
      fontSize: 16,
      letterSpacing: 0.5,
      fontWeight: FontWeight.w500,
      color: AppColors.slightlyWhite,
    ),
    labelMedium: GoogleFonts.robotoCondensed(
      fontSize: 20,
      letterSpacing: 0.5,
      fontWeight: FontWeight.w500,
      color: AppColors.slightlyWhite,
    ),
    labelLarge: GoogleFonts.robotoCondensed(
      fontSize: 24,
      letterSpacing: 0.5,
      fontWeight: FontWeight.w500,
      color: AppColors.slightlyWhite,
    ),
    titleSmall: GoogleFonts.robotoCondensed(
      fontSize: 18,
      letterSpacing: 0.5,
      fontWeight: FontWeight.w500,
      color: AppColors.slightlyWhite,
    ),
    titleMedium: GoogleFonts.robotoCondensed(
      fontSize: 22,
      letterSpacing: 0.5,
      fontWeight: FontWeight.w500,
      color: AppColors.slightlyWhite,
    ),
    titleLarge: GoogleFonts.robotoCondensed(
      fontSize: 26,
      letterSpacing: 0.5,
      fontWeight: FontWeight.w500,
      color: AppColors.slightlyWhite,
    ),
  );
}
