part of 'user_load_cubit.dart';

sealed class UserLoadState extends Equatable {
  const UserLoadState();

  @override
  List<Object> get props => [];
}

final class UserLoadInitial extends UserLoadState {
  const UserLoadInitial();
}

final class UserLoadingState extends UserLoadState {
  const UserLoadingState();
}

final class UserLoadedState extends UserLoadState {
  // const UserLoadedState(this.user);

  // final User user;

  // @override
  // List<Object> get props => [user];
}

final class UserLoadFailedState extends UserLoadState {
  const UserLoadFailedState();
}
