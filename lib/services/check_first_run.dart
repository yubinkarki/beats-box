import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart' show SharedPreferences;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' show FlutterSecureStorage;

import 'package:beats_box/services/services_barrel.dart' show getIt;
import 'package:beats_box/constants/constants_barrel.dart' show LoggedInStatus, SharedUser;

final pref = getIt.get<SharedPreferences>();
final storage = getIt.get<FlutterSecureStorage>();

Future<void> checkFirstRun() async {
  final bool firstRun = pref.getBool(SharedUser.firstRun.toString()) ?? false;

  debugPrint("This is check first run $firstRun");

  if (firstRun) {
    debugPrint("This is running because first run.");

    await storage.delete(key: LoggedInStatus.isLoggedIn.toString());
    pref.setBool(SharedUser.firstRun.toString(), false);
  }
}

Future<void> readFirstRun() async {
  final bool? firstRun = pref.getBool(SharedUser.firstRun.toString());

  debugPrint("This is read first run $firstRun");
}
