import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

final signInProvider =
    StateNotifierProvider<SignInNotifier, SignInState>((ref) {
  final userRepository = ref.watch(userRepositoryProvider);
  return SignInNotifier(userRepository);
});

class SignInNotifier extends StateNotifier<SignInState> {
  final UserRepository _userRepository;

  SignInNotifier(this._userRepository) : super(SignInInitial());

  Future<void> signIn(String email, String password) async {
    try {
      await _userRepository.signIn(email, password);
      state = SignInSuccess();
    } catch (e) {
      state = SignInFailure();
    }
  }

  Future<void> signOut() async {
    await _userRepository.logOut();
    state = SignInInitial();
  }
}

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return FirebaseUserRepo();
});
