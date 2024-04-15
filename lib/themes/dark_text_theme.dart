import 'package:flutter/material.dart';

import 'package:beats_box/constants/constants_barrel.dart' show LocalFonts, AppColors;

TextTheme darkTextTheme(TextTheme base) {
  const baseStyle = TextStyle(
    letterSpacing: 0.5,
    fontWeight: FontWeight.w500,
    fontFamily: LocalFonts.roboto,
    color: AppColors.slightlyWhite,
  );

  return base.copyWith(
    labelSmall: baseStyle.copyWith(fontSize: 16),
    labelLarge: baseStyle.copyWith(fontSize: 24),
    titleSmall: baseStyle.copyWith(fontSize: 18),
    titleLarge: baseStyle.copyWith(fontSize: 26),
    labelMedium: baseStyle.copyWith(fontSize: 20),
    titleMedium: baseStyle.copyWith(fontSize: 22),
  );
}
