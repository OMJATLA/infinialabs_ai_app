part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

// Initial state
final class AuthInitial extends AuthState {
  const AuthInitial();
}

// Sign Up states
final class AuthSigningUpState extends AuthState {
  const AuthSigningUpState();
}

final class AuthSignedUpState extends AuthState {
  const AuthSignedUpState();
}

final class AuthSignUpFailedState extends AuthState {
  const AuthSignUpFailedState();
}

final class AuthLoggingInState extends AuthState {
  const AuthLoggingInState();
}

final class AuthLoggedInState extends AuthState {
  const AuthLoggedInState();
}

final class AuthLoginFailedState extends AuthState {
  const AuthLoginFailedState();
}
