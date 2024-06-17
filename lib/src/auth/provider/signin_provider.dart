import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_raho/entities/client/client_entity.dart';
import 'package:fit_raho/models/client/client_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final clientSignInProvider = Provider<ClientSignIn>((ref) => ClientSignIn());

class ClientSignIn {
  void submit(String email, String password) async {
    try {
      final auth = FirebaseAuth.instance;
      await auth.signInWithEmailAndPassword(email: email, password: password);
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final doc = await FirebaseFirestore.instance
            .collection('clients')
            .doc(user.uid)
            .get();
        Client.formEntity(ClientEntity.fromDocument(doc.data()!));
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
