import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fit_raho/models/trainer/trainer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final trainerSignUpProvider = Provider<TrainerSignUp>(
  (ref) => TrainerSignUp(),
);

class TrainerSignUp {
  void submit(Trainer trainer, String password, File file) async {
    try {
      final auth = FirebaseAuth.instance;
      final result = await auth.createUserWithEmailAndPassword(
        email: trainer.email,
        password: password,
      );
      final userId = result.user!.uid;
      trainer.trainerId = userId;
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('trainer_images')
          .child('$userId.jpg');
      await storageRef.putFile(file);
      final imageUrl = await storageRef.getDownloadURL();
      trainer.imageUrl = imageUrl;
      await setUserData(trainer);
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> setUserData(Trainer trainer) async {
    try {
      await FirebaseFirestore.instance
          .collection('trainer')
          .doc(trainer.trainerId)
          .set(trainer.toEntity().toDocument());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
