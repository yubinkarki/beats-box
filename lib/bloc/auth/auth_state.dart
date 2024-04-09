import 'package:flutter/foundation.dart' show immutable;

import 'package:beats_box/models/models_barrel.dart' show CustomAuthUser, GoogleUser;

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

class Authenticating extends AuthState {
  const Authenticating({super.isLoading});
}

class AuthenticationSuccess extends AuthState {
  final GoogleUser? googleUser;
  final CustomAuthUser? customUser;

  const AuthenticationSuccess({this.customUser, this.googleUser});
}

class AccountCreationSuccess extends AuthState {
  const AccountCreationSuccess();
}

class AuthenticationFailure extends AuthState {
  final String errorMessage;
  final Exception? exception;

  const AuthenticationFailure(this.errorMessage, this.exception);
}
