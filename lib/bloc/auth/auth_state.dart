import 'package:flutter/foundation.dart';

@immutable
abstract class AuthState {
  final bool isLoading;

  const AuthState({this.isLoading = false});
}

class InitialAuthState extends AuthState {
  const InitialAuthState();
}

class IsLoggedIn extends AuthState {
  final bool isLoggedIn;

  const IsLoggedIn({this.isLoggedIn = false});
}

class IsLoggedOut extends AuthState {
  const IsLoggedOut();
}
