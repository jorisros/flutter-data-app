import 'package:flutter/material.dart';
import 'package:organiseyou/auth/auth_service.dart';
import 'package:organiseyou/providers/dashboard_provider.dart';
import 'package:organiseyou/screens/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:organiseyou/widgets/side_menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dashboardProvider = Provider.of<DashboardProvider>(context);
    final title = dashboardProvider.selectedDashboard?.settings.name ??
        'Dashboard';

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: () {
              Provider.of<AuthService>(context, listen: false).logout();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              );
            },
          ),
        ],
      ),
      drawer: const SideMenu(),
      body: Consumer<DashboardProvider>(
        builder: (context, dashboardProvider, child) {
          final grid = dashboardProvider.selectedGrid;

          if (dashboardProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (grid == null) {
            return const Center(
                child: Text('Please select a grid from the side menu.'));
          }

          // Temporarily simplified view
          return const Center(
            child: Text('Table will be implemented here in the future.'),
          );
        },
      ),
    );
  }
}
