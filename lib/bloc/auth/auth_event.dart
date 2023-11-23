import 'package:flutter/foundation.dart';

@immutable
abstract class AuthEvent {
  const AuthEvent();
}

class AuthEventInitialize extends AuthEvent {
  const AuthEventInitialize();
}

class CheckIsLoggedIn extends AuthEvent {
  const CheckIsLoggedIn();
}

class SignInWithGoogle extends AuthEvent {
  const SignInWithGoogle();
}

class SignInWithCustomEmail extends AuthEvent {
  final String email, password;

  const SignInWithCustomEmail(this.email, this.password);
}

class RegisterWithCustomEmail extends AuthEvent {
  final String email, password, fullName;

  const RegisterWithCustomEmail(this.email, this.password, this.fullName);
}
