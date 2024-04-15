import 'package:flutter/material.dart';

import 'package:beats_box/themes/dark_text_theme.dart' show darkTextTheme;
import 'package:beats_box/constants/constants_barrel.dart' show AppColors, AppSizes;

ThemeData darkTheme(BuildContext context) {
  final base = ThemeData.dark();

  return base.copyWith(
    textTheme: darkTextTheme(base.textTheme),
    appBarTheme: const AppBarTheme(color: AppColors.dark),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      },
    ),
    colorScheme: const ColorScheme.dark(
      error: AppColors.red,
      tertiary: AppColors.white,
      outline: AppColors.purpleOutline,
      primary: AppColors.slightlyWhite,
      background: AppColors.slightlyDark,
      secondary: AppColors.slightlyDarker,
      secondaryContainer: AppColors.lightTeal,
    ),
    snackBarTheme: const SnackBarThemeData(
      actionTextColor: AppColors.lightTeal,
      backgroundColor: AppColors.slightlyDark,
      insetPadding: EdgeInsets.all(AppSizes.s8),
      actionBackgroundColor: AppColors.slightlyDarker,
      contentTextStyle: TextStyle(color: AppColors.slightlyWhite, fontSize: AppSizes.s18),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(AppSizes.s18))),
    ),
  );
}
