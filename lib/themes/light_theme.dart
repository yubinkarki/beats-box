import 'package:flutter/material.dart';

import 'package:beats_box/themes/light_text_theme.dart';
import 'package:beats_box/constants/constants_barrel.dart';

ThemeData lightTheme(BuildContext context) {
  final base = ThemeData.light();

  return base.copyWith(
    appBarTheme: const AppBarTheme(color: AppColors.teal),
    colorScheme: const ColorScheme.light(
      error: AppColors.red,
      primary: AppColors.teal,
      outline: AppColors.darkTeal,
      background: AppColors.lightTeal,
    ),
    textTheme: lightTextTheme(base.textTheme),
  );
}
