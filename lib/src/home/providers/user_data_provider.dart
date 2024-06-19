import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit_raho/entities/client/client_entity.dart';
import 'package:fit_raho/entities/owner/owner_entity.dart';
import 'package:fit_raho/entities/trainer/trainer_entity.dart';
import 'package:fit_raho/models/client/client_model.dart';
import 'package:fit_raho/models/owner/owner_model.dart';
import 'package:fit_raho/models/trainer/trainer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userDataProvider =
    FutureProvider.family<dynamic, String>((ref, userId) async {
  final clientsDoc =
      await FirebaseFirestore.instance.collection('clients').doc(userId).get();
  if (clientsDoc.exists) {
    return Client.formEntity(ClientEntity.fromDocument(clientsDoc.data()!));
  }
  final ownersDoc =
      await FirebaseFirestore.instance.collection('owners').doc(userId).get();
  if (ownersDoc.exists) {
    return Owner.fromEntity(OwnerEntity.fromDocument(ownersDoc.data()!));
  }
  final trainersDoc =
      await FirebaseFirestore.instance.collection('trainers').doc(userId).get();
  if (trainersDoc.exists) {
    return Trainer.fromEntity(TrainerEntity.fromDocument(trainersDoc.data()!));
  }

  return null;
});
