import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_repository/user_repository.dart';

import '../user_repository_provider/user_repository_provider.dart';

part 'auth_state.dart';

final authenticationProvider =
    StateNotifierProvider<AuthenticationNotifier, AuthenticationState>((ref) {
  return AuthenticationNotifier(ref.watch(userRepositoryProvider));
});

class AuthenticationNotifier extends StateNotifier<AuthenticationState> {
  final UserRepository userRepository;
  late final StreamSubscription<MyUser?> _userSubscription;

  AuthenticationNotifier(this.userRepository)
      : super(const AuthenticationState.unknown()) {
    _userSubscription = userRepository.user.listen((user) {
      _userChanged(user);
    });
  }

  void _userChanged(MyUser? user) {
    if (user != MyUser.empty) {
      state = AuthenticationState.authenticated(user!);
    } else {
      state = const AuthenticationState.unauthenticated();
    }
  }
}
