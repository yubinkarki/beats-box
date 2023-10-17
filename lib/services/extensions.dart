import 'package:flutter/material.dart';

extension DoubleExtension on double? {
  double validate({double value = 0.0}) {
    return this ?? 0.0;
  }

  Widget get sizedBoxHeight => SizedBox(height: this);
  Widget get sizedBoxWidth => SizedBox(width: this);
}
