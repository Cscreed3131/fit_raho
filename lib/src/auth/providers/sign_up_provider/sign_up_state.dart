part of 'sign_up_provider.dart';

sealed class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];
}

final class SignUpInitial extends SignUpState {}

class SignUpSuccess extends SignUpState {}

class SignUpFailure extends SignUpState {
  const SignUpFailure(String errorMessage);
}

class SignUpProcess extends SignUpState {}
