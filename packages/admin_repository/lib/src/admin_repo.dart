import 'package:trainer_repository/trainer_repository.dart';
import 'package:user_repository/user_repository.dart';

import '../admin_repository.dart';

abstract class AdminRepo {
  Stream<Admin?> get owner;

  Future<List<MyUser?>> getUsers();

  Future<List<Trainer>> getTrainers();

  Future<void> addTrainer(Trainer trainer);

  Future<void> deleteTrainer(Trainer trainer);

  Future<void> updateTrainer(Trainer trainer);
}
