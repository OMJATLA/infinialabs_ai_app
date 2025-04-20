part of 'app_init_bloc.dart';

sealed class AppInitEvent extends Equatable {
  const AppInitEvent();

  @override
  List<Object> get props => [];
}

final class AppInitCheckEvent extends AppInitEvent {
  const AppInitCheckEvent();
}

final class AppInitLogOffEvent extends AppInitEvent {
  const AppInitLogOffEvent();
}

final class AppInitLogInEvent extends AppInitEvent {
  const AppInitLogInEvent();
}
