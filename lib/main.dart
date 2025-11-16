import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth_service.dart';
import 'login_screen.dart';
import 'package:myapp/screens/home_screen.dart';
import 'package:myapp/settings_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => SettingsService()),
        ChangeNotifierProvider(
          create: (context) => AuthService(context.read<SettingsService>()),
        ),
        // Assuming AppProvider is also a ChangeNotifier
        // ChangeNotifierProvider(create: (_) => AppProvider()), 
      ],
      child: MaterialApp(
        title: 'Dynamic App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const AuthCheck(),
      ),
    );
  }
}

class AuthCheck extends StatelessWidget {
  const AuthCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthService>(
      builder: (context, authService, child) {
        return FutureBuilder<bool>(
          future: authService.isAuthenticated(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            }
            if (snapshot.hasData && snapshot.data!) {
              return const HomeScreen();
            }
            return const LoginScreen();
          },
        );
      },
    );
  }
}
