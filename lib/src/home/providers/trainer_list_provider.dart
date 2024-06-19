import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit_raho/entities/trainer/trainer_entity.dart';
import 'package:fit_raho/models/trainer/trainer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final trainersProvider = FutureProvider<List<Trainer>>((ref) async {
  final querySnapshot =
      await FirebaseFirestore.instance.collection('trainers').get();
  return querySnapshot.docs
      .map((doc) => Trainer.fromEntity(TrainerEntity.fromDocument(
            doc.data(),
          )))
      .toList();
});
