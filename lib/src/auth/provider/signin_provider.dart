import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userSignInProvider = Provider<UserSignIn>((ref) => UserSignIn());

class UserSignIn {
  void submit(String email, String password) async {
    try {
      final auth = FirebaseAuth.instance;
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      log(e.toString());
    }
  }
}
