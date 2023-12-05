import 'dart:convert' show json;

import "package:firebase_core/firebase_core.dart" show Firebase;
import "package:firebase_auth/firebase_auth.dart" show FirebaseAuth, FirebaseAuthException;

import 'package:beats_box/services/authentication/auth_exceptions.dart';
import 'package:beats_box/models/models_barrel.dart' show CustomAuthUser;
import 'package:beats_box/constants/constants_barrel.dart' show AppStrings;
import 'package:beats_box/services/services_barrel.dart' show SharedPreferencesHelper;
import 'package:beats_box/utilities/utilities_barrel.dart' show DefaultFirebaseOptions;
import 'package:beats_box/services/authentication/auth_provider.dart' show AuthProvider;

class FirebaseAuthProvider implements AuthProvider {
  @override
  CustomAuthUser? get currentUser {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      return CustomAuthUser.firebaseCheck(user);
    } else {
      return null;
    }
  }

  @override
  Future<void> initialize() async {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  }

  @override
  Future<CustomAuthUser> logIn({required String email, required String password}) async {
    try {
      final result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);

      Map<String, String?> customUserData = {
        AppStrings.email: result.user?.email,
        AppStrings.photoUrl: result.user?.photoURL,
        AppStrings.phoneNumber: result.user?.phoneNumber,
        AppStrings.displayName: result.user?.displayName.toString(),
      };

      String encodedCustomUserData = json.encode(customUserData);

      final user = currentUser;

      if (user != null) {
        SharedPreferencesHelper.setCustomEmailUserDetails(encodedCustomUserData);

        return user;
      } else {
        throw UserNotLoggedInAuthException();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == AppStrings.userNotFound) {
        throw UserNotFoundAuthException();
      } else if (e.code == AppStrings.wrongPassword) {
        throw WrongPasswordAuthException();
      } else if (e.code == AppStrings.invalidLoginCredentials.toUpperCase()) {
        throw InvalidLoginCredentials();
      } else {
        throw GenericAuthException();
      }
    } catch (e) {
      throw GenericAuthException();
    }
  }

  @override
  Future<void> logOut() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      await FirebaseAuth.instance.signOut();
    } else {
      throw UserNotLoggedInAuthException();
    }
  }

  @override
  Future<CustomAuthUser> signUp({
    required String email,
    required String password,
    required String fullName,
  }) async {
    try {
      final result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);

      await result.user?.updateDisplayName(fullName);

      final user = currentUser;

      if (user != null) {
        return user;
      } else {
        throw UserNotLoggedInAuthException();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == AppStrings.weakPassword) {
        throw WeakPasswordAuthException();
      } else if (e.code == AppStrings.invalidEmail) {
        throw InvalidEmailAuthException();
      } else if (e.code == AppStrings.emailAlreadyUsed) {
        throw EmailAlreadyUsedAuthException();
      } else {
        throw GenericAuthException();
      }
    } catch (e) {
      throw GenericAuthException();
    }
  }
}
