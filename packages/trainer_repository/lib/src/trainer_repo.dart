import 'models/models.dart';

abstract class TrainerRepo {
  Stream<Trainer?> get trainer;

  Future<Trainer> signUp(Trainer myUser, String password);

  Future<void> setTrainerData(Trainer myTrainer);

  Future<void> signIn(String email, String password);

  Future<void> logOut();
}
