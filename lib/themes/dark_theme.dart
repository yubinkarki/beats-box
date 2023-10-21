import 'package:flutter/material.dart';

import 'package:beats_box/themes/dark_text_theme.dart';
import 'package:beats_box/constants/constants_barrel.dart';

ThemeData darkTheme(BuildContext context) {
  final base = ThemeData.dark();

  return base.copyWith(
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
    appBarTheme: const AppBarTheme(color: AppColors.dark),
    colorScheme: const ColorScheme.dark(
      primary: AppColors.slightlyWhite,
      background: AppColors.slightlyDark,
      error: AppColors.red,
      outline: AppColors.teal,
    ),
    textTheme: darkTextTheme(base.textTheme),
  );
}
