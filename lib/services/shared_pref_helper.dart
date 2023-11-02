import 'package:beats_box/services/services_barrel.dart' show getIt;
import 'package:shared_preferences/shared_preferences.dart';

enum SharedUser {
  firstRun,
  authEmail,
  authToken,
  googleLoginUserDetails,
}

class SharedPreferencesHelper {
  // static SharedPreferences? _pref;
  final _pref = getIt.get<SharedPreferences>();

  // static Future<void> init() async {
  //   _pref = await SharedPreferences.getInstance();
  // }

  // static Future checkFirstRun() async {
  //   if (_pref?.getBool(SharedUser.firstRun.toString()) ?? true) {
  //     _pref?.setBool(SharedUser.firstRun.toString(), false);
  //   }
  // }

  // static Future setAuthToken(String token) async {
  //   return _pref!.setString(UserPref.authToken.toString(), token);
  // }

  // static Future getAuthToken() async {
  //   return _pref!.getString(UserPref.authToken.toString());
  // }

  // static Future removeAuthToken() async {
  //   return _pref!.remove(UserPref.authToken.toString());
  // }

  // static Future setAuthEmail(String token) async {
  //   return _pref!.setString(UserPref.authEmail.toString(), token);
  // }

  // static Future getAuthEmail() async {
  //   return _pref!.getString(UserPref.authEmail.toString());
  // }

  // static Future removeAuthEmail() async {
  //   return _pref!.remove(UserPref.authEmail.toString());
  // }

  // static Future setGoogleUserDetails(String userDetails) async {
  //   return _pref!.setString(UserPref.googleSigninUserDetails.toString(), userDetails);
  // }

  // static Future getGoogleUserDetails() async {
  //   return _pref!.getString(UserPref.googleSigninUserDetails.toString());
  // }

  // static Future removeGoogleUserDetails() async {
  //   return _pref!.remove(UserPref.googleSigninUserDetails.toString());
  // }
}
