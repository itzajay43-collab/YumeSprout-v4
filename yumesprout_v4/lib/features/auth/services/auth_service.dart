import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../models/user_model.dart';

class AuthService {
  AuthService._();

  static final AuthService instance = AuthService._();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final FirebaseFirestore _firestore =
      FirebaseFirestore.instance;

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  User? get currentUser => _auth.currentUser;

  Stream<User?> get authStateChanges =>
      _auth.authStateChanges();

  Future<UserModel?> signInWithGoogle() async {
    try {
      // Select Google account
      final GoogleSignInAccount? googleUser =
          await _googleSignIn.signIn();

      if (googleUser == null) {
        return null;
      }

      // Authentication tokens
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential =
          GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Firebase Login
      final userCredential =
          await _auth.signInWithCredential(
        credential,
      );

      final user = userCredential.user;

      if (user == null) {
        return null;
      }

      final doc =
          _firestore.collection('users').doc(user.uid);

      final snapshot = await doc.get();

      if (!snapshot.exists) {
        final newUser = UserModel(
          uid: user.uid,
          name: user.displayName ?? '',
          email: user.email ?? '',
          photoUrl: user.photoURL,
          level: 1,
          xp: 0,
          streak: 0,
          gardenLevel: 1,
          passportCities: 0,
        );

        await doc.set(newUser.toMap());

        return newUser;
      }

      return UserModel.fromMap(
        snapshot.data()!,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}