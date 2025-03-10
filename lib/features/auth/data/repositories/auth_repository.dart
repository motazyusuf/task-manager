import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuthInstance = FirebaseAuth.instance;
  final GoogleSignIn _googleAuthInstance = GoogleSignIn();

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser =
          await _googleAuthInstance.signIn();
      if (googleUser == null) return null;

      // Get Authentication Tokens
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // GoogleAuth credentials to be passed to FireAuth
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await _firebaseAuthInstance.signInWithCredential(credential);

      //User details
      return userCredential.user;
    } catch (e) {
      print("Error signing in: $e");
      return null;
    }
  }
}
