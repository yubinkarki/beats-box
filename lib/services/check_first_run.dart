import 'package:shared_preferences/shared_preferences.dart' show SharedPreferences;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' show FlutterSecureStorage;

import 'package:beats_box/services/services_barrel.dart' show getIt;
import 'package:beats_box/constants/constants_barrel.dart' show LoggedInStatus, SharedUser;

Future<void> checkFirstRun() async {
  final pref = getIt.get<SharedPreferences>();
  final storage = getIt.get<FlutterSecureStorage>();

  if (pref.getBool(SharedUser.firstRun.toString()) ?? true) {
    await storage.delete(key: LoggedInStatus.isLoggedIn.toString());
    pref.setBool(SharedUser.firstRun.toString(), false);
  }
}
