import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinialabs_ai/bloc/app_init/app_init_bloc.dart';
import 'package:infinialabs_ai/bloc/auth/auth_bloc.dart';
import 'package:infinialabs_ai/data%20provider/auth/auth_repository.dart';

class BlocWidget extends StatelessWidget {
  final Widget child;

  const BlocWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) => AppInitBloc(
                authRepository: RepositoryProvider.of<AuthRepository>(context),
              )..add(const AppInitCheckEvent()),
        ),
        BlocProvider(
          create:
              (context) => AuthBloc(
                authRepository: RepositoryProvider.of<AuthRepository>(context),
              ),
        ),
      ],
      child: child,
    );
  }
}
