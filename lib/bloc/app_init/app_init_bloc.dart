import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinialabs_ai/data%20provider/auth/auth_repository.dart';

part 'app_init_event.dart';
part 'app_init_state.dart';

class AppInitBloc extends Bloc<AppInitEvent, AppInitState> {
  final AuthRepository authRepository;

  AppInitBloc({required this.authRepository}) : super(const AppInitInitial()) {
    on<AppInitCheckEvent>(_onAppInitCheckEvent);
    on<AppInitLogInEvent>(_onAppInitLogInEvent);
    on<AppInitLogOffEvent>(_onAppInitLogOffEvent);
  }

  Future<void> _onAppInitCheckEvent(
    AppInitCheckEvent event,
    Emitter<AppInitState> emit,
  ) async {
    try {
      final token = await authRepository.getAuthToken();

      emit(
        token == null
            ? const AppInitLoggedOutState()
            : const AppInitLoggedInState(),
      );
    } catch (_) {
      emit(const AppInitLoggedOutState());
    }
  }

  void _onAppInitLogInEvent(
    AppInitLogInEvent event,
    Emitter<AppInitState> emit,
  ) {
    emit(const AppInitLoggedInState());
  }

  void _onAppInitLogOffEvent(
    AppInitLogOffEvent event,
    Emitter<AppInitState> emit,
  ) {
    emit(const AppInitLoggedOutState());
  }
}
