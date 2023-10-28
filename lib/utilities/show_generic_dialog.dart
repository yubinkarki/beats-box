import 'package:flutter/material.dart';

typedef DialogOptionBuilder<T> = Map<String, T?> Function();

Future<T?> showCustomGenericDialog<T>({
  required String title,
  required String content,
  required BuildContext context,
  required DialogOptionBuilder optionsBuilder,
}) {
  final options = optionsBuilder();
  final TextTheme textTheme = Theme.of(context).textTheme;

  return showDialog<T>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title, style: textTheme.labelLarge),
        content: Text(content, style: textTheme.labelMedium),
        actions: options.keys.map((optionTitle) {
          final T value = options[optionTitle];

          return TextButton(
            onPressed: () {
              if (value != null) {
                Navigator.of(context).pop(value);
              } else {
                Navigator.of(context).pop();
              }
            },
            child: Text(optionTitle, style: textTheme.labelMedium),
          );
        }).toList(),
      );
    },
  );
}
