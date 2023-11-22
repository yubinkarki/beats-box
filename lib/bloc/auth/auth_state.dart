import 'package:flutter/foundation.dart';

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
  const IsLoggedOut({super.isLoading});
}

class AuthenticationSuccess extends AuthState {
  final GoogleUser? googleUser;
  final CustomAuthUser? customUser;

  const AuthenticationSuccess({this.customUser, this.googleUser});
}

class AuthenticationFailure extends AuthState {
  final String errorMessage;

  const AuthenticationFailure(this.errorMessage);
}
