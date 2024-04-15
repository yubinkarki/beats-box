import 'package:flutter/material.dart';

import "package:beats_box/globals/globals_barrel.dart" show GlobalKeys;

abstract class Messenger {
  void showSnackBar({
    String? actionLabel,
    required String message,
    VoidCallback? onActionPressed,
  });
}

class SnackMessenger implements Messenger {
  @override
  void showSnackBar({
    String? actionLabel,
    required String message,
    VoidCallback? onActionPressed,
  }) {
    GlobalKeys.scaffoldMessengerKey.currentState!
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          duration: const Duration(seconds: 5),
          action: (actionLabel != null && onActionPressed != null)
              ? SnackBarAction(label: actionLabel, onPressed: onActionPressed)
              : null,
        ),
      );
  }
}
