import 'dart:developer' show inspect;

import 'package:beats_box/constants/app_strings.dart';
import 'package:bloc/bloc.dart' show Bloc, Emitter;
import 'package:flutter/material.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart' show GoogleSignInAccount;

import 'package:beats_box/services/locator.dart';
import 'package:beats_box/bloc/auth/auth_event.dart';
import 'package:beats_box/bloc/auth/auth_state.dart';
import 'package:beats_box/repositories/repositories_barrel.dart' show AuthRepo;

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo authRepo;

  AuthBloc({required this.authRepo}) : super(const InitialAuthState()) {
    on<CheckIsLoggedIn>(_checkIsLoggedIn);
    on<SignInWithGoogle>(_signInWithGoogle);
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

  Future<void> _signInWithGoogle(SignInWithGoogle event, Emitter<AuthState> emit) async {
    try {
      final GoogleSignInAccount? googleUserData = await authRepo.signInWithGoogle();
      final googleSignInAuthentication = await googleUserData?.authentication;
      final googleToken = googleSignInAuthentication?.accessToken;

      if (googleToken != null) {
        debugPrint("This is google date: $googleToken $googleUserData");
        emit(const AuthenticationSuccess());
      } else {
        emit(const AuthenticationFailure(AppStrings.loginCancelled));
      }
    } catch (e) {
      inspect(e);
      emit(const AuthenticationFailure(AppStrings.somethingWentWrong));
    }
  }
}
