import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:trainer_repository/trainer_repository.dart';
import 'package:user_repository/user_repository.dart';

import '../admin_repository.dart';

class FirebaseAdminRepo implements AdminRepo {
  final FirebaseAuth _firebaseAuth;
  final ownerCollection = FirebaseFirestore.instance.collection('owners');
  final trainerCollection = FirebaseFirestore.instance.collection('trainers');
  final userCollection = FirebaseFirestore.instance.collection('users');
  FirebaseAdminRepo({
    FirebaseAuth? firebaseAuth,
  }) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  @override
  Stream<Admin?> get owner {
    return _firebaseAuth.authStateChanges().asyncMap((firebaseUser) async {
      if (firebaseUser == null) {
        return Admin.empty;
      } else {
        final doc = await ownerCollection.doc(firebaseUser.uid).get();
        return Admin.fromEntity(AdminEntity.fromDocument(doc.data()!));
      }
    });
  }

  @override
  Future<void> addTrainer(Trainer trainer) async {
    try {
      final firebaseTrainerRepo = FirebaseTrainerRepo();
      await firebaseTrainerRepo.setTrainerData(trainer);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> deleteTrainer(Trainer trainer) async {
    try {
      await trainerCollection.doc(trainer.trainerId).delete();
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<Trainer>> getTrainers() async {
    try {
      return await trainerCollection.get().then((value) => value.docs
          .map((e) => Trainer.fromEntity(TrainerEntity.fromDocument(e.data())))
          .toList());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<MyUser>> getUsers() async {
    try {
      return await userCollection.get().then((value) => value.docs
          .map((e) => MyUser.formEntity(MyUserEntity.fromDocument(e.data())))
          .toList());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> updateTrainer(Trainer trainer) async {
    try {
      await trainerCollection
          .doc(trainer.trainerId)
          .update(trainer.toEntity().toDocument());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
