import 'package:flutter/material.dart';

import 'package:beats_box/constants/constants_barrel.dart';

Row customHorizontalLine() {
  return Row(
    children: [
      Expanded(
        child: Container(
          margin: const EdgeInsets.only(right: AppMargins.m14),
          child: const Divider(color: AppColors.slightlyWhiteLessTransparent),
        ),
      ),
      const Text(
        AppStrings.or,
        style: TextStyle(color: AppColors.slightlyWhite),
      ),
      Expanded(
        child: Container(
          margin: const EdgeInsets.only(left: AppMargins.m14),
          child: const Divider(color: AppColors.slightlyWhiteLessTransparent),
        ),
      ),
    ],
  );
}
