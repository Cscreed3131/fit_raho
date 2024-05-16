// Define the StreamProvider
import 'package:fit_raho/provider/user_repository_provider/user_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_repository/user_repository.dart';

final userProvider = StreamProvider<MyUser?>((ref) {
  final userRepo = ref.watch(userRepositoryProvider);
  return userRepo.user;
});
