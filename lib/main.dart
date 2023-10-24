import 'package:flutter/material.dart';
import "package:flutter_native_splash/flutter_native_splash.dart";

import "app.dart" show App;
import "package:beats_box/services/services_barrel.dart" show setupLocator, SecureAppStorage, androidSystemUI;

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  androidSystemUI();

  await setupLocator();

  await SecureAppStorage().initIsLoggedIn();

  runApp(const App());
}
