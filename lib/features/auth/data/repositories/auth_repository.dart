import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';

import '../../../../core/failure/failure.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuthInstance = FirebaseAuth.instance;
  final GoogleSignIn _googleAuthInstance = GoogleSignIn();

  Future<Either<Failure, User?>> signInWithGoogle() async {
    await _googleAuthInstance.signOut();
    try {
      final GoogleSignInAccount? googleUser =
          await _googleAuthInstance.signIn();
      if (googleUser == null) return const Right(null);

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

      await openBox();

      // User details
      return Right(userCredential.user);
    } catch (e) {
      return Left(Failure(errorMessage: e.toString()));
    }
  }

  Future<void> openBox() async {
    final User? user = FirebaseAuth.instance.currentUser;
    try {
      await Hive.openBox(user!.uid);
    } catch (e) {
      // Handle box opening errors.
      print('Error opening Hive box: $e');
    }
  }

// Future<void> signOut() async {
//   await _googleAuthInstance.signOut();
//   await _firebaseAuthInstance.signOut();
// }
}
