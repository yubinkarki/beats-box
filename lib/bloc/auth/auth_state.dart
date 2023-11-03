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
  const IsLoggedIn();
}

class IsLoggedOut extends AuthState {
  const IsLoggedOut();
}

class AuthenticationSuccess extends AuthState {
  const AuthenticationSuccess();
}

class AuthenticationFailure extends AuthState {
  final String errorMessage;

  const AuthenticationFailure(this.errorMessage);
}
