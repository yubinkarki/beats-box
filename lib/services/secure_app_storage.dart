import 'package:flutter/foundation.dart' show debugPrint;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' show FlutterSecureStorage;

import 'package:beats_box/services/locator.dart' show getIt;
import 'package:beats_box/constants/constants_barrel.dart' show LoggedInStatus, AppStrings;

class SecureAppStorage {
  final _storage = getIt.get<FlutterSecureStorage>();

  Future<void> initLoggedIn() async {
    try {
      final existingValue = await _storage.read(key: LoggedInStatus.isLoggedIn.toString());

      debugPrint("Current isLoggedIn value $existingValue");

      if (existingValue == null) {
        await _storage.write(key: LoggedInStatus.isLoggedIn.toString(), value: "false");
      }
    } catch (e) {
      debugPrint("${AppStrings.isLoggedInWriteError} $e");
    }
  }

  Future<void> readAllStorageValues() async {
    Map<String, String> allValues = await _storage.readAll();

    debugPrint("All storage values $allValues");
  }
}
