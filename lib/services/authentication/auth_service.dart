import 'package:beats_box/models/models_barrel.dart' show CustomAuthUser;
import 'package:beats_box/services/authentication/auth_provider.dart' show AuthProvider;
import 'package:beats_box/services/authentication/firebase_auth_provider.dart' show FirebaseAuthProvider;

class AuthService implements AuthProvider {
  final AuthProvider provider;

  const AuthService(this.provider);

  // This factory constructor is calling the default constructor above.
  factory AuthService.factoryFirebase() => AuthService(FirebaseAuthProvider());

  @override
  Future<void> initialize() => provider.initialize();

  @override
  CustomAuthUser? get currentUser => provider.currentUser;

  @override
  Future<CustomAuthUser> logIn({
    required String email,
    required String password,
  }) =>
      provider.logIn(email: email, password: password);

  @override
  Future<CustomAuthUser> signUp({
    required String email,
    required String password,
    required String fullName,
  }) =>
      provider.signUp(email: email, password: password, fullName: fullName);

  @override
  Future<void> logOut() => provider.logOut();
}
