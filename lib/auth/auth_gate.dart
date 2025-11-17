import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:organiseyou/auth/auth_service.dart';
import 'package:organiseyou/screens/home_screen.dart';
import 'package:organiseyou/screens/login_screen.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthService>(
      builder: (context, authService, child) {
        if (authService.isLoggedIn) {
          return const HomeScreen();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
