import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_repository/user_repository.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

final signUpProvider =
    StateNotifierProvider<SignUpNotifier, SignUpState>((ref) {
  final userRepository = ref.watch(userRepositoryProvider);
  return SignUpNotifier(userRepository);
});

class SignUpNotifier extends StateNotifier<SignUpState> {
  final UserRepository _userRepository;

  SignUpNotifier(this._userRepository) : super(SignUpInitial());

  void submit(MyUser user, String password) async {
    state = SignUpProcess();
    try {
      MyUser myUser = await _userRepository.signUp(user, password);
      await _userRepository.setUserData(myUser);
      state = SignUpSuccess();
    } catch (e) {
      state = const SignUpFailure('Error signing up. Please try again.');
    }
  }
}

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return FirebaseUserRepo();
});
