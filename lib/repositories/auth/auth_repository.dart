import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthRepository {
  final auth = FirebaseAuth.instance;

  Future<void> signInWithCredentials(
      {@required String email, @required String password}) {
    return auth.signInWithEmailAndPassword(email: email, password: password);
  }

  User get getUser => auth.currentUser;

  bool get isLoggedIn => auth.currentUser != null;

  Future<void> signOut() => auth.signOut();
}
