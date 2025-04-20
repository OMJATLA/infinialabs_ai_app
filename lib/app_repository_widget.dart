import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinialabs_ai/data%20provider/auth/auth_app_repository.dart';
import 'package:infinialabs_ai/data%20provider/auth/auth_repository.dart';
import 'package:infinialabs_ai/data%20provider/user/user_app_repository.dart';
import 'package:infinialabs_ai/data%20provider/user/user_repository.dart';

class AppRepositoryWidget extends StatelessWidget {
  final Widget child;

  const AppRepositoryWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(
          create: (context) => AuthAppRepository(),
        ),
        RepositoryProvider<UserRepository>(
          create: (context) => UserAppRepository(),
        ),
      ],
      child: child,
    );
  }
}
