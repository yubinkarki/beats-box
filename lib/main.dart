import 'package:flutter/material.dart' show WidgetsFlutterBinding, WidgetsBinding, runApp;

import 'package:flutter_bloc/flutter_bloc.dart' show Bloc;
import 'package:flutter_native_splash/flutter_native_splash.dart' show FlutterNativeSplash;

import 'app.dart' show App;
import 'package:beats_box/services/services_barrel.dart'
    show AppBlocObserver, SecureAppStorage, androidSystemUI, checkFirstRun, setupLocator;

void main() async {
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  Bloc.observer = const AppBlocObserver();

  androidSystemUI();

  await setupLocator(); // Register singleton via GetIt.

  await checkFirstRun();

  await SecureAppStorage().initLoggedIn();

  runApp(const App());
}
