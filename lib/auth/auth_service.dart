import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;

  Future<User?> createUser(String email, String password) async {
    try {
      final credentials = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      return credentials.user;
    } catch (e) {
      print("Something went wrong in your credentials");
    }
    return null;
  }

  Future<User?> loginUser(String email, String password) async {
    try {
      final credentials = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      return credentials.user;
    } catch (e) {
      print("Something went wrong in your credentials");
    }
    return null;
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print("Something went wrong in your credentials");
    }
  }
}
