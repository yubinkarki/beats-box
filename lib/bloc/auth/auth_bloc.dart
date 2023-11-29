import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart' show Bloc, Emitter;
import 'package:google_sign_in/google_sign_in.dart' show GoogleSignInAccount;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' show FlutterSecureStorage;

import 'package:beats_box/bloc/blocs_barrel.dart';
import 'package:beats_box/services/services_barrel.dart' show AuthProvider;
import 'package:beats_box/repositories/repositories_barrel.dart' show AuthRepo;
import 'package:beats_box/constants/constants_barrel.dart' show LoggedInStatus, AppStrings;

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo authRepo;
  final AuthProvider provider;
  final FlutterSecureStorage storage;

  AuthBloc({
    required this.storage,
    required this.authRepo,
    required this.provider,
  }) : super(const InitialAuthState()) {
    on<CheckIsLoggedIn>(_checkIsLoggedIn);
    on<SignInWithGoogle>(_signInWithGoogle);
    on<AuthEventInitialize>(_initializeProvider);
    on<SignInWithCustomEmail>(_signInWithCustomEmail);
    on<RegisterWithCustomEmail>(_registerWithCustomEmail);
  }

  Future<void> _initializeProvider(AuthEventInitialize event, Emitter<AuthState> emit) async {
    await provider.initialize();
  }

  Future<void> _checkIsLoggedIn(CheckIsLoggedIn event, Emitter<AuthState> emit) async {
    final String isLoggedInData = await storage.read(key: LoggedInStatus.isLoggedIn.toString()) ?? "false";

    if (isLoggedInData == "true") {
      emit(const IsLoggedIn());
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
        await storage.write(key: LoggedInStatus.isLoggedIn.toString(), value: "true");
        emit(const AuthenticationSuccess());
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> _signInWithCustomEmail(SignInWithCustomEmail event, Emitter<AuthState> emit) async {
    emit(const Authenticating(isLoading: true));

    await Future.delayed(const Duration(milliseconds: 500));

    try {
      await provider.logIn(email: event.email, password: event.password).then((value) async {
        await storage.write(key: LoggedInStatus.isLoggedIn.toString(), value: "true");

        emit(const Authenticating(isLoading: false));
        emit(const AuthenticationSuccess());
      });
    } on Exception catch (e) {
      emit(const Authenticating(isLoading: false));
      emit(AuthenticationFailure(AppStrings.somethingWentWrong, e));
    }
  }

  Future<void> _registerWithCustomEmail(RegisterWithCustomEmail event, Emitter<AuthState> emit) async {
    emit(const Authenticating(isLoading: true));

    await Future.delayed(const Duration(milliseconds: 500));

    try {
      await provider.signUp(email: event.email, password: event.password, fullName: event.fullName).then((value) {
        emit(const Authenticating(isLoading: false));
        emit(const AccountCreationSuccess());
      });
    } on Exception catch (e) {
      emit(const Authenticating(isLoading: false));
      emit(AuthenticationFailure(AppStrings.somethingWentWrong, e));
    }
  }
}
