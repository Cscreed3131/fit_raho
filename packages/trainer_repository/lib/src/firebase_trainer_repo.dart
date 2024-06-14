import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:trainer_repository/src/entities/entities.dart';
import 'package:trainer_repository/src/models/models.dart';
import 'package:trainer_repository/src/trainer_repo.dart';

class FirebaseTrainerRepo implements TrainerRepository {
  final FirebaseAuth _firebaseAuth;
  final userCollection = FirebaseFirestore.instance.collection('trainer');
  FirebaseTrainerRepo({
    FirebaseAuth? firebaseAuth,
  }) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  @override
  Stream<Trainer?> get trainer {
    return _firebaseAuth.authStateChanges().asyncMap((firebaseUser) async {
      if (firebaseUser == null) {
        return Trainer.empty;
      } else {
        final doc = await userCollection.doc(firebaseUser.uid).get();
        return Trainer.fromEntity(TrainerEntity.fromDocument(doc.data()!));
      }
    });
  }

  @override
  Future<void> signIn(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<Trainer> signUp(Trainer mytrainer, String password) async {
    try {
      UserCredential user = await _firebaseAuth.createUserWithEmailAndPassword(
          email: mytrainer.email, password: password);
      mytrainer.trainerId = user.user!.uid;
      return mytrainer;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> logOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<void> setTrainerData(Trainer myTrainer) async {
    try {
      await userCollection
          .doc(myTrainer.trainerId)
          .set(myTrainer.toEntity().toDocument());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
