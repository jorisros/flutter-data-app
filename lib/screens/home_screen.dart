import 'package:flutter/material.dart';
import 'package:organiseyou/providers/dashboard_provider.dart';
import 'package:provider/provider.dart';
import 'package:organiseyou/widgets/side_menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
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
