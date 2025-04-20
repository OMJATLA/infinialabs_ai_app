import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinialabs_ai/cubit/user/user_load_cubit.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _DashBoardWidget();
  }
}

class _DashBoardWidget extends StatelessWidget {
  const _DashBoardWidget();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserLoadCubit, UserLoadState>(
      builder: (context, state) {
        if (state is UserLoadedState) {
          return const Text('user loaded');
        } else if (state is UserLoadFailedState) {
          return const Text('User load failed');
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
