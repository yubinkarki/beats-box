import 'dart:convert' show json;

import 'package:shared_preferences/shared_preferences.dart' show SharedPreferences;

import 'package:beats_box/services/services_barrel.dart' show getIt;
import "package:beats_box/constants/constants_barrel.dart" show SharedUser;
import "package:beats_box/constants/constants_barrel.dart" show AppStrings;

class SharedPreferencesHelper {
  static final _pref = getIt.get<SharedPreferences>();

  static Future setCustomEmailUserDetails(String userDetails) async {
    await _pref.setString(SharedUser.customEmailUserDetails.toString(), userDetails);
  }

  static Future getCustomEmailUserDetails() async {
    String? encodedUserData = _pref.getString(SharedUser.customEmailUserDetails.toString());

    Map<String, dynamic> decodedUserData = json.decode(encodedUserData ?? AppStrings.empty);

    return decodedUserData;
  }
}
