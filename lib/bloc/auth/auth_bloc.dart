import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinialabs_ai/data%20provider/auth/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(const AuthInitial()) {
    on<AuthSignUpEvent>(_onAuthSignUpEvent);
    on<AuthLogInEvent>(_onAuthLogInEvent);
  }

  Future<void> _onAuthSignUpEvent(
    AuthSignUpEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(const AuthSigningUpState());

      await authRepository.requestSignUp(signUpMap: event.signUpMap);

      emit(const AuthSignedUpState());
    } catch (_) {
      emit(const AuthSignUpFailedState());
    }
  }

  Future<void> _onAuthLogInEvent(
    AuthLogInEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(const AuthLoggingInState());

      await authRepository.requestLogIn(logInMap: event.logInMap);

      emit(const AuthLoggedInState());
    } catch (_) {
      emit(const AuthLoginFailedState());
    }
  }
}
