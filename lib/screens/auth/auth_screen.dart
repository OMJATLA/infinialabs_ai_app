import 'package:flutter/material.dart';
import 'package:infinialabs_ai/screens/auth/widgets/login_widget.dart';
import 'package:infinialabs_ai/screens/auth/widgets/sign_up_widget.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _isLoginScreen = true;

  void _switchToSignUp() => setState(() => _isLoginScreen = false);
  void _switchToLogin() => setState(() => _isLoginScreen = true);

  @override
  Widget build(BuildContext context) =>
      _isLoginScreen
          ? LogInWidget(onSignUpPressed: _switchToSignUp)
          : SignUpWidget(onLogInPressed: _switchToLogin);
}
