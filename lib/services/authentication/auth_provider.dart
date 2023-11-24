import "package:beats_box/models/models_barrel.dart" show CustomAuthUser;

abstract class AuthProvider {
  Future<void> initialize();

  CustomAuthUser? get currentUser;

  Future<CustomAuthUser> logIn({
    required String email,
    required String password,
  });

  Future<CustomAuthUser> signUp({
    required String email,
    required String password,
    required String fullName,
  });

  Future<void> logOut();
}
