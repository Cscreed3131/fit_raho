import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fit_raho/models/client/client_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final clientSignUpProvider = Provider<ClientSignUp>((ref) => ClientSignUp());

class ClientSignUp {
  void submit(Client client, String password, File file) async {
    try {
      final auth = FirebaseAuth.instance;
      final result = await auth.createUserWithEmailAndPassword(
        email: client.email,
        password: password,
      );
      final userId = result.user!.uid;
      client.userId = userId;
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('client_images')
          .child('$userId.jpg');
      await storageRef.putFile(file);
      final imageUrl = await storageRef.getDownloadURL();
      client.imageUrl = imageUrl;
      await setUserData(client);
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> setUserData(Client client) async {
    try {
      await FirebaseFirestore.instance
          .collection('clients')
          .doc(client.userId)
          .set(client.toEntity().toDocument());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
