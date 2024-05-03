import 'package:flutter/material.dart' show Widget, SizedBox;

extension DoubleExtension on double? {
  double validate({double value = 0.0}) {
    return this ?? 0.0;
  }

  Widget get sizedBoxWidth => SizedBox(width: this);
  Widget get sizedBoxHeight => SizedBox(height: this);
}

extension StringExtension on String {
  String get toCapitalize => length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String get toTitleCase => replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.toCapitalize).join(' ');
}
