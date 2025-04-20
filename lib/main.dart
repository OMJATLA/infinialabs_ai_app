import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:infinialabs_ai/app_repository_widget.dart';
import 'package:infinialabs_ai/bloc/app_init/app_init_bloc.dart';
import 'package:infinialabs_ai/bloc_widget.dart';
import 'package:infinialabs_ai/screens/dashboard/dashboard_screen.dart';
import 'package:infinialabs_ai/screens/auth/auth_screen.dart';
import 'package:infinialabs_ai/theme/app_theme_data.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(const AppRepositoryWidget(child: BlocWidget(child: MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightThemeData,
      home: const Scaffold(body: SafeArea(child: _InfinialabsAiApp())),
    );
  }
}

class _InfinialabsAiApp extends StatelessWidget {
  const _InfinialabsAiApp();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppInitBloc, AppInitState>(
      builder: (context, state) {
        if (state is AppInitLoggedOutState) {
          return const AuthScreen();
        } else if (state is AppInitLoggedInState) {
          return const DashboardScreen();
        }
        return const AuthScreen();
      },
    );
  }
}
