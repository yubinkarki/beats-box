import 'package:bloc/bloc.dart' show Bloc, Emitter;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:beats_box/services/locator.dart';
import 'package:beats_box/bloc/auth/auth_event.dart';
import 'package:beats_box/bloc/auth/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const InitialAuthState()) {
    on<CheckIsLoggedIn>(_checkIsLoggedIn);
  }
}

Future<void> _checkIsLoggedIn(CheckIsLoggedIn event, Emitter<AuthState> emit) async {
  final storage = getIt.get<FlutterSecureStorage>();

  final String isLoggedInData = await storage.read(key: "isLoggedIn") ?? "false";

  if (isLoggedInData == "true") {
    emit(IsLoggedIn(isLoggedIn: bool.fromEnvironment(isLoggedInData)));
  } else {
    emit(const IsLoggedOut());
  }
}
