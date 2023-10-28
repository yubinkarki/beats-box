import 'package:flutter/material.dart';

import 'package:beats_box/themes/light_text_theme.dart';
import 'package:beats_box/constants/constants_barrel.dart';

ThemeData lightTheme(BuildContext context) {
  final base = ThemeData.light();

  return base.copyWith(
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      },
    ),
    appBarTheme: const AppBarTheme(color: AppColors.teal),
    colorScheme: const ColorScheme.light(
      error: AppColors.red,
      primary: AppColors.teal,
      background: AppColors.lightTeal,
      outline: AppColors.purpleOutline,
    ),
    textTheme: lightTextTheme(base.textTheme),
  );
}
