part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthSignUpEvent extends AuthEvent {
  final Map<String, dynamic> signUpMap;

  const AuthSignUpEvent({required this.signUpMap});

  @override
  List<Object> get props => [signUpMap];
}

class AuthLogInEvent extends AuthEvent {
  final Map<String, dynamic> logInMap;

  const AuthLogInEvent({required this.logInMap});

  @override
  List<Object> get props => [logInMap];
}
