import 'package:flutter/material.dart';

import 'package:beats_box/themes/light_text_theme.dart' show lightTextTheme;
import 'package:beats_box/constants/constants_barrel.dart' show AppColors, AppSizes;

ThemeData lightTheme(BuildContext context) {
  final base = ThemeData.light();

  return base.copyWith(
    textTheme: lightTextTheme(base.textTheme),
    appBarTheme: const AppBarTheme(color: AppColors.teal),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      },
    ),
    colorScheme: const ColorScheme.light(
      error: AppColors.red,
      primary: AppColors.teal,
      tertiary: AppColors.dark,
      background: AppColors.lightTeal,
      outline: AppColors.purpleOutline,
      secondary: AppColors.lessLightTeal,
      secondaryContainer: AppColors.slightlyDarkTeal,
    ),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: AppColors.lightTeal,
      insetPadding: EdgeInsets.all(AppSizes.s8),
      actionTextColor: AppColors.slightlyDarker,
      actionBackgroundColor: AppColors.lessLightTeal,
      contentTextStyle: TextStyle(color: AppColors.dark, fontSize: AppSizes.s18),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(AppSizes.s18))),
    ),
  );
}
