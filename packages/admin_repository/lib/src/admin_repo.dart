import 'package:trainer_repository/trainer_repository.dart';
import 'package:user_repository/user_repository.dart';

abstract class FirebaseAdminRepo {
  Future<List<MyUser?>> getUsers();

  Future<List<Trainer>> getTrainers();

  Future<void> addTrainer(Trainer trainer);

  Future<void> deleteTrainer(Trainer trainer);

  Future<void> updateTrainer(Trainer trainer);
}
