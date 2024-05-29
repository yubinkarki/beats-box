import 'package:flutter/material.dart'
    show BuildContext, TextTheme, Theme, showAdaptiveDialog, AlertDialog, Text, TextButton, Navigator;

import 'package:beats_box/constants/constants_barrel.dart' show AppStrings;

typedef DialogOptionBuilder<T> = Map<String, T?> Function();

Future<T?> showCustomGenericDialog<T>({
  required String title,
  required String content,
  required BuildContext context,
  required DialogOptionBuilder optionsBuilder,
}) {
  final options = optionsBuilder();
  final TextTheme textTheme = Theme.of(context).textTheme;

  return showAdaptiveDialog<T>(
    context: context,
    builder: (context) {
      return AlertDialog.adaptive(
        title: Text(title, style: textTheme.labelLarge),
        content: Text(content, style: textTheme.labelMedium),
        actions: options.keys.map((optionTitle) {
          final T value = options[optionTitle];

          return TextButton(
            onPressed: () {
              if (value != null) {
                options[optionTitle]();
              } else {
                Navigator.of(context).pop(AppStrings.dialog);
              }
            },
            child: Text(optionTitle, style: textTheme.labelMedium),
          );
        }).toList(),
      );
    },
  );
}
