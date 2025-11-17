import 'package:flutter/material.dart';
import 'package:organiseyou/providers/dashboard_provider.dart';
import 'package:organiseyou/screens/dashboard_selection_screen.dart';
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
          return FutureBuilder(
            future: Provider.of<DashboardProvider>(context, listen: false)
                .loadDashboards(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              return Consumer<DashboardProvider>(
                builder: (context, dashboardProvider, child) {
                  if (dashboardProvider.dashboards!.length > 1) {
                    return const DashboardSelectionScreen();
                  } else {
                    return const HomeScreen();
                  }
                },
              );
            },
          );
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
