import 'package:flutter/material.dart';
import 'package:organiseyou/providers/dashboard_provider.dart';
import 'package:organiseyou/screens/home_screen.dart';
import 'package:provider/provider.dart';

class DashboardSelectionScreen extends StatelessWidget {
  const DashboardSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select a Dashboard')),
      body: Consumer<DashboardProvider>(
        builder: (context, dashboardProvider, child) {
          final dashboards = dashboardProvider.dashboards;
          if (dashboards == null) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: dashboards.length,
            itemBuilder: (context, index) {
              final dashboard = dashboards[index];
              return ListTile(
                title: Text(dashboard['settings']['name'] ?? 'Unnamed Dashboard'),
                onTap: () {
                  dashboardProvider.selectDashboard(dashboard);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
