import 'package:flutter/material.dart';

import 'package:beats_box/constants/constants_barrel.dart' show AppPaddings, AppSizes, AppStrings;

InputDecoration inputDecoration({
  required rightIcon,
  Color? inputLabelColor,
  required String labelText,
  required String helperText,
  required ColorScheme colorTheme,
}) {
  return InputDecoration(
    labelText: labelText,
    suffixIcon: rightIcon,
    helperText: helperText,
    counterText: AppStrings.empty,
    labelStyle: TextStyle(color: inputLabelColor ?? colorTheme.tertiary),
    contentPadding: const EdgeInsets.symmetric(horizontal: AppPaddings.p16),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(width: 1, color: Colors.grey),
      borderRadius: BorderRadius.circular(AppSizes.s10),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 1, color: colorTheme.outline),
      borderRadius: BorderRadius.circular(AppSizes.s10),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 1, color: colorTheme.error),
      borderRadius: BorderRadius.circular(AppSizes.s10),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 1, color: colorTheme.error),
      borderRadius: BorderRadius.circular(AppSizes.s10),
    ),
  );
}
