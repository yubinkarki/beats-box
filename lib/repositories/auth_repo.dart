import 'package:google_sign_in/google_sign_in.dart';

const List<String> scopes = ['email'];

class AuthRepo {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: scopes);

  Future<GoogleSignInAccount?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        return null;
      }

      return googleUser;
    } catch (e) {
      rethrow;
    }
  }
}
