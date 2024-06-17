import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fit_raho/models/owner/owner_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ownerSignUpProvider = Provider<OwnerSignUp>(
  (ref) => OwnerSignUp(),
);

class OwnerSignUp {
  void submit(Owner owner, String password, File file) async {
    try {
      final auth = FirebaseAuth.instance;
      final result = await auth.createUserWithEmailAndPassword(
        email: owner.email,
        password: password,
      );
      final ownerId = result.user!.uid;
      owner.ownerId = ownerId;
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('owner_images')
          .child('$ownerId.jpg');
      await storageRef.putFile(file);
      final imageUrl = await storageRef.getDownloadURL();
      owner.imageUrl = imageUrl;
      await setUserData(owner);
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> setUserData(Owner owner) async {
    try {
      await FirebaseFirestore.instance
          .collection('owners')
          .doc(owner.ownerId)
          .set(owner.toEntity().toDocument());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
