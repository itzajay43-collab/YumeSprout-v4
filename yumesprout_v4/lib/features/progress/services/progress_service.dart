import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/progress_model.dart';

class ProgressService {
  ProgressService._();

  static final ProgressService instance = ProgressService._();

  final FirebaseFirestore _firestore =
      FirebaseFirestore.instance;

  final FirebaseAuth _auth =
      FirebaseAuth.instance;

  /// Get Progress From users/{uid}
  Future<ProgressModel?> getProgress() async {
    final user = _auth.currentUser;

    if (user == null) return null;

    final doc = await _firestore
        .collection('users')
        .doc(user.uid)
        .get();

    if (!doc.exists) return null;

    final data = doc.data()!;

    return ProgressModel.fromMap(data);
  }

  /// Save Progress Into users/{uid}
  Future<void> saveProgress(
      ProgressModel progress) async {
    final user = _auth.currentUser;

    if (user == null) return;

    await _firestore
        .collection('users')
        .doc(user.uid)
        .set(
          progress.toMap(),
          SetOptions(merge: true),
        );
  }
}