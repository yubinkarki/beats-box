import 'package:flutter/material.dart';

import 'package:beats_box/themes/dark_text_theme.dart';
import 'package:beats_box/constants/constants_barrel.dart';

ThemeData darkTheme(BuildContext context) {
  final base = ThemeData.dark();

  return base.copyWith(
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      },
    ),
    appBarTheme: const AppBarTheme(color: AppColors.dark),
    colorScheme: const ColorScheme.dark(
      error: AppColors.red,
      outline: AppColors.purpleOutline,
      primary: AppColors.slightlyWhite,
      background: AppColors.slightlyDark,
      secondary: AppColors.slightlyDarker,
      secondaryContainer: AppColors.lightTeal,
    ),
    textTheme: darkTextTheme(base.textTheme),
  );
}
