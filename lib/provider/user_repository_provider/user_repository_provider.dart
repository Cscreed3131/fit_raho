import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_repository/user_repository.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return FirebaseUserRepo();
});
