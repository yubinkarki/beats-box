import 'package:flutter/material.dart' show Widget, SnackBar;

import "package:beats_box/globals/globals_barrel.dart" show GlobalKeys;

abstract class Messenger {
  void showSnackBar({required Widget content});
}

class SnackMessenger implements Messenger {
  @override
  void showSnackBar({required Widget content}) {
    GlobalKeys.scaffoldMessengerKey.currentState!
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: content));
  }
}
