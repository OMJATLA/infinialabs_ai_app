part of 'app_init_bloc.dart';

sealed class AppInitState extends Equatable {
  const AppInitState();

  @override
  List<Object> get props => [];
}

final class AppInitInitial extends AppInitState {
  const AppInitInitial();
}

final class AppInitLoggedInState extends AppInitState {
  const AppInitLoggedInState();
}

final class AppInitLoggedOutState extends AppInitState {
  const AppInitLoggedOutState();
}
