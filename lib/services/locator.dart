import 'package:get_it/get_it.dart' show GetIt;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart' show SharedPreferences;

import "package:beats_box/globals/globals_barrel.dart" show LoadingOverlay;

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  getIt.registerSingleton<FlutterSecureStorage>(
    const FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true),
      iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
    ),
  );

  getIt.registerSingleton<SharedPreferences>(await SharedPreferences.getInstance());

  getIt.registerSingleton<LoadingOverlay>(LoadingOverlay());
}
