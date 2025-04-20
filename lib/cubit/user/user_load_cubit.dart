import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:infinialabs_ai/data%20provider/user/user_repository.dart';

part 'user_load_state.dart';

class UserLoadCubit extends Cubit<UserLoadState> {
  final UserRepository userRepository;

  UserLoadCubit({required this.userRepository})
    : super(const UserLoadInitial());

  Future<void> loadUser() async {
    try {
      emit(const UserLoadingState());

      await userRepository.getUserProfile();

      emit(UserLoadedState());
    } catch (_) {
      emit(const UserLoadFailedState());
    }
  }
}
